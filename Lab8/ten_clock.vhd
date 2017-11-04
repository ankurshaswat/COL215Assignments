----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2017 20:02:55
-- Design Name: 
-- Module Name: ten_clock - struc
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ten_clock is
    Port ( 
    clock : in STD_LOGIC;
           out_clock : out STD_LOGIC);
end ten_clock;

architecture struc of ten_clock is

signal count : integer :=1;
signal clk:std_logic:='0';
begin
process(clock)
	begin
	if(clock'event and clock='1') then
    count <=count+1;
    if(count = 10000000) then
clk <= not clk;
    count <=1;
    end if;
    end if;
	end process;
out_clock<=clk;
end struc;
