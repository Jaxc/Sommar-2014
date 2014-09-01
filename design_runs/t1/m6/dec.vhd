-- File generated by bch.exe program.
-- The decoder for BCH code (63,57), t=1

-- GF(2^6) is generated by polynomial [1+x+...] - 1100001;
-------------------------------------------------------------
-- counter modulo n

	USE WORK.const.ALL;
ENTITY dcount IS
PORT (clk, reset: IN BIT; 
	pe, vdout, vdout1: OUT BIT);
END dcount;

ARCHITECTURE dcounta OF dcount IS	
	SIGNAL cout: BIT_VECTOR(0 TO m-1);
	SIGNAL vdout11, vdoutS, vdoutR, nFirst: BIT;
  BEGIN
	pe<=  cout(0) AND NOT cout(1) AND NOT cout(2) AND NOT cout(3) AND NOT cout(4) AND NOT cout(5);
		-- pe=1 if count=0
	vdoutS<= nFirst AND ( NOT cout(0) AND cout(1) AND NOT cout(2) AND NOT cout(3) AND NOT cout(4) AND NOT cout(5));
		-- vdout=1 if count=1
	vdoutR<= reset OR ( cout(0) AND cout(1) AND cout(2) AND cout(3) AND cout(4) AND cout(5));
		-- vdout=1 if count=k+1
	vdout1<= vdout11;

  PROCESS BEGIN -- increment or reset cout in ring, cout=L^count
	WAIT UNTIL clk'EVENT AND clk='1';
	IF reset='1' THEN
		nFirst<= '0';
	ELSIF vdoutR='1' THEN
		nFirst<= '1';
	END IF;

	IF vdoutR='1' THEN
		vdout11<= '0';
	ELSIF vdoutS='1' THEN
		vdout11<= '1';
	END IF;
	vdout<= vdout11; -- delay by one clock

	cout(0)<= cout(m-1) OR reset;
	cout(1)<= (cout(0) XOR cout(m-1)) AND NOT reset;
	cout(2)<= cout(1) AND NOT reset;
	cout(3)<= cout(2) AND NOT reset;
	cout(4)<= cout(3) AND NOT reset;
	cout(5)<= cout(4) AND NOT reset;
  END PROCESS;
END dcounta;

----------------------------------------------------------------------------
--	syndrome circuit

	USE WORK.const.ALL;
ENTITY dsyn1 IS
PORT (clk, pe ,din: IN BIT;
	dout1: OUT BIT_VECTOR(0 TO m-1));
END dsyn1;

ARCHITECTURE dsyn1a OF dsyn1 IS
	SIGNAL syn: BIT_VECTOR(0 TO 5);
  BEGIN
	dout1<= syn;
  PROCESS BEGIN
	WAIT UNTIL clk'EVENT AND clk='1';
	IF pe='1' THEN
	  syn(0)<= din;
	  syn(1 TO 5)<= "00000";
	ELSE
	syn(0)<= din XOR syn(5);
	syn(1)<= syn(0) XOR syn(5);
	syn(2)<= syn(1);
	syn(3)<= syn(2);
	syn(4)<= syn(3);
	syn(5)<= syn(4);
	END IF;
  END PROCESS;
END dsyn1a;


----------------------------------------------------------------------------
--	Chien's searching circuit

	USE WORK.const.ALL;
ENTITY dch1 IS
PORT (clk, pe: IN BIT;
	din: IN BIT_VECTOR(0 TO m-1);
	dout: OUT BIT_VECTOR(0 TO m-1));
END dch1;

ARCHITECTURE dch1a OF dch1 IS
	SIGNAL chin: BIT_VECTOR(0 TO m-1); -- registers input
	SIGNAL ch: BIT_VECTOR(0 TO 5); -- ch registers and optimization 
  BEGIN
	dout<= ch(0 TO m-1);
	chin(0)<= ch(5);
	chin(1)<= ch(0) XOR ch(5);
	chin(2)<= ch(1);
	chin(3)<= ch(2);
	chin(4)<= ch(3);
	chin(5)<= ch(4);
  PROCESS BEGIN
	WAIT UNTIL clk'EVENT AND clk='1';
	IF pe='1' THEN
	  ch(0 TO m-1)<= din;
	ELSE
	  ch(0 TO m-1)<= chin;
	END IF;
  END PROCESS;
	-- number XOR gates= 1;
END dch1a;


----------------------------------------------------------------------
-- circuit for storing data to be corrected or already corrected

	library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_STD.all;
USE WORK.const.ALL;
ENTITY dbuf IS
PORT (clk, err, vdout, din: IN BIT;
dout: OUT BIT);
END dbuf;
ARCHITECTURE dbufa OF dbuf IS
SIGNAL buf: BIT_VECTOR(0 TO n);
SIGNAL cnt,last_cnt : integer range 0 to n+2;
SIGNAL reg_ena,last_reg_ena,dout_buf,dout_buf2 : BIT_VECTOR(0 to n);

CONSTANT zero_vec : BIT_VECTOR(0 to n-1) := (others => '0');

component bufcount
PORT(clk: in BIT; count : OUT STD_LOGIC_VECTOR(m-1 downto 0));
end component;
BEGIN
process(cnt,clk)
begin
	if ( clk'EVENT AND clk='1') then
		reg_ena(1 to n) <= reg_ena(0 to n-1);
		if reg_ena(0 to n-1) = zero_vec then
			reg_ena(0) <= '1';
--			assert false report "happens" severity warning;
		else 
			reg_ena(0) <= '0';
--			assert false report "not happens" severity warning;
		end if;
	end if;
end process;


	registers:for i in 0 to n generate
		process(clk)
			begin
			if reg_ena(i) = '1' then
				buf(i) <= din;
			end if;
		end process;
end generate;

PROCESS (clk)
	BEGIN
	if ( clk'EVENT AND clk='1') then
		
		registers:for i in 0 to n generate
			begin
			if reg_ena(i) = '1' then
				buf(i) <= din;
			end if;

		end generate;

		MUX : for i in 0 to n-1 generate
		begin
			dout_buf(i) <= buf(i) and reg_ena(i);
			dout_buf2(i+1) <= dout_buf(i) or dout_buf2(i)
		end generate;
		
--		dout_buf2 <= buf(cnt);
--		dout_buf <= dout_buf2;
		dout <= (dout_buf2(n) XOR err) and vdout;
		last_reg_ena <= reg_ena;
		end if;
		last_cnt <= cnt;

	end if;
end process;

END dbufa;

----------------------------------------------------------------------
--		decoder for one error (hamming code)
--		DECODER HAMMING CODE

	USE WORK.const.ALL;
ENTITY dec IS
PORT (clk, reset, din: IN BIT; 
	vdout, dout: OUT BIT); 
END dec;

ARCHITECTURE deca OF dec IS
	SIGNAL  pe, err, vdout1, din_reset: BIT;
	--pe -parallel enable syn->ch;  er - correct error,
	--vdout - valid data out - remember data register 
	SIGNAL syn1, ch1, ch_and: BIT_VECTOR(0 TO m-1);

	COMPONENT dcount -- counter decoder 
		PORT(clk, reset: IN BIT; pe, vdout, vdout1: OUT BIT); 
		END COMPONENT;
		FOR ALL: dcount USE ENTITY WORK.dcount (dcounta);
	COMPONENT dsyn1 -- syndrome calculating circuit 
		PORT (clk, pe, din: IN BIT;
			dout1: OUT BIT_VECTOR(0 TO m-1)); 
		END COMPONENT;
		FOR ALL: dsyn1 USE ENTITY WORK.dsyn1 (dsyn1a);
	COMPONENT dch1 -- error finding circuit (Chien's ring)
		PORT (clk, pe: IN BIT; 
			din: BIT_VECTOR(0 TO m-1);
			dout: OUT BIT_VECTOR(0 TO m-1)); 
		END COMPONENT;
		FOR ALL: dch1 USE ENTITY WORK.dch1 (dch1a);
	COMPONENT dbuf -- buffer shift registers 
		PORT (clk, err, vdout, din: IN BIT; 
			dout: OUT BIT); 
		END COMPONENT;
		FOR ALL: dbuf USE ENTITY WORK.dbuf (dbufa);
  BEGIN
	count: dcount
		PORT MAP (clk, reset, pe, vdout, vdout1);
	s1: dsyn1
		PORT MAP (clk, pe, din_reset, syn1);
	h1: dch1
		PORT MAP (clk, pe, syn1, ch1);	
	b1: dbuf
		PORT MAP (clk, err, vdout1, din_reset, dout);

	din_reset<= din AND NOT reset;
	err<= ch_and(m-1);
		-- err<= not ch1(0) and ch1(1) and ch1(2) and ...	
	ch_and(0)<= ch1(0);
	gen:
	FOR i IN 1 TO m-1 GENERATE
	  ch_and(i)<= ch_and(i-1) AND NOT ch1(i);
	END GENERATE;
END deca;
