----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:24 11/24/2012 
-- Design Name: 
-- Module Name:    Display7 - Behavioral 
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

entity Display7 is
    GENERIC(freq_in : Integer := 50000000;
				freq_out : Integer := 400);
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           valuetodisplay : in  STD_LOGIC_VECTOR (15 downto 0);
           anodi : out  STD_LOGIC_VECTOR (3 downto 0);
           catodi : out  STD_LOGIC_VECTOR (7 downto 0));
end Display7;

architecture Behavioral of Display7 is
    COMPONENT ClockDivider
    GENERIC(freq_in : Integer := 50000000;
				freq_out : Integer := 5000000);
    PORT(
         clock_in : IN  std_logic;
         reset : IN  std_logic;
         clock_out : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT Counter4
    PORT(
         clock_in : IN  std_logic;
         en : IN  std_logic;
         reset : IN  std_logic;
         counter_val : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT GestoreAnodi is
    Port ( counter4out : in  STD_LOGIC_VECTOR (1 downto 0);
           enabledigit : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0));
	 END COMPONENT;
	 
	 COMPONENT GestoreCatodi
    PORT(
         counter4 : IN  std_logic_vector(1 downto 0);
         dots : IN  std_logic_vector(3 downto 0);
         valoredisplay : IN  std_logic_vector(15 downto 0);
         cathodes : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

signal clockapp : STD_LOGIC;  
signal countedapp: STD_LOGIC_VECTOR (1 downto 0);
signal dots_ingresso: STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal endigit: STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
endigit <= "1111";
dots_ingresso <= "0100";

C1: ClockDivider GENERIC MAP(freq_in,freq_out) port map(clock,reset,clockapp);
C2: Counter4 port map(clock,clockapp,reset,countedapp);
C3: GestoreAnodi port map(countedapp,endigit,anodi);
C4: GestoreCatodi port map(countedapp,dots_ingresso,valuetodisplay,catodi);
end Behavioral;

