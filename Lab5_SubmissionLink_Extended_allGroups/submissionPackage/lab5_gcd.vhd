----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.08.2017 18:25:40
-- Design Name: 
-- Module Name: lab5_gcd - struc
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

entity lab5_gcd is
--  Port ( );
PORT (
	clk : IN std_logic;
	a_i : IN std_logic_vector (7 downto 0);
	b_i : IN std_logic_vector (7 downto 0);
	push_i : IN std_logic;
	pushbutton : IN std_logic;
	load : OUT std_logic;
	sub : OUT std_logic;
	op_valid : OUT std_logic;
	cathode : OUT std_logic_vector (6 downto 0);
	anode : OUT std_logic_vector (3 downto 0));

end lab5_gcd;

architecture struc of lab5_gcd is
SIGNAL a0,a1,b0,b1 : integer :=0;
SIGNAL ring_counter : std_logic_vector (3 downto 0);
SIGNAL slow_gcd,slow_display,fast_gcd,fast_display,display,gcd : std_logic;
SIGNAL op_valid_temp: std_logic:='0';
SIGNAL load_temp,sub_temp: std_logic:='0';

begin



    clock_modifier: ENTITY WORK.clock_modifier(struc)
		PORT MAP(clock=>clk,slow_gcd=>slow_gcd,slow_display=>slow_display,fast_gcd=>fast_gcd);
		
	
	with pushbutton select
	   gcd <= slow_gcd when '0',
	                   ring_counter(0) when others;
	                   
	with pushbutton select
               display <= slow_display when '0',
                            clk when others;
		
	counter_ring: ENTITY WORK.ringer(struc)
		PORT MAP(clock=>display,count=>ring_counter);

Validity_checker: ENTITY WORK.valid_checker(struc)
		PORT MAP(a_i=>a_i,b_i=>b_i,valid=>op_valid_temp);
		
displayer: ENTITY WORK.display(struc)
                PORT MAP(a0=>a0,a1=>a1,b0=>b0,b1=>b1,ring_counter=>ring_counter,cathode=>cathode);
		
		
		
--		PROCESS(push_i)
--		begin
--		IF (push_i='1' AND push_i'EVENT) THEN 
--		          if (op_valid_temp = '1') then
--		                  load_temp <= '1';
--		                  sub_temp <= '0';
--		          else
--		              load_temp <= '0';
--		              sub_temp <= '0';
--		          end if;
--		end if;
--		end process;
--		load_temp <= push_i;
		--load_temp <= op_valid_temp and (load_temp or pushbutton);
		
		--sub_temp <= (NOT pushbutton) and sub_temp;
		
		
		PROCESS(gcd,push_i)
		  begin
		  if( rising_edge(push_i)) then
		  
		  sub_temp <= '0' ;
		  		  load_temp <= op_valid_temp ;

		  end if;
		  IF (gcd='1' AND gcd'EVENT) THEN 
		      if load_temp='1' then
		       a0 <= to_integer(unsigned((a_i(3 downto 0))));
		            a1 <= to_integer(unsigned((a_i(7 downto 4))));
		                 b0 <= to_integer(unsigned((b_i(3 downto 0))));     
		                 b1 <= to_integer(unsigned((b_i(7 downto 4))));
		                 sub_temp<='1';
		                 load_temp<='0';
		          
		       elsif (load_temp = '0') and (sub_temp = '1')  then          
		          if (a1 = b1) and (a0 = b0) then
		              sub_temp <= '0';
		           elsif (a1 > b1) or ((a1 = b1) and (a0 > b0)) then
		                  if (a0 >= b0) then
		                      a0 <= a0-b0;   
		                      a1 <= a1-b1;
		                  else
		                      a0<=10+a0-b0;
		                      a1<=a1-b1-1;
		                   end if;
		             -- elsif (b1 > a1) or ((a1 = b1) and (b0 > a0)) then
		             else
                                                if (b0 >= a0) then
                                                    b0 <= b0-a0;   
                                                    b1<=b1-a1;
                                                else
                                                    b0<=10+b0-a0;
                                                    b1<=b1-a1-1;
                                                 end if;
                                                 --b0<=d0;
                                                 --b1<=d1;
                                         
		       end if;
		     -- elseif (load_temp = '0') and (sub_temp = '1') then
		  
		  
		  
		  
		  
		  end if;-- for load check
		  
		  
		  
		  end if;--for clokc;
		  end process;
		 
			anode <= ring_counter;
  		op_valid<=op_valid_temp;
		load<=load_temp;
		sub <= sub_temp;
		
end struc;
