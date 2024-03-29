----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2017 08:20:05
-- Design Name: 
-- Module Name: display - struc
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
--  Port ( );
PORT (
	result: in std_logic_vector(15 downto 0);
	ring_counter : IN std_logic_vector (3 downto 0);
	cathode : OUT std_logic_vector (6 downto 0)
	);

end display;

architecture struc of display is
SIGNAL sig : std_logic_vector(3 downto 0):="0000";
begin

	PROCESS (ring_counter,result)
		BEGIN
			CASE ring_counter IS
				WHEN "1110" => sig <= result(3 downto 0);
				WHEN "1101" => sig <= result(7 downto 4);
				WHEN "1011" => sig <= result(11 downto 8);
				WHEN others => sig <= result(15 downto 12);
			END CASE;	
		END PROCESS;
		
	tocathode: ENTITY WORK.vector_to_cathode(struc)
	PORT MAP(to_display=>sig,res=>cathode);


end struc;
