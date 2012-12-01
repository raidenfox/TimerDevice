----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:08 11/22/2012 
-- Design Name: 
-- Module Name:    ClockDivider - Behavioral 
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

entity ClockDivider is
    GENERIC(freq_in : Integer := 50000000;
				freq_out : Integer := 5000000);
    Port ( clock_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clock_out : out  STD_LOGIC);
end ClockDivider;

architecture Behavioral of ClockDivider is
constant div : Integer := freq_in/freq_out -1;
signal value,not_reset : STD_LOGIC := '0';
begin

not_reset <= not reset;
clock_out <= value;

CC: PROCESS(clock_in, not_reset)
variable counter : integer range 0 to div := 0;
begin

if not_reset = '1' then
		counter := 0;
		value <= '0';
	elsif clock_in'event and clock_in = '1' then
		if counter = div then
			value <=  '1';
			counter := 0;
		else
			value <=  '0';
			counter := counter + 1;
		end if;
	end if;

END PROCESS;


end Behavioral;

