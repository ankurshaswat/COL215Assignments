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

entity carry_save is
PORT (
	a : IN std_logic_vector(7 downto 0);
	b: IN std_logic_vector(6 downto 0);
	carry_in: IN std_logic_vector(7 downto 0);

	c0:IN std_logic; 
	first_sum: OUT std_logic;
	rest_sum: OUT std_logic_vector (6 downto 0);
	carries: OUT std_logic_vector(7 downto 0));
end carry_save;

architecture carry_save_arc of carry_save is
--	signal ca: std_logic_vector(7 downto 0);
begin
--	c(0) <=c0;
U0 :entity WORK.full_adder(conc)
    PORT MAP(a=>a(0),b=>'0',c0=>carry_in(0),s=>first_sum,c1=>carries(0));
    
U0TO7 : FOR i IN 1 TO 6 GENERATE
Ui :entity WORK.full_adder(conc)
PORT MAP(a=>a(i),b=>b(i-1),c0=>carry_in(i),s=>rest_sum(i-1),c1=>carries(i));
end GENERATE;

U7 :entity WORK.full_adder(conc)
PORT MAP(a=>a(7),b=>b(6),c0=>carry_in(7),s=>rest_sum(6),c1=>carries(7));

--rest_sum(7)<=b(7);
end carry_save_arc;
