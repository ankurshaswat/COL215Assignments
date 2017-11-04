--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab1_car_light.vhf
-- /___/   /\     Timestamp : 07/31/2017 15:37:21
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/btech/cs1160328/lab1_car_light/lab1_car_light.vhf -w /home/btech/cs1160328/lab1_car_light/lab1_car_light.sch
--Design Name: lab1_car_light
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab1_car_light is
   port ( D1      : in    std_logic; 
          D2      : in    std_logic; 
          D3      : in    std_logic; 
          D4      : in    std_logic; 
          SW_DOOR : in    std_logic; 
          SW_OFF  : in    std_logic; 
          SW_ON   : in    std_logic; 
          INVALID : out   std_logic; 
          LIGHT   : out   std_logic);
end lab1_car_light;

architecture BEHAVIORAL of lab1_car_light is
   attribute BOX_TYPE   : string ;
   signal XLXN_17       : std_logic;
   signal XLXN_18       : std_logic;
   signal XLXN_19       : std_logic;
   signal XLXN_20       : std_logic;
   signal XLXN_21       : std_logic;
   signal XLXN_22       : std_logic;
   signal INVALID_DUMMY : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
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
   
   component XOR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR3 : component is "BLACK_BOX";
   
   component NAND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND3 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component NAND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND2 : component is "BLACK_BOX";
   
begin
   INVALID <= INVALID_DUMMY;
   XLXI_1 : OR4
      port map (I0=>D4,
                I1=>D3,
                I2=>D2,
                I3=>D1,
                O=>XLXN_17);
   
   XLXI_3 : AND2
      port map (I0=>SW_DOOR,
                I1=>XLXN_17,
                O=>XLXN_22);
   
   XLXI_4 : OR2
      port map (I0=>SW_ON,
                I1=>XLXN_22,
                O=>XLXN_21);
   
   XLXI_5 : AND2
      port map (I0=>XLXN_20,
                I1=>XLXN_21,
                O=>LIGHT);
   
   XLXI_6 : XOR3
      port map (I0=>SW_OFF,
                I1=>SW_ON,
                I2=>SW_DOOR,
                O=>XLXN_19);
   
   XLXI_7 : NAND3
      port map (I0=>SW_OFF,
                I1=>SW_ON,
                I2=>SW_DOOR,
                O=>XLXN_18);
   
   XLXI_9 : INV
      port map (I=>INVALID_DUMMY,
                O=>XLXN_20);
   
   XLXI_10 : NAND2
      port map (I0=>XLXN_18,
                I1=>XLXN_19,
                O=>INVALID_DUMMY);
   
end BEHAVIORAL;


