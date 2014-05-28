-- File generated by bch.exe program.
-- The simulation file for BCH code (255,247), t=1

-- GF(2^8) is generated by polynomial [1+x+...] - 101110001;
-- The simulation file - encoder & decoder & error generating circuit
-- for enc.vhd and dec.vhd files.

	-- buffer for encoder data in
	USE WORK.const.ALL;
ENTITY encBuf IS
PORT(clk, pe: IN BIT;
	din: IN BIT_VECTOR(0 TO k-1); 
	dout: OUT BIT);
END encBuf;

ARCHITECTURE encBufa OF encBuf IS
	SIGNAL buf: BIT_VECTOR(0 TO k-1);
  BEGIN
	dout<= buf(k-1);	
  PROCESS BEGIN 
	WAIT UNTIL clk'EVENT AND clk='1';
	IF pe='1' THEN
		buf<= din;
	ELSE
		buf<= '0' & buf(0 TO k-2); 	
	END IF;
  END PROCESS;
END encBufa;
-----------------------------------------------------------------------------------

	-- buffer for error - corrupting transmitted data
	USE WORK.const.ALL;
ENTITY errBuf IS
PORT(clk, pe: IN BIT;
	din: IN BIT_VECTOR(0 TO n-1); 
	dout: OUT BIT);
END errBuf;

ARCHITECTURE errBufa OF errBuf IS
	SIGNAL buf: BIT_VECTOR(0 TO n-1);
  BEGIN
	dout<= buf(n-1);	
  PROCESS BEGIN 
	WAIT UNTIL clk'EVENT AND clk='1';
	IF pe='1' THEN
		buf<= din;
	ELSE
		buf<= '0' & buf(0 TO n-2); 	
	END IF;
  END PROCESS;
END errBufa;
-----------------------------------------------------------------------------------

	-- buffer for comparing data before the encoder with data after the decoder
	USE WORK.const.ALL;
ENTITY comBuf IS
PORT(clk, din: IN BIT; 
	dout: OUT BIT);
END comBuf;

ARCHITECTURE comBufa OF comBuf IS
	CONSTANT bufSize: INTEGER:= 259;  
	SIGNAL buf: BIT_VECTOR(0 TO bufSize-1);
  BEGIN
	dout<= buf(bufSize-1);	
  PROCESS BEGIN 
	WAIT UNTIL clk'EVENT AND clk='1';
	buf<= din & buf(0 TO bufSize-2);
  END PROCESS;
END comBufa;

-----------------------------------------------------------------------------------

	-- buffer for storing decoder output data
	USE WORK.const.ALL;
ENTITY decBuf IS
PORT(clk, ce, din: IN BIT; 
	dout: OUT BIT_VECTOR(0 TO k-1));
END decBuf;

ARCHITECTURE decBufa OF decBuf IS  
	SIGNAL buf: BIT_VECTOR(0 TO k-1);
  BEGIN
	dout<= buf;	
  PROCESS BEGIN 
	WAIT UNTIL clk'EVENT AND clk='1';
	IF ce='1' THEN
		buf<= din & buf(0 TO k-2);
	ELSE
		buf<= buf;
	END IF;
  END PROCESS;
END decBufa;

-----------------------------------------------------------------------------------

	USE WORK.const.ALL;
ENTITY sim IS
PORT(clk, reset: IN BIT;
	din: IN BIT_VECTOR(0 TO k-1); 
	error: IN BIT_VECTOR(0 TO n-1);
	vdin, vdout, wrongNow, wrong: OUT BIT; 
	-- if wrong=1 - the circuit does not work properly 
	dout: OUT BIT_VECTOR(0 TO k-1));
END sim;

ARCHITECTURE sima OF sim IS 
	SIGNAL encIn, encOut, decIn, err, decOut: BIT; 
	SIGNAL vdin1, vdout1, encBPe, encBOut, comBOut: BIT; 
		-- valid din, dout - enable shifting data
	SIGNAL wrongIn, vdinPrev, vdin0_1, resetDec, clkEnc: BIT;

  	COMPONENT enc			
		PORT(clk, reset, din: IN BIT;
			vdin, dout: OUT BIT); 
		END COMPONENT;
		FOR ALL : enc USE ENTITY WORK.enc (enca);
	COMPONENT dec
		PORT(clk, reset, din: IN BIT;
			vdout, dout: OUT BIT); 
		END COMPONENT;
		FOR ALL : dec USE ENTITY WORK.dec (deca); 
	COMPONENT encBuf
		PORT(clk, pe: IN BIT; din: IN BIT_VECTOR(0 TO k-1); 
			dout: OUT BIT);
		END COMPONENT;
		FOR ALL : encBuf USE ENTITY WORK.encBuf (encBufa); 
	COMPONENT errBuf
		PORT(clk, pe: IN BIT; din: IN BIT_VECTOR(0 TO n-1); 
			dout: OUT BIT);
		END COMPONENT;
		FOR ALL : errBuf USE ENTITY WORK.errBuf (errBufa); 
	COMPONENT comBuf
		PORT(clk, din: IN BIT; dout: OUT BIT);
		END COMPONENT;
		FOR ALL : comBuf USE ENTITY WORK.comBuf (comBufa); 
	COMPONENT decBuf
		PORT(clk, ce, din: IN BIT; dout: OUT BIT_VECTOR(0 TO k-1));
		END COMPONENT;
		FOR ALL : decBuf USE ENTITY WORK.decBuf (decBufa);
	
  BEGIN
   	e1: enc
		PORT MAP (clkEnc, reset, encIn, vdin1, encOut);
	d1: dec
		PORT MAP (clk, resetDec, decIn, vdout1, decOut);

	encBPe<= NOT vdin1;
	encB: encBuf
		PORT MAP (clkEnc, encBPe, din, encBOut);
	encIn<= encBOut AND NOT reset;
	vdin0_1<= (NOT vdinPrev AND vdin1) OR reset;
	errB: errBuf
		PORT MAP (clkEnc, vdin0_1, error, err);
	comB: comBuf
		PORT MAP (clkEnc, encIn, comBOut);
	decB: decBuf
		PORT MAP (clk, vdout1, decOut, dout);

	decIn<= (encOut XOR err) AND NOT reset; -- corrupting transmitted data

	clkEnc<= clk;
		
	wrongIn<=  (decOut XOR comBOut) AND NOT reset AND vdout1; 
	vdout<= vdout1;
	vdin<= vdin1;
	

  PROCESS BEGIN
	WAIT UNTIL clk'EVENT AND clk='1';
	-- wrong ones set always 1
	IF reset='1' THEN
		wrong<= '0';
	ELSIF wrongIn='1' THEN
		wrong<= '1';
	END IF;
	wrongNow<= wrongIn;
	resetDec<= reset;
  END PROCESS;

  PROCESS BEGIN
	WAIT UNTIL clkEnc'EVENT AND clkEnc='1';
	vdinPrev<= vdin1;
  END PROCESS;
END sima;

