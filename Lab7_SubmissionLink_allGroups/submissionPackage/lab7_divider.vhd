----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2017 08:45:57
-- Design Name: 
-- Module Name: lab7_divider - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab7_divider is
  Port ( divisor: in std_logic_vector(7 downto 0);
           dividend: in std_logic_vector(7 downto 0);
           output_valid:out std_logic:='0' ;
           input_invalid:out std_logic;
           load_inputs:in std_logic:='0';
           anode: out std_logic_vector(3 downto 0);
           cathode: out std_logic_vector(6 downto 0);
           clk: in std_logic;
           sim_mode: in std_logic

            );
end lab7_divider;

architecture Behavioral of lab7_divider is
signal slow_clock : std_logic:='0';
		signal clock : std_logic:='0';

	SIGNAL ring_counter : std_logic_vector (3 downto 0):="0000";
	signal result_quotient,quotient,result_remainder: std_logic_vector(7 downto 0);
	signal result: std_logic_vector(15 downto 0);
	
	signal mod_dividend,mod_divisor: std_logic_vector(6 downto 0);
--	signal 
	signal loaded_dividend,loaded_divisor: std_logic_vector(12 downto 0);
	signal sign_quotient,sign_remainder,validity:std_logic ;
	
	signal counter: std_logic_vector(2 downto 0) ;
	
begin

clock_modifier: ENTITY WORK.clock_modifier(struc)
		PORT MAP(clock=>clk,
--		slow_gcd=>slow_gcd,
slow_display=>slow_clock);

valid: Entity work.validity_checker(struc)
    port map(divisor=>divisor, input_valid=>validity);
input_invalid<=not(validity);

mod_val_divisor: entity work.mod_values(struc)
    port map(input=>divisor(6 downto 0),sign=>divisor(7),output=>mod_divisor);

mod_val_dividend: entity work.mod_values(struc)
    port map(input=>dividend(6 downto 0),sign=>dividend(7),output=>mod_dividend);
    
		counter_ring: ENTITY WORK.ringer(struc)
		PORT MAP(clock=>clock,count=>ring_counter);
		anode<=ring_counter;
		
        displayer: ENTITY WORK.display(struc)
             PORT MAP(result=>result,ring_counter=>ring_counter,cathode=>cathode);

        result<= result_quotient & result_remainder;
        
with sim_mode select
                       clock <= slow_clock when '0',
                                    clk when others;

PROCESS(clock,load_inputs)
		  begin
		  if( load_inputs='1' and load_inputs'event ) then
		      if(validity='1') then
		          sign_quotient<=dividend(7) xor divisor(7);
		          sign_remainder<=dividend(7);
                  loaded_dividend<= "000000" & mod_dividend;
                  loaded_divisor <= mod_divisor & "000000";
                  counter<="000";
                  quotient<="00000000";
--                  remainder<="00000000";
                  output_valid<='0';
--		          sub_temp <= '0' ;
--		  		  load_temp <= op_valid_temp ;

		  end if;
		  end if;
		  
--		  end process;
		  
		  
--process(clock)
--    begin
         if(rising_edge(clock)) then
                if(counter < "111") then
                    if(loaded_dividend>=loaded_divisor) then
                        loaded_dividend<=loaded_dividend - loaded_divisor;
                        loaded_divisor <=std_logic_vector( shift_right ( unsigned(loaded_divisor),1));
                        
                        quotient<= std_logic_vector(shift_left(unsigned(quotient),1))+'1';
                    else 
                               loaded_divisor <=std_logic_vector( shift_right ( unsigned(loaded_divisor),1));

                            quotient<= std_logic_vector(shift_left(unsigned(quotient),1));


                                            
                         end if;
                        counter <= counter + 1;

                elsif(counter = "111") then
                      if(sign_quotient = '1') then
                        result_quotient<= not(quotient)+1;
                       else
                        result_quotient<=quotient;
                        end if;
                       if(sign_remainder = '1') then
                        result_remainder <= not(loaded_dividend(7 downto 0))+1;
                       else
                        result_remainder<=loaded_dividend(7 downto 0);
                        end if;
                        output_valid<='1';
                end if;
        end if;
    end process;
   

--		  IF (gcd='1' AND gcd'EVENT) THEN 
--		      if load_temp='1' then
--		       a0 <= to_integer(unsigned((a_i(3 downto 0))));
--		            a1 <= to_integer(unsigned((a_i(7 downto 4))));
--		                 b0 <= to_integer(unsigned((b_i(3 downto 0))));     
--		                 b1 <= to_integer(unsigned((b_i(7 downto 4))));
--		                 sub_temp<='1';
--		                 load_temp<='0';
		          
--		       elsif (load_temp = '0') and (sub_temp = '1')  then          
--		          if (a1 = b1) and (a0 = b0) then
--		              sub_temp <= '0';
--		           elsif (a1 > b1) or ((a1 = b1) and (a0 > b0)) then
--		                  if (a0 >= b0) then
--		                      a0 <= a0-b0;   
--		                      a1 <= a1-b1;
--		                  else
--		                      a0<=10+a0-b0;
--		                      a1<=a1-b1-1;
--		                   end if;
--		             -- elsif (b1 > a1) or ((a1 = b1) and (b0 > a0)) then
--		             else
--                                                if (b0 >= a0) then
--                                                    b0 <= b0-a0;   
--                                                    b1<=b1-a1;
--                                                else
--                                                    b0<=10+b0-a0;
--                                                    b1<=b1-a1-1;
--                                                 end if;
--                                                 --b0<=d0;
--                                                 --b1<=d1;
                                         
--		       end if;
--		     -- elseif (load_temp = '0') and (sub_temp = '1') then
		  
		  
		  
		  
		  
--		  end if;-- for load check
		  
		  
		  
--		  end if;--for clokc;
--		  end process;




end Behavioral;
