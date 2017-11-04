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

entity lab6_multiplier is
PORT (clk : IN std_logic;
	in1 : IN std_logic_vector (7 downto 0);
	in2 : IN std_logic_vector (7 downto 0);
	display_button : IN std_logic;
	multiplier_select: IN std_logic_vector(1 downto 0);
--	op_valid : OUT std_logic;
	cathode : OUT std_logic_vector (6 downto 0);
	anode : OUT std_logic_vector (3 downto 0);
	         product : OUT  std_logic_vector(15 downto 0)
);
end lab6_multiplier;

architecture lab6_multiplier_arc of lab6_multiplier is
	signal slow_clock : std_logic:='0';
		signal clock : std_logic:='0';

	SIGNAL ring_counter : std_logic_vector (3 downto 0):="0000";
	signal result1,result2,result3,result:std_logic_vector(15 downto 0):="0000000000000000";

	
begin

    clock_modifier: ENTITY WORK.clock_modifier(struc)
		PORT MAP(clock=>clk,
--		slow_gcd=>slow_gcd,
slow_display=>slow_clock);
		counter_ring: ENTITY WORK.ringer(struc)
		PORT MAP(clock=>clock,count=>ring_counter);
		anode<=ring_counter;
        displayer: ENTITY WORK.display(struc)
                        PORT MAP(result=>result,ring_counter=>ring_counter,cathode=>cathode);

            mul1:     ENTITY WORK.Multiplier_1(Multiplier_1_arc)
		PORT MAP(in1=>in1,in2=>in2,product=>result1);

       mul2:     ENTITY WORK.Multiplier_2(Multiplier_2_arc)
		PORT MAP(in1=>in1,in2=>in2,product=>result2);
		
		       mul3:     ENTITY WORK.Multiplier_3(Multiplier_3_arc)
         PORT MAP(in1=>in1,in2=>in2,product=>result3);

	with display_button select
               clock <= slow_clock when '0',
                            clk when others;
        with multiplier_select select
                 result <= result1 when "00", result2 when "01" , result3 when others;
                       product<=result;     
end lab6_multiplier_arc;