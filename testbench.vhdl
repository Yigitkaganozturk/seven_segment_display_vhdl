library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
component deneme is
    Port ( sw : in std_logic_vector (15 downto 0);
           clk : in std_logic;
           seg : out std_logic_vector (6 downto 0);
           an : out std_logic_vector (3 downto 0));
end component deneme;

signal an : std_logic_vector(3 downto 0);
signal seg : std_logic_vector(6 downto 0);
signal sw : std_logic_vector(15 downto 0);
signal clk: std_logic := '0';
constant period : time := 0.1ns;

begin
UUT: deneme port map(
an => an,
seg => seg,
sw => sw,
clk => clk
);
clock : process
begin
wait for period /2;
clk <= '1';
wait for period/2;
clk <= '0';
end process;
test : Process
begin
sw <= "0000000000110000";
wait for 0.25 ms;
sw <= "0011000001110010";
wait for 0.25 ms;
sw <= "0010001000010000";
wait for 0.25 ms;
sw <= "1010101111001101";
wait for 0.25 ms ;
end process;
