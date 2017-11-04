----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 27.09.2017 07:42:42
-- Design Name:
-- Module Name: status_display_block - struc
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

entity status_display_block is

--status_display: entity work.status_display_block(struc)
--    port map(display=>display,lift1_status=>lift1_status,lift2_status=>lift2_status,clock=>display_clock,lift1_floor_indicator=>lift1_floor_indicator,lif2_floor_indicator=>lift2_floor_indicator,
--down_request_indicator=>down_request_indicator,up_request_indicator=>up_request_indicator,anode=>anode,cathode=>cathode);

Port (

	 --4 up input fir 4 down input 
	 
	 up_req:in std_logic_vector(3 downto 0);       --Requests from external buttons to go up as pased on from request_handler block.
	 
	 down_req:in std_logic_vector(3 downto 0);     --Requests from external buttons to go down as pased on from request_handler block.
	 
lift1_status: in std_logic_vector(9 downto 0);   -- This will correspond to the status of the lift.
                                                                   --The first two bits correspond to the state of the lift as described in the document.
                                                                  --The next four bits correspond to the indicators of the floor keys pressed inside the lift.
                                                                  -- The next two bits correspond to the current floor of the lift.
                                                                  -- The next two bits correspond to the movement of the lift.(as displayed on ssd)
                                                                  
lift2_status: in std_logic_vector(9 downto 0);
--shuru k 4 floor_ind input fir 2 current fir 2 dir

clock: in std_logic;            -- Clock for ssd display.

lift1_floor_indicator: out std_logic_vector (3 downto 0);  --Described in problem statement
anode: out std_logic_vector (3 downto 0);
up_request_indicator: out std_logic_vector (3 downto 0);
down_request_indicator: out std_logic_vector (3 downto 0);
lift2_floor_indicator: out std_logic_vector (3 downto 0);
cathode : out std_logic_vector(6 downto 0)     --Described in problem statement

);
end status_display_block;

architecture struc of status_display_block is
signal ring_counter:std_logic_vector(3 downto 0):="0000";
signal result:std_logic_vector(7 downto 0):="00000000";
-- result mein pehle 2 fl2 fir 2 dir l2 fir 2 f l1 fir 2 dir l 2
begin
--lift1 : process(clock,lift1_status)
--begin
--	if(clock='1' and clock'event) then
	lift1_floor_indicator<=lift1_status(7 downto 4);
	result(7 downto 4)<=lift1_status(3 downto 0);
--	end if;
--end process ; -- lift1
--lift2 : process(clock,lift2_status)
--begin
--	if(clock='1' and clock'event) then
	lift2_floor_indicator<=lift2_status(7 downto 4);
	result(3 downto 0)<=lift2_status(3 downto 0);
--	end if;
--end process ; -- lift2
--downupind : process(clock,up_req,down_req)
--begin
--	if(clock='1' and clock'event) then
	up_request_indicator<=up_req;
	down_request_indicator<=down_req;
--	end if;
--end process ; -- downupind

		counter_ring: ENTITY WORK.ringer(struc)
		PORT MAP(clock=>clock,count=>ring_counter);
		anode<=ring_counter;

  displayer: ENTITY WORK.display(struc)
             PORT MAP(result=>result,ring_counter=>ring_counter,cathode=>cathode);
		
--        displayer: ENTITY WORK.display(struc)
--           PORT MAP(result=>result,ring_counter=>ring_counter,cathode=>cathode);

end struc;