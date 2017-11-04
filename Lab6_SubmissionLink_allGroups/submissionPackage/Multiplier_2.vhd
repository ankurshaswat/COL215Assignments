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

entity Multiplier_2 is
PORT (in1 : IN std_logic_vector(7 downto 0);
	in2: IN std_logic_vector(7 downto 0);
	product: OUT std_logic_vector(15 downto 0));
end Multiplier_2;

architecture Multiplier_2_arc of Multiplier_2 is

--signal a,b: std_logic_vector(7 downto 0):="00000000";
	signal temp1,temp2: std_logic_vector(7 downto 0):="00000000";
		signal temp3: std_logic_vector(6 downto 0):="0000000";

		signal d,p2_6: std_logic_vector(7 downto 0) := "00000000";
		type T_2D is array (5 downto 0) of std_logic_vector(7 downto 0);
        signal prev_carry : T_2D;
		type T_2D3 is array (5 downto 0) of std_logic_vector(6 downto 0);
        signal prev_sum: T_2D3;

begin


--	c(0)<='0';
--pro1: entity WORK.carry_propagate(Multiplier_1_arc)
--	port map()
--		        p = a and b;
temp1 <= ('0' & in1(7 downto 1)) when in2(0)='1' else "00000000";
temp2 <= in1(7 downto 0) when in2(1)='1' else "00000000";
temp3 <= in1(6 downto 0) when in2(2)='1' else "0000000";


product(0)<=in1(0) and in2(0);

u0:entity work.carry_save(carry_save_arc)
 port map( a => temp1 , b =>  temp3 ,carry_in=>temp2 ,c0 => '0', first_sum=> product(1), rest_sum=> prev_sum(0),
 carries=>prev_carry(0));
--product(1)<=prev(0)(0);

U0TO7: For i in 1 to 5 generate
--Signal p_i: std_logic_vector(7 downto 0):= d(i-1) & (prev(i-1)(7 downto 1));
Signal p2_i: std_logic_vector(7 downto 0):="00000000";
Signal p_i: std_logic_vector(6 downto 0):="0000000";

begin
    p_i <= in1(6 downto 0) when in2(i+2)='1' else "0000000";
    p2_i <= (in1(7) and in2(i+1)) & prev_sum(i-1);
--		p33 = a and b; 
		ui:entity work.carry_save(carry_save_arc)
			port map(a => p2_i ,b => p_i,carry_in=>prev_carry(i-1),c0 => '0', first_sum => product(i+1),rest_sum => prev_sum(i),carries=>prev_carry(i));
end generate;

--product(i+1)<=prev(i)(0);
--             signal xi:std_logic_vector(7 downto 0)
p2_6 <= (in1(7) and in2(7)) & prev_sum(5);
u6:entity work.carry_propagate(carry_propagate_arc)
-- 			port map(a => prev_sum(i-1) ,b => p_i,carry_in=>prev_carry(i-1),c0 => '0', first_sum => product(i+1),rest_sum => prev_sum(i),carries=>prev_carry(i-1));
 port map( a => p2_6 , b =>  prev_carry(5) ,c0 => '0', first_sum=> product(7), rest_sum=> product(15 downto 8));

-- port map( a => temp1 , b =>  temp2 ,carry_in=>,c0 => '0', first_sum=> product(1), rest_sum=> prev(0));

--product(15)<=d(6);
--product(15 downto 6)<= prev_sum(6);

--end Multiplier_1_arc;


end Multiplier_2_arc;