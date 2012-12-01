----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:55 11/29/2012 
-- Design Name: 
-- Module Name:    Counter9 - Behavioral 
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
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter9 is
	 GENERIC(N1: STD_LOGIC_VECTOR (3 downto 0) := "1001";N2: STD_LOGIC_VECTOR (3 downto 0) := "0101");
    Port ( clk : STD_LOGIC;
			  cifra1 : in  STD_LOGIC_VECTOR (3 downto 0);
			  seconds : out  STD_LOGIC_VECTOR (7 downto 0);
           risultato : out  STD_LOGIC_VECTOR (15 downto 0));
end Counter9;

architecture Behavioral of Counter9 is

	 COMPONENT FourBitSum
    PORT(
         sum1 : IN  std_logic_vector(3 downto 0);
         sum2 : IN  std_logic_vector(3 downto 0);
         ris1 : OUT  std_logic_vector(3 downto 0);
			carry_out : out  STD_LOGIC
        );
    END COMPONENT;

signal retroazione,ris,ris2,ris3,ris4,ris5,ris6: std_logic_vector(3 downto 0) := (others => '0');
signal incremento,incremento2,incremento3,incremento4,incremento5,incremento6 : std_logic_vector(3 downto 0) := (others => '0');
signal result : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal counter,secondi : Integer := 0;
signal secondo2,minuto1,minuto2,ora1,ora2 : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal carry :STD_LOGIC_VECTOR (5 downto 0) := (others => '0');

begin
seconds <= conv_std_logic_vector(secondi, 8);
incremento <= cifra1;
risultato <= result;
result(3 downto 0) <= ris3;
result(7 downto 4) <= ris4;
result(11 downto 8) <= ris5;
result(15 downto 12) <= ris6;
S1: FourBitSum port map(retroazione,incremento,ris,carry(0));
S2: FourBitSum port map(secondo2,incremento2,ris2,carry(1));
M1: FourBitSum port map(minuto1,incremento3,ris3,carry(2));
M2: FourBitSum port map(minuto2,incremento4,ris4,carry(3));
H1: FourBitSum port map(ora1,incremento5,ris5,carry(4));
H2: FourBitSum port map(ora2,incremento6,ris6,carry(5));
 
P:PROCESS(clk)
begin
if rising_edge(clk) then
counter <= counter+1;
	if counter = 100000000 then
	counter <= 0;
		retroazione <= ris;
	secondi <= secondi +1;
		if ris = N1 then
		retroazione <= "1111";
		incremento2 <= "0001";
		secondo2 <= ris2;
			if ris2 = N2 then
			secondo2 <= "1111";
			incremento3 <= "0001";
			minuto1 <= ris3;
			secondi <= 0;
				if ris3 = N1 then
				minuto1 <= "1111";
				incremento4 <= "0001";
				minuto2 <= ris4;
					if ris4 = N2 then
					minuto2 <= "1111";
					incremento5 <= "0001";
					ora1 <= ris5;
						if ris5 = N1 then
							ora1 <= "1111";
							incremento6 <= "0001";
							ora2 <= ris6;
	end if;						
	end if;		
	end if;			
	end if;
	end if;
	end if;
end if;
end process;
end Behavioral;

