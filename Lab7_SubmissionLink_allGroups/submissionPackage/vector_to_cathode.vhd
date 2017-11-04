----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2017 16:19:02
-- Design Name: 
-- Module Name: vector_to_cathode - struc
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

entity vector_to_cathode is
--  Port ( )
PORT (
	to_display : IN std_logic_vector(3 downto 0);
	res : OUT std_logic_vector (6 downto 0)
	);
end vector_to_cathode;

architecture struc of vector_to_cathode is

begin
PROCESS (to_display)
		BEGIN
			CASE to_display IS
				WHEN "0000" => res <="1000000";
				WHEN "0001" => res <="1111001";
				WHEN "0010" => res <="0100100";
				WHEN "0011" => res <="0110000";
				WHEN "0100" => res <="0011001";
				WHEN "0101" => res <="0010010";
				WHEN "0110" => res <="0000010";
				WHEN "0111" => res <="1111000";
				WHEN "1000" => res <="0000000";
				WHEN "1001" => res <="0010000"; -- 9
				
				WHEN "1010" => res<="0001000"; -- A
				WHEN "1011" => res<="0000011"; -- b
				WHEN "1100" => res<="1000110"; --C
				WHEN "1101" => res<="0100001";--d
				WHEN "1110" => res<="0000110";--E
				WHEN others => res<="0001110";--F

			END CASE;
		END PROCESS;


end struc;
