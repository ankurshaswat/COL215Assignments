----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2017 08:58:08
-- Design Name: 
-- Module Name: validity_checker - struc
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

entity validity_checker is
  Port (divisor : in std_logic_vector(7 downto 0);
           input_valid: out std_logic );
end validity_checker;

architecture struc of validity_checker is

begin
process(divisor)
    begin
        if divisor="00000000" then
            input_valid<='0';
        else
            input_valid<='1';
            
            end if;
    end process;

end struc;
