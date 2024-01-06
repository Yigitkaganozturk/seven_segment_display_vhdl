library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity deneme is
    Port ( sw : in std_logic_vector (15 downto 0);
           clk : in std_logic;
           seg : out std_logic_vector (6 downto 0);
           an : out std_logic_vector (3 downto 0));
end deneme;

architecture Behavioral of deneme is
signal divider: std_logic_vector (19 downto 0):="00000000000000000000";
signal swchose: std_logic_vector (3 downto 0):="0000";
begin

process(clk)
begin
 if(rising_edge(clk)) then
 divider <= divider + 1;
 end if;
end process;

with swchose select
 seg <= "0000001" when "0000", --0
        "1001111" when "0001", --1
        "0010010" when "0010", --2
        "0000110" when "0011", --3
        "1001100" when "0100", --4
        "0100100" when "0101", --5
        "0100000" when "0110", --6
        "0001101" when "0111", --7
        "0000000" when "1000", --8
        "0000100" when "1001", --9
        "0000010" when "1010", --A
        "1100000" when "1011", --B
        "0110001" when "1100", --C
        "1000010" when "1101", --D
        "0110000" when "1110", --E
        "0111000" when "1111", --F
        "1111111" when others; --default

with divider(19 downto 18) select
swchose <= sw(15 downto 12) when "11",
           sw(11 downto 8) when "10",
           sw(7 downto 4) when "01",
           sw(3 downto 0) when others;

process(divider(19 downto 18))
begin
case divider(19 downto 18) is
when "11" => an <= "0111"; 
when "10" => an <= "1011"; 
when "01" => an <= "1101"; 
when others => an <= "1110";
end case;
end process;

end Behavioral;
