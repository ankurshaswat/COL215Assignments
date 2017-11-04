----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2017 08:58:08
-- Design Name: 
-- Module Name: mod_values - struc
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

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_values is
  Port (    sign : in std_logic;
                input :in std_logic_vector(6 downto 0);
           output: out std_logic_vector(6 downto 0) );
end mod_values;

architecture struc of mod_values is
--signal divisor_comp: std_logic_vector(7 downto 0):="00000000";
begin
    
            
with sign select
               output <= input when '0',
                            not(input)+1 when others;
    
    
--    divisor_comp <= not(input) + 1;
    
    
--    process (input)

--    begin 
--        if(input(7)='1') then
--            output <= divisor_comp(6 downto 0);
--        else
--            output <= input(6 downto 0);
--        end if;
--    end process;


end struc;
