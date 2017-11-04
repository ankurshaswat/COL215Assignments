----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.08.2017 18:25:40
-- Design Name: 
-- Module Name: ringer - struc
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

entity ringer is
--  Port ( );
PORT (
	clock : IN std_logic;
	count : OUT std_logic_vector (3 downto 0));

end ringer;

architecture struc of ringer is
SIGNAL ring : std_logic_vector (3 downto 0) := "1110";
BEGIN

	process(clock)
	begin
	IF (clock='1' AND clock'EVENT) THEN 
	CASE ring IS
                    WHEN "1110" => ring <="1101";
                    WHEN "1101" => ring <="1011";
                    WHEN "1011" => ring <="0111";
                    WHEN others => ring <="1110";
                END CASE;
                count <= ring;
	END IF;
	
	end process;
end struc;
