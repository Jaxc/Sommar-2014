USE WORK.const.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_STD.all;

entity BCH_TB is
end BCH_TB;

architecture Testbench of BCH_TB is

component sim
PORT(clk, reset: IN BIT;
	din: IN BIT_VECTOR(0 TO k-1); 
	error: IN BIT_VECTOR(0 TO n-1);
	vdin, vdout, wrongNow, wrong: OUT BIT; 
	-- if wrong=1 - the circuit does not work properly 
	dout: OUT BIT_VECTOR(0 TO k-1));
end component;

signal clk : BIT;
signal reset : BIT;
signal din : BIT_VECTOR(0 to k-1);
signal error: BIT_VECTOR(0 to n-1);
signal vdin : BIT;
signal vdout : BIT;
signal wrongNow : BIT;
signal wrong : BIT;
signal dout : BIT_VECTOR(0 to k-1);
	
begin

clkproess:process
begin
	clk <= '1';
	wait for 5 ns;
	clk <= '0';
	wait for 5 ns;
end process;

reset <= '1', '0' after 55 ns;

din(0 to 7) <= "10101010";
din(8 to k-1) <= (others => '0');

error(4 to n-1) <= (others => '0');--,(others => '0') after 1314 ns;
error(0 to 3) <= "1000", "0000" after 10 us;

BCH_sim : sim
port map( 
		clk => clk,
		reset => reset,
		din => din,
		error => error,
		vdin => vdin,
		vdout => vdout,
		wrongNow => wrongNow,
		wrong => wrong,
		dout => dout);

assert (wrongNow /= '1') report "Error occurred" severity warning;		
		
end Testbench;
