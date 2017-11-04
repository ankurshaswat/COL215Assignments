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

entity Multiplier_1 is
PORT (
	in1 : IN std_logic_vector(7 downto 0);
	in2: IN std_logic_vector(7 downto 0);
	product: OUT std_logic_vector(15 downto 0));
end Multiplier_1;

architecture Multiplier_1_arc of Multiplier_1 is
--	signal c: std_logic_vector(8 downto 0);
--	signal a,b: std_logic_vector(7 downto 0):="00000000";
	signal temp1,temp2: std_logic_vector(7 downto 0):="00000000";
		signal d: std_logic_vector(7 downto 0) := "00000000";
		type T_2D is array (7 downto 0) of std_logic_vector(7 downto 0);
        signal prev : T_2D;

begin


--	c(0)<='0';
--pro1: entity WORK.carry_propagate(Multiplier_1_arc)
--	port map()
--		        p = a and b;
temp1 <= '0' & in1(7 downto 1) when in2(0)='1' else "00000000";
temp2 <= in1(7 downto 0) when in2(1)='1' else "00000000";

product(0)<=in1(0) and in2(0);

u0:entity work.carry_propagate(carry_propagate_arc)
 port map( a => temp1 , b =>  temp2 ,c0 => '0', first_sum=> product(1), rest_sum=> prev(0));
--product(1)<=prev(0)(0);

U0TO7: For i in 1 to 6 generate
--Signal p_i: std_logic_vector(7 downto 0):= d(i-1) & (prev(i-1)(7 downto 1));
Signal p_i: std_logic_vector(7 downto 0);
begin
    p_i <= in1 when in2(i+1)='1' else "00000000";
--		p33 = a and b; 
		ui:entity work.carry_propagate(carry_propagate_arc)
			port map(a => prev(i-1) ,b => p_i,c0 => '0', first_sum => product(i+1),rest_sum => prev(i));

--product(i+1)<=prev(i)(0);
--             signal xi:std_logic_vector(7 downto 0)

end generate;

--product(15)<=d(6);
product(15 downto 8)<= prev(6);

end Multiplier_1_arc;




--a_vec 
--b_std_logic=b(0)

--p <= a_vec when b_std_logic='1' else "0000000";
