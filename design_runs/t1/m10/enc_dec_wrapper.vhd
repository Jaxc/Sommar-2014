library IEEE;

use IEEE.std_logic_1164.all;

entity enc_dec_wrapper is
port (clk,reset,din: IN BIT;
	vdin,dout: OUT BIT);
end enc_dec_wrapper;

ARCHITECTURE flipflops of enc_dec_wrapper is

	signal din_buf,vdin_buf : BIT;
	signal vdout_buf,dout_buf : BIT;
	signal enc_out,Dec_in : BIT;
	

	component enc
	PORT(clk, reset, din: IN BIT;
		vdin, dout: OUT BIT); 
	END COMPONENT;

	component dec
	PORT(clk, reset, din: IN BIT;
		vdout, dout: OUT BIT); 
	END COMPONENT;

BEGIN

process(clk)
begin
	if clk'event and clk = '1' then
		dec_in <= enc_out;
		if vdin_buf =  '1' then
			din_buf <= din;
		end if;

		if vdout_buf = '1' then
			dout <= dout_buf;
		end if;

	end if;
end process;

e1:enc
port map(clk,reset,din_buf,vdin_buf,enc_out);

d1:dec
port map(clk,reset,dec_in,vdout_buf,dout_buf);

end flipflops;
