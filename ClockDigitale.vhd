----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:56 11/29/2012 
-- Design Name: 
-- Module Name:    ClockDigitale - Behavioral 
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

entity ClockDigitale is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end ClockDigitale;

architecture Behavioral of ClockDigitale is

COMPONENT Display7 is
    GENERIC(freq_in : Integer := 50000000;
				freq_out : Integer := 400);
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           valuetodisplay : in  STD_LOGIC_VECTOR (15 downto 0);
           anodi : out  STD_LOGIC_VECTOR (3 downto 0);
           catodi : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT Counter9
    PORT(
         clk : IN  std_logic;
         cifra1 : IN  std_logic_vector(3 downto 0);
         risultato : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
signal coll : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal increment : STD_LOGIC_VECTOR(3 downto 0) := "0001"; 
begin

C1: Counter9 port map(clock,increment,coll);
C2: Display7 port map(clock,reset,coll,anodes,cathodes);

end Behavioral;

