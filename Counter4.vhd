----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:31:52 11/23/2012 
-- Design Name: 
-- Module Name:    Counter4 - Behavioral 
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

entity Counter4 is
    GENERIC(N : Integer := 4);
    Port ( clock_in : in  STD_LOGIC;
           en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           counter_val : out  STD_LOGIC_VECTOR (1 downto 0));
end Counter4;

architecture Behavioral of Counter4 is
signal counted : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal signal0,signal1 :  STD_LOGIC := '0';
signal n_reset : STD_LOGIC ;

begin
n_reset <= not reset;
counter_val <= counted;
CP: PROCESS(clock_in,counted,n_reset)
begin

if n_reset = '1' then
		counted <= (others => '0');
	elsif rising_edge(clock_in) AND en = '1' then
		counted <= std_logic_vector(unsigned(counted) + 1);
	end if;

END PROCESS;

end Behavioral;

