----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:58 11/24/2012 
-- Design Name: 
-- Module Name:    GestoreCatodi - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GestoreCatodi is
    Port ( counter4 : in  STD_LOGIC_VECTOR (1 downto 0);
           dots : in  STD_LOGIC_VECTOR (3 downto 0);
           valoredisplay : in  STD_LOGIC_VECTOR (15 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end GestoreCatodi;

architecture Behavioral of GestoreCatodi is

constant zero   : std_logic_vector(6 downto 0) := "1000000";
constant one    : std_logic_vector(6 downto 0) := "1111001"; 
constant two    : std_logic_vector(6 downto 0) := "0100100"; 
constant three  : std_logic_vector(6 downto 0) := "0110000"; 
constant four   : std_logic_vector(6 downto 0) := "0011001"; 
constant five   : std_logic_vector(6 downto 0) := "0010010"; 
constant six    : std_logic_vector(6 downto 0) := "0000010"; 
constant seven  : std_logic_vector(6 downto 0) := "1111000"; 
constant eight  : std_logic_vector(6 downto 0) := "0000000"; 
constant nine   : std_logic_vector(6 downto 0) := "0010000"; 
constant a   	 : std_logic_vector(6 downto 0) := "0001000"; 
constant b      : std_logic_vector(6 downto 0) := "0000011"; 
constant c      : std_logic_vector(6 downto 0) := "1000110"; 
constant d      : std_logic_vector(6 downto 0) := "0100001"; 
constant e      : std_logic_vector(6 downto 0) := "0000110"; 
constant f      : std_logic_vector(6 downto 0) := "0001110";

alias cifra1 is valoredisplay (3 downto 0);
alias cifra2 is valoredisplay (7 downto 4);
alias cifra3 is valoredisplay (11 downto 8);
alias cifra4 is valoredisplay (15 downto 12);

signal cathodes_valout : STD_LOGIC_VECTOR (6 downto 0);
signal cathodes_out : STD_LOGIC_VECTOR (7 downto 0);
signal nibble : STD_LOGIC_VECTOR (3 downto 0);

begin

NIBBLEP: PROCESS(valoredisplay,counter4)
BEGIN 
	case counter4 is
		when "00" => nibble <= cifra1;
		when "01" => nibble <= cifra2;
		when "10" => nibble <= cifra3;
		when "11" => nibble <= cifra4;
		when others => nibble <= "0000";
	END CASE;
END PROCESS;

CATHODESP: PROCESS(nibble)
BEGIN
	case nibble is
		when "0000" => cathodes_valout <= zero; 
      when "0001" => cathodes_valout <= one; 
      when "0010" => cathodes_valout <= two; 
      when "0011" => cathodes_valout <= three; 
      when "0100" => cathodes_valout <= four; 
      when "0101" => cathodes_valout <= five; 
      when "0110" => cathodes_valout <= six; 
      when "0111" => cathodes_valout <= seven; 
      when "1000" => cathodes_valout <= eight; 
      when "1001" => cathodes_valout <= nine; 
      when "1010" => cathodes_valout <= a; 
      when "1011" => cathodes_valout <= b; 
      when "1100" => cathodes_valout <= c; 
      when "1101" => cathodes_valout <= d; 
      when "1110" => cathodes_valout <= e; 
      when "1111" => cathodes_valout <= f;
		when others => cathodes_valout <= (others => '0');
	END CASE;
END PROCESS;

cathodes_out <= not dots(to_integer(unsigned(counter4))) & cathodes_valout;
cathodes <= cathodes_out;
end Behavioral;

