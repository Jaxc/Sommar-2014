-- File generated by bch.exe program.
-- The constant package for BCH code (31,16), t=3
-- Option= 2,  Interleave= 1, -- with optimization= 1.
-- GF(2^5) is generated by polynomial [1+x+...] - 101001;
-- Constant necessary for decoder and encoder

PACKAGE   const IS
	CONSTANT m: INTEGER:= 5;
	CONSTANT n: INTEGER:= 31;  -- n= 2^m -1  -size of block
	CONSTANT k: INTEGER:= 16;  -- BCH code (n,k) -no. of information bits
	CONSTANT nk: INTEGER:= 15; -- nk=n-k
	CONSTANT t: INTEGER:= 3;  -- no. of errors to be corrected

	CONSTANT sizea: INTEGER:= 2; -- size of counter ca
	CONSTANT sizeb: INTEGER:= 4; -- size of counter cb 
		-- count = iteration* cb + ca
	CONSTANT sizel: INTEGER:= 3; 
		-- size of l integer (degree of error polynomial BMA)
END const;	

