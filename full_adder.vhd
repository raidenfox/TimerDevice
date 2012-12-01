----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:44:10 11/29/2012 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
    Port ( s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           r_out : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

	 COMPONENT half_adder
    PORT(
         s1 : IN  std_logic;
         s2 : IN  std_logic;
         r : OUT  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
signal prop,prop2 : STD_LOGIC := '0';
signal r_fin,c_fin : STD_LOGIC := '0';
begin
HA1: half_adder port map(s1,s2,prop,prop2);
HA2: half_adder port map(prop,c_in,r_fin,c_fin);

r_out <= r_fin;
c_out <= prop2 or c_fin;

end Behavioral;

