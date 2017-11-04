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
	result: in std_logic_vector(7 downto 0);
	ring_counter : IN std_logic_vector (3 downto 0);
	cathode : OUT std_logic_vector (6 downto 0)
	);

end display;

architecture struc of display is
SIGNAL sig1,sig2,sig3,sig4 : std_logic_vector(1 downto 0):="00";
signal temp_cathode1,temp_cathode2,temp_cathode3,temp_cathode4:std_logic_vector(6 downto 0):="0000000";
begin

--	PROCESS (ring_counter,result)
--		BEGIN
--			CASE ring_counter IS
--				WHEN "1110" => sig <= 
--				WHEN "1101" => sig <= result(3 downto 2);
--				WHEN "1011" => sig <= result(5 downto 4);
--				WHEN others => sig <= result(7 downto 6);
--			END CASE;	
--		END PROCESS;
	
sig1<=	result(1 downto 0);
sig2<=	result(3 downto 2);
sig3<=	result(5 downto 4);
sig4<=	result(7 downto 6);

tocathode1: ENTITY WORK.v_to_cathode_char(struc)
	PORT MAP(to_display=>sig1,res=>temp_cathode1);
--tocathode2:e
tocathode2: ENTITY WORK.v_to_cathode_num(struc)
	PORT MAP(to_display=>sig2,res=>temp_cathode2);
tocathode3: ENTITY WORK.v_to_cathode_char(struc)
        PORT MAP(to_display=>sig3,res=>temp_cathode3);
tocathode4: ENTITY WORK.v_to_cathode_num(struc)
	PORT MAP(to_display=>sig4,res=>temp_cathode4);
	
with ring_counter select
	cathode<=
	temp_cathode2 when "1110",
	temp_cathode1 when "1101",
	temp_cathode4 when "1011",
	temp_cathode3 when others;
	
end struc;
