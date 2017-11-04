----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.08.2017 07:40:10
-- Design Name: 
-- Module Name: valid_checker - struc
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity valid_checker is
--  Port ( );
PORT (
	a_i : IN std_logic_vector (7 downto 0);
	b_i : IN std_logic_vector (7 downto 0);
	valid : OUT std_logic
	);

end valid_checker;

architecture struc of valid_checker is
SIGNAL t1 : std_logic;
	SIGNAL t2 : std_logic;
	SIGNAL a0,a1,b0,b1 : integer;
begin
 a0 <= to_integer(unsigned((a_i(3 downto 0))));
                   a1 <= to_integer(unsigned((a_i(7 downto 4))));
                        b0 <= to_integer(unsigned((b_i(3 downto 0))));     
                        b1 <= to_integer(unsigned((b_i(7 downto 4))));
	PROCESS (a0,a1,b0,b1)
		BEGIN
			IF a0=0 AND a1=0 THEN
                                        t1 <= '0';
         --   ELSEIF a0 >= 0 AND a0 < 10 AND a1 >= 0 AND a1 < 10 THEN
           elsif (a0 >= 0) and (a0 < 10) and (a1 >= 0) and (a1 < 10) then
             t1 <= '1';
            ELSE
                                            t1 <= '0';
            end if;
            
             IF b0=0 AND b1=0 THEN
                                t2 <= '0';
                                                 --   ELSEIF a0 >= 0 AND a0 < 10 AND a1 >= 0 AND a1 < 10 THEN
           elsif (b0 >= 0) and (b0 < 10) and (b1 >= 0) and (b1 < 10) then
             t2 <= '1';
            ELSE
                                            t2 <= '0';
            end if;
               
		END PROCESS;
     valid <= t1 AND t2;

end struc;
