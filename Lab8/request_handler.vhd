----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2017 08:00:56
-- Design Name: 
-- Module Name: request_handler - struc
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

entity request_handler is
    Port (
     reset : in STD_LOGIC;                                 -- Input with behaviour defined in document
           up_request : in STD_LOGIC_VECTOR (3 downto 0);         -- Input with behaviour defined in document         
           down_request : in STD_LOGIC_VECTOR (3 downto 0);        -- Input with behaviour defined in document
--           display : out STD_LOGIC_VECTOR (0 downto 0);
           lift1_status : in STD_LOGIC_VECTOR (9 downto 0);        -- This will correspond to the status of the lift.
                                --01 for going up                                    --The first two bits correspond to the state of the lift as described in the document.
                                                                   --The next four bits correspond to the indicators of the floor keys pressed inside the lift.
                                                                   -- The next two bits correspond to the current floor of the lift.
                                                                   -- The next two bits correspond to the movement of the lift.(as displayed on ssd)
                                                                   
           lift2_status : in STD_LOGIC_VECTOR (9 downto 0);         --Same as previous signal
           clock: in std_logic;        
                                        -- A 10hz clock(or faster). (Usefulness to be decided) (May be removed from this block).
           fast_clock: in std_logic;
           lift1_command : out STD_LOGIC_VECTOR (3 downto 0);       -- Output for the lift which contains one-hot enocded information about the floors to which the lift has
                                                                    -- has to stop at. ( Different for both lifts)
           lift2_command : out STD_LOGIC_VECTOR (3 downto 0);       -- Same as previous.
           up_req,down_req: out std_logic_vector(3 downto 0));      -- These are used to pass on the information for display about which 
                                                                     --floor keys are yet to be served.
                                                                     
end request_handler;
architecture struc of request_handler is
signal lift1_state,     -- 00 for idle   --01 for going up -- 10 for going down
        lift1_floor,lift1_movement,lift2_state,lift2_floor,lift2_movement: std_logic_vector(1 downto 0):="00";
signal lift1_floor_indicator,lift2_floor_indicator: std_logic_vector(3 downto 0):="0000";

signal up_req_indicator,down_req_indicator: std_logic_vector(3 downto 0):="0000";
signal lift1_command_internal,lift2_command_internal:std_logic_vector( 3 downto 0):="0000";

signal urul1,urul2,drdl1,drdl2,urdl1,urdl2,drul1,drul2,pending_up,pending_down,au1,au2,ad1,ad2:std_logic_vector(3 downto 0):="0000";
begin

up_req<=up_req_indicator;
down_req<=down_req_indicator;
lift1_command<=lift1_command_internal;
lift2_command<=lift2_command_internal;


lift1_state<=lift1_status(9 downto 8);
lift1_floor_indicator<=lift1_status(7 downto 4);
lift1_floor<=lift1_status(3 downto 2);
lift1_movement<=lift1_status(1 downto 0);

lift2_state<=lift2_status(9 downto 8);
lift2_floor_indicator<=lift2_status(7 downto 4);
lift2_floor<=lift2_status(3 downto 2);
lift2_movement<=lift2_status(1 downto 0);


process(fast_clock, reset)
begin
--    if (reset='1') then
--       lift1_command_internal<="0000";
--       lift2_command_internal<="0000";
    if(rising_edge(fast_clock)) then
       if( lift1_floor="00") then 
            urul1<='0' &  pending_up(2 downto 1) & '0';
            drul1<= "000" & pending_up(0) ;
            urdl1<=pending_down(3 downto 1) & '0';
            drdl1<="0000";
        elsif(lift1_floor="01") then
               urul1<='0'& pending_up(2) & "00";
               drul1<= "00" & pending_up(1 downto 0) ;
               urdl1<=pending_down(3 downto 2) & "00";
               drdl1<="00" & pending_down(1)&'0';
         elsif(lift1_floor="10") then
                 urul1<="0000";
                 drul1<= '0' & pending_up(2 downto 0) ;
                 urdl1<=pending_down(3) & "000";
                 drdl1<='0' & pending_down(2 downto 1) & '0';
          elsif(lift1_floor="11") then
                  urul1<="0000";
                  drul1<= '0' & pending_up(2 downto 0) ;
                  urdl1<="0000";
                  drdl1<= pending_down(3 downto 1) & '0';
         end if;
         if( lift2_floor="00") then 
                 urul2<='0' &  pending_up(2 downto 1) & '0';
                 drul2<= "000" & pending_up(0) ;
                 urdl2<=pending_down(3 downto 1) & '0';
                 drdl2<="0000";
             elsif(lift2_floor="01") then
                    urul2<='0'& pending_up(2) & "00";
                    drul2<= "00" & pending_up(1 downto 0) ;
                    urdl2<=pending_down(3 downto 2) & "00";
                    drdl2<="00" & pending_down(1)&'0';
              elsif(lift2_floor="10") then
                      urul2<="0000";
                      drul2<= '0' & pending_up(2 downto 0) ;
                      urdl2<=pending_down(3) & "000";
                      drdl2<='0' & pending_down(2 downto 1) & '0';
               elsif(lift2_floor="11") then
                       urul2<="0000";
                       drul2<= '0' & pending_up(2 downto 0) ;
                       urdl2<="0000";
                       drdl2<= pending_down(3 downto 1) & '0';
              end if;
         
    end if;
end process;

process(clock,reset)
begin

    if (reset='1') then
       lift1_command_internal<="0000";
       lift2_command_internal<="0000";
       au1<="0000";
       au2<="0000";
       ad1<="0000";
       ad2<="0000";

    elsif(rising_edge(clock)) then
        
--       pending_down<=down_request and not(down_req_indicator);
--       pending_up<=up_request and not(up_req_indicator);
       
        if (lift1_state="00" and lift2_state="00") then
        
            if(not(urul1="0000")) then
                lift1_command_internal<=urul1;
                au1<=urul1;
--                pending_up<=pending_up and not(urul1);
                
            elsif(not(urdl1="0000")) then
                if(urdl1(3)='1') then
                    lift1_command_internal<="1000";
                    ad1<="1000";
                elsif(urdl1(2)='1') then
                    lift1_command_internal<="0100";
                    ad1<="0100";
                else
                    lift1_command_internal<="0010";
                    ad1<="0010";
                 end if;
--                pending_down<=pending_down and not(urdl1);
            elsif(not(drul1="0000")) then
                if(drul1(0)='1') then
                                lift1_command_internal<="0001";
                                au1<="0001";
                            elsif(drul1(1)='1') then
                                lift1_command_internal<="0010";
                                au1<="0010";
                            else
                                lift1_command_internal<="0100";
                                au1<="0100";
                             end if;
--                pending_up<=pending_up and not(drul1);
            else
                lift1_command_internal<=drdl1;
                ad1<=drdl1;
--                               pending_down<=pending_down and not(drdl1);

             end if;
        elsif( lift1_state="00" and lift2_state="01") then
                        lift2_command_internal<=urul2;
                        au2<=urul2;
--                        pending_up<=pending_up and not(urul2);
                        
                        if(not(urul1="0000")) then
                                lift1_command_internal<=urul1 and not(urul2);
                                au1<=urul1 and not(urul2);
--                                pending_up<=pending_up and not(urul1);
                            elsif(not(urdl1="0000")) then
                               if(urdl1(3)='1') then
                                                lift1_command_internal<="1000";
                                                ad1<="1000";
                                            elsif(urdl1(2)='1') then
                                                lift1_command_internal<="0100";
                                                ad1<="0100";
                                            else
                                                lift1_command_internal<="0010";
                                                ad1<="0010";
                                             end if;
                            elsif(not(drul1="0000")) then
                             if(drul1(0)='1') then
                               lift1_command_internal<="0001"and not(urul2);
                               au1<="0001"and not(urul2);
                           elsif(drul1(1)='1') then
                               lift1_command_internal<="0010"and not(urul2);
                               au1<="0010"and not(urul2);
                           else
                               lift1_command_internal<="0100"and not(urul2);
                               au1<="0100"and not(urul2);
                            end if;
--                                lift1_command_internal<=drul1 and not(urul2);
--                                au1<=drul1 and not(urul2);
--                                pending_up<=pending_up and not(drul1);
                            else
                                lift1_command_internal<=drdl1;
                                ad1<=drdl1;
                             end if;
    elsif( lift1_state="00" and lift2_state="10") then
                            lift2_command_internal<=drdl2;
                            ad2<=drdl2;

        
                            if(not(urul1="0000")) then
                                    lift1_command_internal<=urul1;
                                    au1<=urul1;
                --                    pending_up<=pending_up and not(urul1);
                                elsif(not(urdl1="0000")) then
                                                  if(urdl1(3)='1') then
                                                  lift1_command_internal<="1000"and not(drdl2);
                                                  ad1<="1000"and not(drdl2);
                                              elsif(urdl1(2)='1') then
                                                  lift1_command_internal<="0100"and not(drdl2);
                                                  ad1<="0100"and not(drdl2);
                                              else
                                                  lift1_command_internal<="0010"and not(drdl2);
                                                  ad1<="0010"and not(drdl2);
                               end if;
--                                    lift1_command_internal<=urdl1 and not(drdl2);
--                                    ad1<=urdl1 and not(drdl2);
                                elsif(not(drul1="0000")) then
                                                         if(drul1(0)='1') then
                                                               lift1_command_internal<="0001";
                                                               au1<="0001";
                                                           elsif(drul1(1)='1') then
                                                               lift1_command_internal<="0010";
                                                               au1<="0010";
                                                           else
                                                               lift1_command_internal<="0100";
                                                               au1<="0100";
                                                            end if;
                --                    pending_up<=pending_up and not(drul1);
                                else
                                    lift1_command_internal<=drdl1 and not(drdl2);
                                    ad1<=drdl1 and not(drdl2);
                                 end if;
        elsif( lift1_state="01" and lift2_state="00") then
                         lift1_command_internal<=urul1;
                         au1<=urul1;
--                         pending_up<=pending_up and not(urul1);
                           if(not(urul2="0000")) then
                               lift2_command_internal<=urul2 and not(urul1);
                               au2<=urul2 and not(urul1);
--                               pending_up<=pending_up and not(urul2);
                           elsif(not(urdl2="0000")) then
                                                                      if(urdl2(3)='1') then
                                                                        lift2_command_internal<="1000";
                                                                        ad2<="1000";
                                                                    elsif(urdl2(2)='1') then
                                                                        lift2_command_internal<="0100";
                                                                        ad2<="0100";
                                                                    else
                                                                        lift2_command_internal<="0010";
                                                                        ad2<="0010";
                                                                     end if;
                           elsif(not(drul2="0000")) then
                                                                                      if(drul2(0)='1') then
                                                                                          lift2_command_internal<="0001" and not(urul1);
                                                                                          au2<="0001" and not(urul1);
                                                                                      elsif(drul2(1)='1') then
                                                                                          lift2_command_internal<="0010" and not(urul1);
                                                                                          au2<="0010" and not(urul1);
                                                                                      else
                                                                                          lift2_command_internal<="0100" and not(urul1);
                                                                                          au2<="0100" and not(urul1);
                                                                                       end if;
--                               lift2_command_internal<=drul2 and not(urul1);
--                               au2<=drul2 and not(urul1);
--                               pending_up<=pending_up and not(drul2);
                           else
                               lift2_command_internal<=drdl2;
                               ad2<=drdl2;
                            end if;
        elsif( lift1_state="01" and lift2_state="01") then
                            lift1_command_internal<=urul1;
                            au1<=urul1;
--                            pending_up<=pending_up and not(urul1);
                            lift2_command_internal<=urul2 and not(urul1);
                            au2<=urul2 and not(urul1);
--                            pending_up<=pending_up and not(urul2);
        
        
        elsif( lift1_state="01" and lift2_state="10") then
                        lift1_command_internal<=urul1;
                        au1<=urul1;
--                        pending_up<=pending_up and not(urul1);
                        lift2_command_internal<=drdl2;
                        ad2<=drdl2;

        elsif( lift1_state="10" and lift2_state="00") then
                        lift1_command_internal<=drdl1;
                        ad1<=drdl1;
                        
                        if(not(urul2="0000")) then
                            lift2_command_internal<=urul2;
                            au2<=urul2;
--                            pending_up<=pending_up and not(urul2);
                        elsif(not(urdl2="0000")) then
                                                                                             if(urdl2(3)='1') then
                                                                                                lift2_command_internal<="1000"and not(drdl1);
                                                                                               ad2<="1000"and not(drdl1);
                                                                                           elsif(urdl2(2)='1') then
                                                                                               lift2_command_internal<="0100"and not(drdl1);
                                                                                               ad2<="0100"and not(drdl1);
                                                                                           else
                                                                                               lift2_command_internal<="0010"and not(drdl1);
                                                                                               ad2<="0010"and not(drdl1);
                                                                                            end if;
--                            lift2_command_internal<=urdl2 and not(drdl1);
--                            ad2<=urdl2 and not(drdl1);
                        elsif(not(drul2="0000")) then
                                                                                         if(drul2(0)='1') then
                                                                                                                  lift2_command_internal<="0001" ;
                                                                                                                  au2<="0001" ;
                                                                                                              elsif(drul2(1)='1') then
                                                                                                                  lift2_command_internal<="0010";
                                                                                                                  au2<="0010";
                                                                                                              else
                                                                                                                  lift2_command_internal<="0100";
                                                                                                                  au2<="0100";
                                                                                                               end if;
--                            lift2_command_internal<=drul2;
--                            au2<=drul2;
--                            pending_up<=pending_up and not(urul2);
                        else
                            lift2_command_internal<=drdl2 and not(drdl1);
                            ad2<=drdl2 and not(drdl1);
                         end if;
                         
        elsif( lift1_state="10" and lift2_state="01") then
                          lift2_command_internal<=urul2;
                          au2<=urul2;
--                          pending_up<=pending_up and not(urul2);
                          lift1_command_internal<=drdl1;
                          ad1<=drdl1;
        elsif( lift1_state="10" and lift2_state="10") then
                         lift1_command_internal<=drdl1;
                         ad1<=drdl1;
                       lift2_command_internal<=drdl2 and not(drdl1);
                       ad2<=drdl2 and not(drdl1);
        
        

        end if;
     end if;


end process;


process(fast_clock,reset)
begin
  if(reset='1') then
               up_req_indicator<="0000";
    elsif(rising_edge(fast_clock)) then
        if(((lift1_state="01" or lift1_state="00") and lift1_floor="00")or((lift2_state="01" or lift2_state="00") and lift2_floor="00")) then
            up_req_indicator(0)<='0';
        elsif(up_request(0)='1') then
            up_req_indicator(0)<='1';
        end if;
        
        if(((lift1_state="01" or lift1_state="00") and lift1_floor="01")or((lift2_state="01" or lift2_state="00") and lift2_floor="01")) then
                up_req_indicator(1)<='0';
            elsif(up_request(1)='1') then
                up_req_indicator(1)<='1';
            end if;
                
                
         if(((lift1_state="01" or lift1_state="00") and lift1_floor="10")or((lift2_state="01" or lift2_state="00") and lift2_floor="10")) then
                    up_req_indicator(2)<='0';
                elsif(up_request(2)='1') then
                    up_req_indicator(2)<='1';
                end if;
     end if;
end process;

process(fast_clock,reset)
begin
  if(reset='1') then
               down_req_indicator<="0000";
               
     elsif(rising_edge(fast_clock)) then
     
        if(((lift1_state="10" or lift1_state="00") and lift1_floor="11")or((lift2_state="10" or lift2_state="00") and lift2_floor="11")) then
            down_req_indicator(3)<='0';
        elsif(down_request(3)='1') then
            down_req_indicator(3)<='1';
        end if;
        
        if (((lift1_state="10" or lift1_state="00") and lift1_floor="10")or ((lift2_state="10" or lift2_state="00") and lift2_floor="10")) then
                    down_req_indicator(2)<='0';
                elsif(down_request(2)='1') then
                    down_req_indicator(2)<='1';
                end if;
                
                
         if(((lift1_state="10" or lift1_state="00") and lift1_floor="01")or((lift2_state="10" or lift2_state="00") and lift2_floor="01")) then
                            down_req_indicator(1)<='0';
                        elsif(down_request(1)='1') then
                            down_req_indicator(1)<='1';
                        end if;
      end if;
end process;

process(fast_clock,reset)
   begin
        if(reset='1') then
                  pending_up<="0000";
        elsif(rising_edge(fast_clock)) then
            if ( au1(0)='1' ) or (au2(0)='1')   then
                pending_up(0)<='0';
            elsif(up_request(0)='1' and up_req_indicator(0)='0') then
                pending_up(0)<='1';
             
            end if;
            
          if( au1(1)='1'  ) or (au2(1)='1' ) then
                pending_up(1)<='0';
        elsif(up_request(1)='1' and up_req_indicator(1)='0') then
            pending_up(1)<='1';
          end if;              
           if( au1(1)='1'  ) or (au2(1)='1') then
                    pending_up(2)<='0';
            elsif(up_request(2)='1' and up_req_indicator(2)='0') then
                pending_up(2)<='1';
                                    
                end if;
   
   end if;
   end process;
   
   
 process(fast_clock,reset)
      begin
           if(reset='1') then
                     pending_down<="0000";
          elsif(rising_edge(fast_clock)) then
               if( ad1(3)='1'  ) or (ad2(3)='1') then
                   pending_down(3)<='0';
               elsif(down_request(3)='1' and down_req_indicator(3)='0') then
                   pending_down(3)<='1';
               end if;
               
             if( ad1(1)='1' ) or (ad2(1)='1' ) then
                                   pending_down(1)<='0';
               elsif(down_request(1)='1' and down_req_indicator(1)='0') then
                   pending_down(1)<='1';
                     end if;              
              if( ad1(2)='1'  ) or (ad2(2)='1' ) then
                       pending_down(2)<='0';
                   elsif(down_request(2)='1' and down_req_indicator(2)='0') then
                       pending_down(2)<='1';
                   end if;
      
      end if;
      end process;
end struc;
