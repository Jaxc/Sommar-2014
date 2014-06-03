--USE WORK.const.ALL;
USE WORK.config.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_STD.all;

library STD;
use STD.textio.all;

entity BCH_TB is
end BCH_TB;

architecture Testbench of BCH_TB is
constant Size : integer := 100000;
type Operand_array is array (Size downto 0) of std_logic_vector(31 downto 0);
type OpCode_array is array (Size downto 0) of std_logic_vector(3 downto 0);


component sim
PORT(clk, reset: IN BIT;
	din: IN BIT_VECTOR(0 TO k-1); 
	error: IN BIT_VECTOR(0 TO n-1);
	vdin, vdout, wrongNow, wrong: OUT BIT; 
	-- if wrong=1 - the circuit does not work properly 
	dout: OUT BIT_VECTOR(0 TO k-1));
end component;

 function bin (
	myChar : character)
	return std_logic is
	variable bin : std_logic;
begin
	case myChar is
		when '0' => bin := '0';
		when '1' => bin := '1';
		when 'x' => bin := '0';
		when others => assert (false) report "no binary character read" severity failure;
	end case;
	return bin;
end bin;

 function loadOperand (
	fileName : string)
	return Operand_array is
	file objectFile : text open read_mode is fileName;
	variable memory : Operand_array;
	variable L : line;
	variable index : natural := 0;
	variable myChar : character;
begin
	while not endfile(objectFile) loop
		readline(objectFile, L);
		for i in 31 downto 0 loop
			read(L, myChar);
			memory(index)(i) := bin(myChar);
		end loop;
		index := index + 1;
	end loop;
	return memory;
end loadOperand;

function loadOpCode (
	fileName : string)
	return OpCode_array is
	file objectFile : text open read_mode is fileName;
	variable memory : OpCode_array;
	variable L : line;
	variable index : natural := 0;
	variable myChar : character;
begin
	while not endfile(objectFile) loop
		readline(objectFile, L);
		for i in 3 downto 0 loop
			read(L, myChar);
			memory(index)(i) := bin(myChar);
		end loop;
		index := index + 1;
	end loop;
return memory;
end loadOpCode;

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
