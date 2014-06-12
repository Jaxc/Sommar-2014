library IEEE;

use IEEE.std_logic_1164.all;

entity enc_wrapper is
port (clk,reset,din: IN BIT;
	vdin,dout: OUT BIT);
end enc_wrapper;

ARCHITECTURE flipflops of enc_wrapper is

	signal reset_buf,din_buf,vdin_buf,dout_buf : BIT;

	component enc
	PORT(clk, reset, din: IN BIT;
		vdin, dout: OUT BIT); 
	END COMPONENT;

BEGIN

process(clk)
begin
	if clk'event and clk = '1' then
		reset_buf <= reset;
		din_buf <= din;
		vdin <= vdin_buf;
		dout <= dout_buf;
	end if;
end process;

e1:enc
port map(clk,reset_buf,din_buf,vdin_buf,dout_buf);

end flipflops;
