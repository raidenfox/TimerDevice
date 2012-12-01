----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:55:26 11/29/2012 
-- Design Name: 
-- Module Name:    FourBitSum - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBitSum is
    Port ( sum1 : in  STD_LOGIC_VECTOR (3 downto 0);
           sum2 : in  STD_LOGIC_VECTOR (3 downto 0);
           ris1 : out  STD_LOGIC_VECTOR (3 downto 0);
           carry_out : out  STD_LOGIC);
end FourBitSum;

architecture Behavioral of FourBitSum is
    
	 COMPONENT half_adder
    PORT(
         s1 : IN  std_logic;
         s2 : IN  std_logic;
         r : OUT  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT full_adder
    PORT(
         s1 : IN  std_logic;
         s2 : IN  std_logic;
         c_in : IN  std_logic;
         r_out : OUT  std_logic;
         c_out : OUT  std_logic
        );
    END COMPONENT;

signal comm : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal word1,word2 : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal result : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	 
begin

word1 <= sum1;
word2 <= sum2;
carry_out <= comm(3);
HAX: half_adder port map (word1(0),word2(0),result(0),comm(0));

GEN1:for i in 1 to 3 generate
begin
FAX: full_adder port map(word1(i),word2(i),comm(i-1),result(i),comm(i));
end generate;

ris1 <= result;
end Behavioral;

