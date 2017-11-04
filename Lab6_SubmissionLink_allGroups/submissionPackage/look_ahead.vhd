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

entity look_ahead is
PORT (
	a : IN std_logic_vector(3 downto 0);
	b : IN std_logic_vector(3 downto 0);
	c0: IN std_logic;
	s: OUT std_logic_vector(3 downto 0);
	c4 : OUT std_logic);
end look_ahead;

architecture look_ahead_arc of look_ahead is

	signal p : std_logic_vector(3 downto 0);
	signal g : std_logic_vector(3 downto 0);
	signal c : std_logic_vector(3 downto 1);
begin
p <= a or b;
g <= a and b;

c(1) <=(p(0) and c0) or g(0);

c(2) <=(p(1) and c(1)) or g(1);
c(3) <=(p(2) and c(2)) or g(2);
c4 <=(p(3) and c(3)) or g(3);
--add1: entity WORK.full_adder(conc)
	U :entity WORK.full_adder(conc)
PORT MAP(a=>a(0),b=>b(0),c0=>c0,s=>s(0),c1=>c(1));
add2: entity WORK.full_adder(conc)
PORT MAP(a=>a(1),b=>b(1),c0=>c(1),s=>s(1),c1=>c(2));

add3: entity WORK.full_adder(conc)
PORT MAP(a=>a(2),b=>b(2),c0=>c(2),s=>s(2),c1=>c(3));

add4: entity WORK.full_adder(conc)
PORT MAP(a=>a(3),b=>b(3),c0=>c(3),s=>s(3),c1=>c4);

end look_ahead_arc;