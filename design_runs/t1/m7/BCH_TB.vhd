USE WORK.const.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_STD.all;

library STD;
use STD.textio.all;

entity BCH_TB is
end BCH_TB;

architecture Testbench of BCH_TB is
constant Size : integer := 100000;
type n_array_type is array (0 to Size) of STD_LOGIC_VECTOR(n downto 0);
type k_array_type is array (0 to Size) of STD_LOGIC_VECTOR(k downto 0);
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

 impure function loadin (fileName : string)
	return k_array_type is
	file objectFile : text open read_mode is fileName;
	variable memory : k_array_type;
	variable L : line;
	variable index : natural := 0;
	variable myChar : character;
begin
	while not endfile(objectFile) loop
		readline(objectFile, L);
		for i in k downto 0 loop
			read(L, myChar);
			memory(index)(i) := bin(myChar);
		end loop;
		index := index + 1;
	end loop;
	return memory;
end loadin;

impure function loaderror (	fileName : string)
	return n_array_type is
	file objectFile : text open read_mode is fileName;
	variable memory : n_array_type;
	variable L : line;
	variable index : natural := 0;
	variable myChar : character;
begin
	while not endfile(objectFile) loop
		readline(objectFile, L);
		for i in n-1 downto 0 loop
			read(L, myChar);
			memory(index)(i) := bin(myChar);
		end loop;
		index := index + 1;
	end loop;
return memory;
end loaderror;

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

signal current_error : BIT_VECTOR(n-1 downto 0);
signal current_in : BIT_VECTOR(k-1 downto 0);

constant error : n_array_type := loaderror(string'("error.txt"));
constant din : k_array_type := loadin(string'("in.txt"));

signal in_counter :integer range 0 to size-1;
	
begin

clkproess:process
begin
	clk <= '1';
	wait for 1 ns;
	clk <= '0';
	wait for 1 ns;
	wait for 5 ns;
	clk <= '0';
	wait for 5 ns;
end process;

reset <= '1', '0' after 55 ns;
in_generate:for i in 0 to n-1 generate
current_error(i) <= to_bit(error(in_counter)(i));
end generate in_generate;

error_generate:for i in 0 to k-1 generate
current_in(i) <= to_bit(din(in_counter)(i));
end generate error_generate;

--din(0 to 7) <= "10101010";
--din(8 to k-1) <= (others => '0');

--error(4 to n-1) <= (others => '0');--,(others => '0') after 1314 ns;
--error(0 to 3) <= "1000", "0000" after 10 us;
din(0 to 7) <= "10101010";
din(8 to k-1) <= (others => '0');

error(4 to n-1) <= (others => '0');--,(others => '0') after 1314 ns;
error(0 to 3) <= "1000", "0000" after 10 us;

BCH_sim : sim
port map( 
		clk => clk,
		reset => reset,
		din => current_in,
		error => current_error,
		din => din,
		error => error,
		vdin => vdin,
		vdout => vdout,
		wrongNow => wrongNow,
		wrong => wrong,
		dout => dout);

process(vdin,reset)
begin
	if reset = '1' then
		in_counter <= 0;
	elsif (vdin'event) and (vdin = '0') then
		in_counter <= in_counter +1;
	end if;
end process;
		
assert (in_counter /= 99999) report "simulation over" severity failure;		

assert (wrongNow /= '1') report "Error occurred" severity warning;		
		
end Testbench;
