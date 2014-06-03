-- File generated by bch.exe program.
-- The encoder for BCH code (127,120), t=1

-- GF(2^7) is generated by polynomial [1+x+...] - 11000001;
<<<<<<< HEAD
-------------------------------------------------------------------------
-- File enc.vhd consists following entities: enc, ering, ecount
--------------------------------------------------------------------------

-- LFSR for encoder
	USE WORK.const.ALL;
ENTITY ering IS
PORT (clk, rll, din: IN BIT;
	dout: OUT BIT); --output serial data
END ering;

ARCHITECTURE eringa OF ering IS
	SIGNAL rin, rout: BIT_VECTOR(0 TO nk-1); -- ring register
	SIGNAL rin0: BIT;
  BEGIN
	dout<= rout(nk-1); 
 	rin0 <= (din XOR rout(nk-1)) AND rll;	

	rin(0)<= rin0;
=======
-------------------------------------------------------------------------
-- File enc.vhd consists following entities: enc, ering, ecount
--------------------------------------------------------------------------

-- LFSR for encoder
	USE WORK.const.ALL;
ENTITY ering IS
PORT (clk, rll, din: IN BIT;
	dout: OUT BIT); --output serial data
END ering;

ARCHITECTURE eringa OF ering IS
	SIGNAL rin, rout: BIT_VECTOR(0 TO nk-1); -- ring register
	SIGNAL rin0: BIT;
  BEGIN
	dout<= rout(nk-1); 
 	rin0 <= (din XOR rout(nk-1)) AND rll;	

	rin(0)<= rin0;
>>>>>>> ee8530b2979565393fb6f0aa0107e723fc8512fa
	rin(1)<= rout(0) XOR rin0;
	rin(2)<= rout(1);
	rin(3)<= rout(2);
	rin(4)<= rout(3);
	rin(5)<= rout(4);
	rin(6)<= rout(5);
	-- Polynomial generating encoder: 1+a1*x+a2*x^2+...
	--11000001
	-- Number of XOR gates= 1
<<<<<<< HEAD

  PROCESS BEGIN 
	WAIT UNTIL clk'EVENT AND clk='1';
	rout<= rin;
  END PROCESS;
END eringa;
--------------------------------------------------------------------------
-- COUNTER MODULO n FOR ENCODER BCH CODE (n,k)  
--  rll-ring loop lock - control signal for LFSR

	USE WORK.const.ALL;
ENTITY ecount IS
PORT (clk, reset: IN BIT;
	vdin: OUT BIT);  
END ecount;

ARCHITECTURE ecounta OF ecount IS
	SIGNAL cout: BIT_VECTOR(0 TO m-1); -- cout in GF(2^m); cout= L^count 
	SIGNAL vdinR, vdinS, vdin1: BIT;
BEGIN
	vdinR<= cout(0) AND cout(1) AND cout(2) AND cout(3) AND cout(4) AND cout(5) AND NOT cout(6); 
		-- reset vdin if cout==k-1
	vdinS<= ( cout(0) AND NOT cout(1) AND NOT cout(2) AND NOT cout(3) AND NOT cout(4) AND NOT cout(5) AND cout(6)) OR reset; 
		-- vdinS=1 if cout==n-1
	vdin<= vdin1 AND NOT reset;

  PROCESS BEGIN
	WAIT UNTIL clk'EVENT AND clk='1';
	IF vdinR='1' THEN
		vdin1<= '0';
	ELSIF vdinS='1' THEN
		vdin1<= '1';
	END IF;
  END PROCESS;	

  PROCESS BEGIN -- increment or reset cout in ring, cout=L^count
	WAIT UNTIL clk'EVENT AND clk='1';
	cout(0)<= cout(m-1) OR reset;
=======

  PROCESS BEGIN 
	WAIT UNTIL clk'EVENT AND clk='1';
	rout<= rin;
  END PROCESS;
END eringa;
--------------------------------------------------------------------------
-- COUNTER MODULO n FOR ENCODER BCH CODE (n,k)  
--  rll-ring loop lock - control signal for LFSR

	USE WORK.const.ALL;
ENTITY ecount IS
PORT (clk, reset: IN BIT;
	vdin: OUT BIT);  
END ecount;

ARCHITECTURE ecounta OF ecount IS
	SIGNAL cout: BIT_VECTOR(0 TO m-1); -- cout in GF(2^m); cout= L^count 
	SIGNAL vdinR, vdinS, vdin1: BIT;
BEGIN
	vdinR<= cout(0) AND cout(1) AND cout(2) AND cout(3) AND cout(4) AND cout(5) AND NOT cout(6); 
		-- reset vdin if cout==k-1
	vdinS<= ( cout(0) AND NOT cout(1) AND NOT cout(2) AND NOT cout(3) AND NOT cout(4) AND NOT cout(5) AND cout(6)) OR reset; 
		-- vdinS=1 if cout==n-1
	vdin<= vdin1 AND NOT reset;

  PROCESS BEGIN
	WAIT UNTIL clk'EVENT AND clk='1';
	IF vdinR='1' THEN
		vdin1<= '0';
	ELSIF vdinS='1' THEN
		vdin1<= '1';
	END IF;
  END PROCESS;	

  PROCESS BEGIN -- increment or reset cout in ring, cout=L^count
	WAIT UNTIL clk'EVENT AND clk='1';
	cout(0)<= cout(m-1) OR reset;
>>>>>>> ee8530b2979565393fb6f0aa0107e723fc8512fa
	cout(1)<= (cout(0) XOR cout(m-1)) AND NOT reset;
	cout(2)<= cout(1) AND NOT reset;
	cout(3)<= cout(2) AND NOT reset;
	cout(4)<= cout(3) AND NOT reset;
	cout(5)<= cout(4) AND NOT reset;
	cout(6)<= cout(5) AND NOT reset;
<<<<<<< HEAD
  END PROCESS;
END ecounta;

-----------------------------------------------------------------
--		ENCODER

	USE WORK.const.ALL;
ENTITY enc IS
PORT (clk, reset, din: IN BIT; 
	vdin, dout: OUT BIT); --output serial data
END enc;  -- vdin - valid data in - to enable external data shifting

ARCHITECTURE enca OF enc IS
	SIGNAL vdin1, rin, rout, rll: BIT; 
		-- rll-ring loop lock, pe-parallel enable din

	COMPONENT ecount --counter encoder
		PORT(clk, reset: IN BIT; vdin: OUT BIT); 
		END COMPONENT;
		FOR ALL: ecount USE ENTITY WORK.ecount (ecounta);
	COMPONENT ering --ring for encoder
		PORT(clk, rll,  din: IN BIT; dout: OUT BIT); 
		END COMPONENT;
		FOR ALL: ering USE ENTITY WORK.ering (eringa);
  BEGIN
	c1: ecount
		PORT MAP (clk, reset, vdin1);
	r1: ering
		PORT MAP (clk, rll, rin, rout);
	rin<= din AND NOT reset;
	rll<= vdin1 AND NOT reset;
	vdin<= vdin1;

  PROCESS BEGIN
	WAIT UNTIL clk'EVENT AND clk='1';
	dout<= (NOT vdin1 AND rout) OR (vdin1 AND rin);
  END PROCESS;
END enca;
=======
  END PROCESS;
END ecounta;

-----------------------------------------------------------------
--		ENCODER

	USE WORK.const.ALL;
ENTITY enc IS
PORT (clk, reset, din: IN BIT; 
	vdin, dout: OUT BIT); --output serial data
END enc;  -- vdin - valid data in - to enable external data shifting

ARCHITECTURE enca OF enc IS
	SIGNAL vdin1, rin, rout, rll: BIT; 
		-- rll-ring loop lock, pe-parallel enable din

	COMPONENT ecount --counter encoder
		PORT(clk, reset: IN BIT; vdin: OUT BIT); 
		END COMPONENT;
		FOR ALL: ecount USE ENTITY WORK.ecount (ecounta);
	COMPONENT ering --ring for encoder
		PORT(clk, rll,  din: IN BIT; dout: OUT BIT); 
		END COMPONENT;
		FOR ALL: ering USE ENTITY WORK.ering (eringa);
  BEGIN
	c1: ecount
		PORT MAP (clk, reset, vdin1);
	r1: ering
		PORT MAP (clk, rll, rin, rout);
	rin<= din AND NOT reset;
	rll<= vdin1 AND NOT reset;
	vdin<= vdin1;

  PROCESS BEGIN
	WAIT UNTIL clk'EVENT AND clk='1';
	dout<= (NOT vdin1 AND rout) OR (vdin1 AND rin);
  END PROCESS;
END enca;
>>>>>>> ee8530b2979565393fb6f0aa0107e723fc8512fa
