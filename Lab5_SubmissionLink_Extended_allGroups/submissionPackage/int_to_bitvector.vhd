----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2017 08:20:05
-- Design Name: 
-- Module Name: int_to_bitvector - struc
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

entity int_to_bitvector is
--  Port ( );
PORT (
	a : IN integer;
	res : OUT std_logic_vector (6 downto 0)
	);

end int_to_bitvector;

architecture struc of int_to_bitvector is

begin
PROCESS (a)
		BEGIN
			CASE a IS
				WHEN 0 => res <="1000000";
				WHEN 1 => res <="1111001";
				WHEN 2 => res <="0100100";
				WHEN 3 => res <="0110000";
				WHEN 4 => res <="0011001";
				WHEN 5 => res <="0010010";
				WHEN 6 => res <="0000010";
				WHEN 7 => res <="1111000";
				WHEN 8 => res <="0000000";
				WHEN 9 => res <="0010000";
				WHEN others => res<="0111111";
			END CASE;
		END PROCESS;


end struc;
