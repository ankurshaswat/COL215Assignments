--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 08/21/2017 17:28:11
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/btech/cs1160328/lab4_seven_segment_display/lab4_seven_segment_display.vhf -w /home/btech/cs1160328/lab4_seven_segment_display/lab4_seven_segment_display.sch
--Design Name: lab4_seven_segment_display
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FTC_HXILINX_lab4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTC_HXILINX_lab4_seven_segment_display is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_lab4_seven_segment_display;

architecture Behavioral of FTC_HXILINX_lab4_seven_segment_display is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL M4_1E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_lab4_seven_segment_display is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_lab4_seven_segment_display;

architecture M4_1E_HXILINX_lab4_seven_segment_display_V of M4_1E_HXILINX_lab4_seven_segment_display is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_lab4_seven_segment_display_V;
----- CELL M16_1E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M16_1E_HXILINX_lab4_seven_segment_display is
  
port(
    O    : out std_logic;

    D0   : in std_logic;
    D1   : in std_logic;
    D2   : in std_logic;
    D3   : in std_logic;
    D4   : in std_logic;
    D5   : in std_logic;
    D6   : in std_logic;
    D7   : in std_logic;
    D8   : in std_logic;
    D9   : in std_logic;
    D10  : in std_logic;
    D11  : in std_logic;
    D12  : in std_logic;
    D13  : in std_logic;
    D14  : in std_logic;
    D15  : in std_logic;
    E    : in std_logic;
    S0   : in std_logic;
    S1   : in std_logic;
    S2   : in std_logic;
    S3   : in std_logic
  );
end M16_1E_HXILINX_lab4_seven_segment_display;

architecture M16_1E_HXILINX_lab4_seven_segment_display_V of M16_1E_HXILINX_lab4_seven_segment_display is
begin
  process (D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, E, S0, S1, S2, S3)
  variable sel : std_logic_vector(3 downto 0);
  begin
    sel := S3&S2&S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "0000" => O <= D0;
      when "0001" => O <= D1;
      when "0010" => O <= D2;
      when "0011" => O <= D3;
      when "0100" => O <= D4;
      when "0101" => O <= D5;
      when "0110" => O <= D6;
      when "0111" => O <= D7;
      when "1000" => O <= D8;
      when "1001" => O <= D9;
      when "1010" => O <= D10;
      when "1011" => O <= D11;
      when "1100" => O <= D12;
      when "1101" => O <= D13;
      when "1110" => O <= D14;
      when "1111" => O <= D15;
      when others => NULL;
      end case;
    end if;
    end process; 
end M16_1E_HXILINX_lab4_seven_segment_display_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity not4_MUSER_lab4_seven_segment_display is
   port ( x : in    std_logic_vector (3 downto 0); 
          y : out   std_logic_vector (3 downto 0));
end not4_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of not4_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>x(0),
                O=>y(0));
   
   XLXI_2 : INV
      port map (I=>x(1),
                O=>y(1));
   
   XLXI_3 : INV
      port map (I=>x(2),
                O=>y(2));
   
   XLXI_4 : INV
      port map (I=>x(3),
                O=>y(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity counter_v2_MUSER_lab4_seven_segment_display is
   port ( clock : in    std_logic; 
          count : out   std_logic);
end counter_v2_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of counter_v2_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_4                : std_logic;
   signal XLXN_6                : std_logic;
   signal XLXN_7                : std_logic;
   signal XLXN_9                : std_logic;
   signal XLXN_11               : std_logic;
   signal XLXN_20               : std_logic;
   signal XLXN_22               : std_logic;
   signal XLXI_1_CLR_openSignal : std_logic;
   signal XLXI_2_CLR_openSignal : std_logic;
   signal XLXI_4_CLR_openSignal : std_logic;
   signal XLXI_6_CLR_openSignal : std_logic;
   component FTC_HXILINX_lab4_seven_segment_display
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_2";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_3";
begin
   XLXN_22 <= '1';
   XLXI_1 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clock,
                CLR=>XLXI_1_CLR_openSignal,
                T=>XLXN_22,
                Q=>XLXN_20);
   
   XLXI_2 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_9,
                CLR=>XLXI_2_CLR_openSignal,
                T=>XLXN_22,
                Q=>XLXN_6);
   
   XLXI_3 : INV
      port map (I=>XLXN_20,
                O=>XLXN_9);
   
   XLXI_4 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_7,
                CLR=>XLXI_4_CLR_openSignal,
                T=>XLXN_22,
                Q=>XLXN_4);
   
   XLXI_5 : INV
      port map (I=>XLXN_4,
                O=>XLXN_11);
   
   XLXI_6 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_11,
                CLR=>XLXI_6_CLR_openSignal,
                T=>XLXN_22,
                Q=>count);
   
   XLXI_7 : INV
      port map (I=>XLXN_6,
                O=>XLXN_7);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity counter_v3_MUSER_lab4_seven_segment_display is
   port ( clock : in    std_logic; 
          y     : out   std_logic);
end counter_v3_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of counter_v3_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_5                 : std_logic;
   signal XLXN_7                 : std_logic;
   signal XLXN_8                 : std_logic;
   signal XLXN_9                 : std_logic;
   signal XLXN_10                : std_logic;
   signal XLXN_12                : std_logic;
   signal XLXN_13                : std_logic;
   signal XLXN_14                : std_logic;
   signal XLXN_15                : std_logic;
   signal XLXI_13_CLR_openSignal : std_logic;
   component counter_v2_MUSER_lab4_seven_segment_display
      port ( clock : in    std_logic; 
             count : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component FTC_HXILINX_lab4_seven_segment_display
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_13 : label is "XLXI_13_4";
begin
   XLXN_15 <= '1';
   XLXI_1 : counter_v2_MUSER_lab4_seven_segment_display
      port map (clock=>clock,
                count=>XLXN_5);
   
   XLXI_5 : INV
      port map (I=>XLXN_5,
                O=>XLXN_7);
   
   XLXI_6 : INV
      port map (I=>XLXN_8,
                O=>XLXN_9);
   
   XLXI_7 : INV
      port map (I=>XLXN_10,
                O=>XLXN_12);
   
   XLXI_8 : INV
      port map (I=>XLXN_13,
                O=>XLXN_14);
   
   XLXI_10 : counter_v2_MUSER_lab4_seven_segment_display
      port map (clock=>XLXN_7,
                count=>XLXN_8);
   
   XLXI_11 : counter_v2_MUSER_lab4_seven_segment_display
      port map (clock=>XLXN_9,
                count=>XLXN_10);
   
   XLXI_12 : counter_v2_MUSER_lab4_seven_segment_display
      port map (clock=>XLXN_12,
                count=>XLXN_13);
   
   XLXI_13 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_14,
                CLR=>XLXI_13_CLR_openSignal,
                T=>XLXN_15,
                Q=>y);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity counter_MUSER_lab4_seven_segment_display is
   port ( clock : in    std_logic; 
          y0    : out   std_logic; 
          y1    : out   std_logic; 
          y2    : out   std_logic; 
          y3    : out   std_logic);
end counter_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of counter_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal y0_DUMMY : std_logic;
   signal y1_DUMMY : std_logic;
   signal y2_DUMMY : std_logic;
   signal y3_DUMMY : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
begin
   y0 <= y0_DUMMY;
   y1 <= y1_DUMMY;
   y2 <= y2_DUMMY;
   y3 <= y3_DUMMY;
   XLXI_1 : FD
   generic map( INIT => '1')
      port map (C=>clock,
                D=>y3_DUMMY,
                Q=>y0_DUMMY);
   
   XLXI_2 : FD
      port map (C=>clock,
                D=>y0_DUMMY,
                Q=>y1_DUMMY);
   
   XLXI_3 : FD
      port map (C=>clock,
                D=>y1_DUMMY,
                Q=>y2_DUMMY);
   
   XLXI_4 : FD
      port map (C=>clock,
                D=>y2_DUMMY,
                Q=>y3_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity converter_4_to_7_MUSER_lab4_seven_segment_display is
   port ( x : in    std_logic_vector (3 downto 0); 
          y : out   std_logic_vector (6 downto 0));
end converter_4_to_7_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of converter_4_to_7_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_56  : std_logic;
   signal XLXN_58  : std_logic;
   signal XLXN_82  : std_logic;
   signal XLXN_99  : std_logic;
   signal XLXN_153 : std_logic;
   signal XLXN_154 : std_logic;
   signal XLXN_159 : std_logic;
   signal XLXN_167 : std_logic;
   signal XLXN_168 : std_logic;
   signal XLXN_169 : std_logic;
   signal XLXN_170 : std_logic;
   component M16_1E_HXILINX_lab4_seven_segment_display
      port ( D0  : in    std_logic; 
             D1  : in    std_logic; 
             D10 : in    std_logic; 
             D11 : in    std_logic; 
             D12 : in    std_logic; 
             D13 : in    std_logic; 
             D14 : in    std_logic; 
             D15 : in    std_logic; 
             D2  : in    std_logic; 
             D3  : in    std_logic; 
             D4  : in    std_logic; 
             D5  : in    std_logic; 
             D6  : in    std_logic; 
             D7  : in    std_logic; 
             D8  : in    std_logic; 
             D9  : in    std_logic; 
             E   : in    std_logic; 
             S0  : in    std_logic; 
             S1  : in    std_logic; 
             S2  : in    std_logic; 
             S3  : in    std_logic; 
             O   : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_5";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_6";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_7";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_8";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_9";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_10";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_11";
begin
   XLXN_56 <= '1';
   XLXN_58 <= '0';
   XLXN_82 <= '0';
   XLXN_99 <= '1';
   XLXI_1 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_56,
                D1=>XLXN_58,
                D2=>XLXN_56,
                D3=>XLXN_56,
                D4=>XLXN_58,
                D5=>XLXN_56,
                D6=>XLXN_56,
                D7=>XLXN_56,
                D8=>XLXN_56,
                D9=>XLXN_56,
                D10=>XLXN_56,
                D11=>XLXN_58,
                D12=>XLXN_56,
                D13=>XLXN_58,
                D14=>XLXN_56,
                D15=>XLXN_56,
                E=>XLXN_99,
                S0=>x(0),
                S1=>x(1),
                S2=>x(2),
                S3=>x(3),
                O=>XLXN_153);
   
   XLXI_2 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_99,
                D1=>XLXN_99,
                D2=>XLXN_99,
                D3=>XLXN_99,
                D4=>XLXN_99,
                D5=>XLXN_82,
                D6=>XLXN_82,
                D7=>XLXN_99,
                D8=>XLXN_99,
                D9=>XLXN_99,
                D10=>XLXN_99,
                D11=>XLXN_82,
                D12=>XLXN_82,
                D13=>XLXN_99,
                D14=>XLXN_82,
                D15=>XLXN_82,
                E=>XLXN_99,
                S0=>x(0),
                S1=>x(1),
                S2=>x(2),
                S3=>x(3),
                O=>XLXN_154);
   
   XLXI_3 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_99,
                D1=>XLXN_99,
                D2=>XLXN_82,
                D3=>XLXN_99,
                D4=>XLXN_99,
                D5=>XLXN_99,
                D6=>XLXN_99,
                D7=>XLXN_99,
                D8=>XLXN_99,
                D9=>XLXN_99,
                D10=>XLXN_99,
                D11=>XLXN_99,
                D12=>XLXN_82,
                D13=>XLXN_99,
                D14=>XLXN_82,
                D15=>XLXN_82,
                E=>XLXN_99,
                S0=>x(0),
                S1=>x(1),
                S2=>x(2),
                S3=>x(3),
                O=>XLXN_170);
   
   XLXI_4 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_99,
                D1=>XLXN_82,
                D2=>XLXN_99,
                D3=>XLXN_99,
                D4=>XLXN_82,
                D5=>XLXN_99,
                D6=>XLXN_99,
                D7=>XLXN_82,
                D8=>XLXN_99,
                D9=>XLXN_99,
                D10=>XLXN_82,
                D11=>XLXN_99,
                D12=>XLXN_99,
                D13=>XLXN_99,
                D14=>XLXN_99,
                D15=>XLXN_82,
                E=>XLXN_99,
                S0=>x(0),
                S1=>x(1),
                S2=>x(2),
                S3=>x(3),
                O=>XLXN_169);
   
   XLXI_5 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_99,
                D1=>XLXN_82,
                D2=>XLXN_99,
                D3=>XLXN_82,
                D4=>XLXN_82,
                D5=>XLXN_82,
                D6=>XLXN_99,
                D7=>XLXN_82,
                D8=>XLXN_99,
                D9=>XLXN_82,
                D10=>XLXN_99,
                D11=>XLXN_99,
                D12=>XLXN_99,
                D13=>XLXN_99,
                D14=>XLXN_99,
                D15=>XLXN_99,
                E=>XLXN_99,
                S0=>x(0),
                S1=>x(1),
                S2=>x(2),
                S3=>x(3),
                O=>XLXN_168);
   
   XLXI_6 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_99,
                D1=>XLXN_82,
                D2=>XLXN_82,
                D3=>XLXN_82,
                D4=>XLXN_99,
                D5=>XLXN_99,
                D6=>XLXN_99,
                D7=>XLXN_82,
                D8=>XLXN_99,
                D9=>XLXN_99,
                D10=>XLXN_99,
                D11=>XLXN_99,
                D12=>XLXN_99,
                D13=>XLXN_82,
                D14=>XLXN_99,
                D15=>XLXN_99,
                E=>XLXN_99,
                S0=>x(0),
                S1=>x(1),
                S2=>x(2),
                S3=>x(3),
                O=>XLXN_167);
   
   XLXI_7 : M16_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_82,
                D1=>XLXN_82,
                D2=>XLXN_99,
                D3=>XLXN_99,
                D4=>XLXN_99,
                D5=>XLXN_99,
                D6=>XLXN_99,
                D7=>XLXN_82,
                D8=>XLXN_99,
                D9=>XLXN_99,
                D10=>XLXN_99,
                D11=>XLXN_99,
                D12=>XLXN_82,
                D13=>XLXN_99,
                D14=>XLXN_99,
                D15=>XLXN_99,
                E=>XLXN_99,
                S0=>x(0),
                S1=>x(1),
                S2=>x(2),
                S3=>x(3),
                O=>XLXN_159);
   
   XLXI_13 : INV
      port map (I=>XLXN_153,
                O=>y(0));
   
   XLXI_14 : INV
      port map (I=>XLXN_154,
                O=>y(1));
   
   XLXI_15 : INV
      port map (I=>XLXN_170,
                O=>y(2));
   
   XLXI_16 : INV
      port map (I=>XLXN_169,
                O=>y(3));
   
   XLXI_17 : INV
      port map (I=>XLXN_168,
                O=>y(4));
   
   XLXI_18 : INV
      port map (I=>XLXN_167,
                O=>y(5));
   
   XLXI_19 : INV
      port map (I=>XLXN_159,
                O=>y(6));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity encoder_MUSER_lab4_seven_segment_display is
   port ( x : in    std_logic_vector (3 downto 0); 
          y : out   std_logic_vector (1 downto 0));
end encoder_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of encoder_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_28 : std_logic;
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR2
      port map (I0=>XLXN_11,
                I1=>XLXN_10,
                O=>y(0));
   
   XLXI_2 : OR2
      port map (I0=>XLXN_13,
                I1=>XLXN_12,
                O=>y(1));
   
   XLXI_3 : AND4
      port map (I0=>XLXN_28,
                I1=>XLXN_25,
                I2=>x(1),
                I3=>XLXN_18,
                O=>XLXN_10);
   
   XLXI_4 : AND4
      port map (I0=>x(3),
                I1=>XLXN_25,
                I2=>XLXN_22,
                I3=>XLXN_18,
                O=>XLXN_11);
   
   XLXI_5 : AND4
      port map (I0=>XLXN_28,
                I1=>x(2),
                I2=>XLXN_22,
                I3=>XLXN_18,
                O=>XLXN_12);
   
   XLXI_6 : AND4
      port map (I0=>x(3),
                I1=>XLXN_25,
                I2=>XLXN_22,
                I3=>XLXN_18,
                O=>XLXN_13);
   
   XLXI_7 : INV
      port map (I=>x(0),
                O=>XLXN_18);
   
   XLXI_8 : INV
      port map (I=>x(1),
                O=>XLXN_22);
   
   XLXI_9 : INV
      port map (I=>x(2),
                O=>XLXN_25);
   
   XLXI_10 : INV
      port map (I=>x(3),
                O=>XLXN_28);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity converter_16_to_4_MUSER_lab4_seven_segment_display is
   port ( anode : in    std_logic_vector (3 downto 0); 
          x     : in    std_logic_vector (15 downto 0); 
          s     : out   std_logic_vector (1 downto 0); 
          y     : out   std_logic_vector (3 downto 0));
end converter_16_to_4_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of converter_16_to_4_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   signal XLXN_14 : std_logic;
   signal s_DUMMY : std_logic_vector (1 downto 0);
   component M4_1E_HXILINX_lab4_seven_segment_display
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component encoder_MUSER_lab4_seven_segment_display
      port ( x : in    std_logic_vector (3 downto 0); 
             y : out   std_logic_vector (1 downto 0));
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_12";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_13";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_14";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_15";
begin
   XLXN_14 <= '1';
   s(1 downto 0) <= s_DUMMY(1 downto 0);
   XLXI_1 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>x(0),
                D1=>x(4),
                D2=>x(8),
                D3=>x(12),
                E=>XLXN_14,
                S0=>s_DUMMY(0),
                S1=>s_DUMMY(1),
                O=>y(0));
   
   XLXI_2 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>x(1),
                D1=>x(5),
                D2=>x(9),
                D3=>x(13),
                E=>XLXN_14,
                S0=>s_DUMMY(0),
                S1=>s_DUMMY(1),
                O=>y(1));
   
   XLXI_3 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>x(2),
                D1=>x(6),
                D2=>x(10),
                D3=>x(14),
                E=>XLXN_14,
                S0=>s_DUMMY(0),
                S1=>s_DUMMY(1),
                O=>y(2));
   
   XLXI_4 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>x(3),
                D1=>x(7),
                D2=>x(11),
                D3=>x(15),
                E=>XLXN_14,
                S0=>s_DUMMY(0),
                S1=>s_DUMMY(1),
                O=>y(3));
   
   XLXI_5 : encoder_MUSER_lab4_seven_segment_display
      port map (x(3 downto 0)=>anode(3 downto 0),
                y(1 downto 0)=>s_DUMMY(1 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_12     : std_logic;
   signal XLXN_17     : std_logic;
   signal XLXN_26     : std_logic_vector (3 downto 0);
   signal XLXN_39     : std_logic;
   signal XLXN_44     : std_logic_vector (3 downto 0);
   signal XLXN_46     : std_logic;
   signal XLXN_47     : std_logic;
   signal XLXN_48     : std_logic;
   signal XLXN_49     : std_logic;
   signal anode_DUMMY : std_logic_vector (3 downto 0);
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component counter_MUSER_lab4_seven_segment_display
      port ( clock : in    std_logic; 
             y0    : out   std_logic; 
             y1    : out   std_logic; 
             y2    : out   std_logic; 
             y3    : out   std_logic);
   end component;
   
   component converter_16_to_4_MUSER_lab4_seven_segment_display
      port ( anode : in    std_logic_vector (3 downto 0); 
             x     : in    std_logic_vector (15 downto 0); 
             y     : out   std_logic_vector (3 downto 0));
   end component;
   
   component converter_4_to_7_MUSER_lab4_seven_segment_display
      port ( x : in    std_logic_vector (3 downto 0); 
             y : out   std_logic_vector (6 downto 0));
   end component;
   
   component counter_v3_MUSER_lab4_seven_segment_display
      port ( clock : in    std_logic; 
             y     : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component not4_MUSER_lab4_seven_segment_display
      port ( x : in    std_logic_vector (3 downto 0); 
             y : out   std_logic_vector (3 downto 0));
   end component;
   
begin
   anode(3 downto 0) <= anode_DUMMY(3 downto 0);
   XLXI_5 : AND2
      port map (I0=>pushbutton,
                I1=>clk,
                O=>XLXN_12);
   
   XLXI_6 : OR2
      port map (I0=>XLXN_39,
                I1=>XLXN_12,
                O=>XLXN_17);
   
   XLXI_7 : counter_MUSER_lab4_seven_segment_display
      port map (clock=>XLXN_17,
                y0=>XLXN_46,
                y1=>XLXN_47,
                y2=>XLXN_48,
                y3=>XLXN_49);
   
   XLXI_8 : converter_16_to_4_MUSER_lab4_seven_segment_display
      port map (anode(3 downto 0)=>XLXN_44(3 downto 0),
                x(15 downto 0)=>b(15 downto 0),
                y(3 downto 0)=>XLXN_26(3 downto 0));
   
   XLXI_9 : converter_4_to_7_MUSER_lab4_seven_segment_display
      port map (x(3 downto 0)=>XLXN_26(3 downto 0),
                y(6 downto 0)=>cathode(6 downto 0));
   
   XLXI_14 : counter_v3_MUSER_lab4_seven_segment_display
      port map (clock=>clk,
                y=>XLXN_39);
   
   XLXI_23 : INV
      port map (I=>XLXN_46,
                O=>anode_DUMMY(0));
   
   XLXI_24 : INV
      port map (I=>XLXN_47,
                O=>anode_DUMMY(1));
   
   XLXI_25 : INV
      port map (I=>XLXN_48,
                O=>anode_DUMMY(2));
   
   XLXI_26 : INV
      port map (I=>XLXN_49,
                O=>anode_DUMMY(3));
   
   XLXI_27 : not4_MUSER_lab4_seven_segment_display
      port map (x(3 downto 0)=>anode_DUMMY(3 downto 0),
                y(3 downto 0)=>XLXN_44(3 downto 0));
   
end BEHAVIORAL;



