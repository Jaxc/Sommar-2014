library IEEE;

use IEEE.std_logic_1164.all;

entity dec_wrapper is
port (clk,reset,din: IN BIT;
	vdout,dout: OUT BIT);
end dec_wrapper;

ARCHITECTURE flipflops of dec_wrapper is

	signal reset_buf,din_buf,vdout_buf,dout_buf : BIT;

	component dec
	PORT(clk, reset, din: IN BIT;
		vdout, dout: OUT BIT); 
	END COMPONENT;

BEGIN

process(clk)
begin
	if clk'event and clk = '1' then
		reset_buf <= reset;
		din_buf <= din;
		vdout <= vdout_buf;
		dout <= dout_buf;
	end if;
end process;

e1:dec
port map(clk,reset_buf,din_buf,vdout_buf,dout_buf);

end flipflops;
