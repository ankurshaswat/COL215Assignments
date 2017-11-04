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
	a0 : IN integer;
	a1 : IN integer;
	b0 : IN integer;
	b1 : IN integer;
	ring_counter : IN std_logic_vector (3 downto 0);
	cathode : OUT std_logic_vector (6 downto 0)
	);

end display;

architecture struc of display is
SIGNAL sig : integer;
begin

	PROCESS (ring_counter,a0,b0,a1,b1)
		BEGIN
			CASE ring_counter IS
				WHEN "1110" => sig <= b0;
				WHEN "1101" => sig <= b1;
				WHEN "1011" => sig <= a0;
				WHEN others => sig <= a1;
			END CASE;	
		END PROCESS;
		
	inttobit: ENTITY WORK.int_to_bitvector(struc)
	PORT MAP(sig,cathode);


end struc;
