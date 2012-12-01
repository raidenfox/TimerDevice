----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:20 11/24/2012 
-- Design Name: 
-- Module Name:    GestoreAnodi - Behavioral 
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

entity GestoreAnodi is
    Port ( counter4out : in  STD_LOGIC_VECTOR (1 downto 0);
           enabledigit : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0));
end GestoreAnodi;

architecture Behavioral of GestoreAnodi is
signal anodes_out : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
anodes <= not anodes_out or not enabledigit;

SP: PROCESS(counter4out,enabledigit)
begin
	CASE counter4out IS
		WHEN "00" => anodes_out <= x"1";
		WHEN "01" => anodes_out <= x"2";
		WHEN "10" => anodes_out <= x"4";
		WHEN "11" => anodes_out <= x"8";
		WHEN others => anodes_out <= (others => '0');
	END CASE;
END PROCESS;

end Behavioral;

