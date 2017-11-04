----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2017 12:34:49
-- Design Name: 
-- Module Name: pulse - struc
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

entity pulse1 is
  Port (in1 :in std_logic:='0';
        clk: in std_logic;
   out1 :out std_logic);
end pulse1;

architecture struc of pulse1 is
signal d1,d2:STD_LOGIC:='0';
begin
    process(clk)
    begin
         if clk= '1' and clk'event then
               d1<=in1;
               d2<=d1;
         end if;
    end process;
    out1<= (not(d2)) and d1; 

end struc;
