--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab3_reg_file.vhf
-- /___/   /\     Timestamp : 08/19/2017 16:50:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/btech/cs1160328/lab3_reg_file/lab3_reg_file.vhf -w /home/btech/cs1160328/lab3_reg_file/lab3_reg_file.sch
--Design Name: lab3_reg_file
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL OR8_HXILINX_lab3_reg_file -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR8_HXILINX_lab3_reg_file is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic;
    I6  : in std_logic;
    I7  : in std_logic
  );
end OR8_HXILINX_lab3_reg_file;

architecture OR8_HXILINX_lab3_reg_file_V of OR8_HXILINX_lab3_reg_file is
begin
  O <= (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7);
end OR8_HXILINX_lab3_reg_file_V;
----- CELL M2_1_HXILINX_lab3_reg_file -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_lab3_reg_file is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_lab3_reg_file;

architecture M2_1_HXILINX_lab3_reg_file_V of M2_1_HXILINX_lab3_reg_file is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_lab3_reg_file_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity demux8_MUSER_lab3_reg_file is
   port ( e   : in    std_logic; 
          s   : in    std_logic_vector (2 downto 0); 
          x   : in    std_logic; 
          neg : out   std_logic_vector (2 downto 0); 
          y0  : out   std_logic; 
          y1  : out   std_logic; 
          y2  : out   std_logic; 
          y3  : out   std_logic; 
          y4  : out   std_logic; 
          y5  : out   std_logic; 
          y6  : out   std_logic; 
          y7  : out   std_logic);
end demux8_MUSER_lab3_reg_file;

architecture BEHAVIORAL of demux8_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   signal XLXN_21   : std_logic;
   signal neg_DUMMY : std_logic_vector (2 downto 0);
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   neg(2 downto 0) <= neg_DUMMY(2 downto 0);
   XLXI_1 : AND4
      port map (I0=>XLXN_21,
                I1=>neg_DUMMY(2),
                I2=>neg_DUMMY(1),
                I3=>neg_DUMMY(0),
                O=>y0);
   
   XLXI_2 : AND4
      port map (I0=>XLXN_21,
                I1=>s(0),
                I2=>neg_DUMMY(1),
                I3=>neg_DUMMY(2),
                O=>y1);
   
   XLXI_3 : AND4
      port map (I0=>XLXN_21,
                I1=>s(1),
                I2=>neg_DUMMY(0),
                I3=>neg_DUMMY(2),
                O=>y2);
   
   XLXI_4 : AND4
      port map (I0=>XLXN_21,
                I1=>neg_DUMMY(2),
                I2=>s(1),
                I3=>s(0),
                O=>y3);
   
   XLXI_5 : AND4
      port map (I0=>XLXN_21,
                I1=>s(2),
                I2=>neg_DUMMY(1),
                I3=>neg_DUMMY(0),
                O=>y4);
   
   XLXI_6 : AND4
      port map (I0=>XLXN_21,
                I1=>s(2),
                I2=>s(0),
                I3=>neg_DUMMY(1),
                O=>y5);
   
   XLXI_7 : AND4
      port map (I0=>XLXN_21,
                I1=>s(2),
                I2=>s(1),
                I3=>neg_DUMMY(0),
                O=>y6);
   
   XLXI_8 : AND4
      port map (I0=>XLXN_21,
                I1=>s(2),
                I2=>s(1),
                I3=>s(0),
                O=>y7);
   
   XLXI_9 : AND2
      port map (I0=>e,
                I1=>x,
                O=>XLXN_21);
   
   XLXI_10 : INV
      port map (I=>s(0),
                O=>neg_DUMMY(0));
   
   XLXI_11 : INV
      port map (I=>s(1),
                O=>neg_DUMMY(1));
   
   XLXI_12 : INV
      port map (I=>s(2),
                O=>neg_DUMMY(2));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity register_file_MUSER_lab3_reg_file is
   port ( clock : in    std_logic; 
          wdata : in    std_logic_vector (3 downto 0); 
          rdata : out   std_logic_vector (3 downto 0));
end register_file_MUSER_lab3_reg_file;

architecture BEHAVIORAL of register_file_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
begin
   XLXI_1 : FD
      port map (C=>clock,
                D=>wdata(0),
                Q=>rdata(0));
   
   XLXI_2 : FD
      port map (C=>clock,
                D=>wdata(1),
                Q=>rdata(1));
   
   XLXI_3 : FD
      port map (C=>clock,
                D=>wdata(2),
                Q=>rdata(2));
   
   XLXI_4 : FD
      port map (C=>clock,
                D=>wdata(3),
                Q=>rdata(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux4bit_MUSER_lab3_reg_file is
   port ( d0 : in    std_logic_vector (3 downto 0); 
          d1 : in    std_logic_vector (3 downto 0); 
          s  : in    std_logic; 
          y  : out   std_logic_vector (3 downto 0));
end mux4bit_MUSER_lab3_reg_file;

architecture BEHAVIORAL of mux4bit_MUSER_lab3_reg_file is
   attribute HU_SET     : string ;
   component M2_1_HXILINX_lab3_reg_file
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_2";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_3";
begin
   XLXI_1 : M2_1_HXILINX_lab3_reg_file
      port map (D0=>d0(0),
                D1=>d1(0),
                S0=>s,
                O=>y(0));
   
   XLXI_2 : M2_1_HXILINX_lab3_reg_file
      port map (D0=>d0(1),
                D1=>d1(1),
                S0=>s,
                O=>y(1));
   
   XLXI_3 : M2_1_HXILINX_lab3_reg_file
      port map (D0=>d0(2),
                D1=>d1(2),
                S0=>s,
                O=>y(2));
   
   XLXI_4 : M2_1_HXILINX_lab3_reg_file
      port map (D0=>d0(3),
                D1=>d1(3),
                S0=>s,
                O=>y(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux8_MUSER_lab3_reg_file is
   port ( e   : in    std_logic; 
          s0  : in    std_logic; 
          s1  : in    std_logic; 
          s2  : in    std_logic; 
          x0  : in    std_logic; 
          x1  : in    std_logic; 
          x2  : in    std_logic; 
          x3  : in    std_logic; 
          x4  : in    std_logic; 
          x5  : in    std_logic; 
          x6  : in    std_logic; 
          x7  : in    std_logic; 
          neg : out   std_logic_vector (2 downto 0); 
          y   : out   std_logic);
end mux8_MUSER_lab3_reg_file;

architecture BEHAVIORAL of mux8_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_9    : std_logic;
   signal XLXN_10   : std_logic;
   signal XLXN_11   : std_logic;
   signal XLXN_12   : std_logic;
   signal XLXN_13   : std_logic;
   signal XLXN_14   : std_logic;
   signal XLXN_15   : std_logic;
   signal XLXN_16   : std_logic;
   signal neg_DUMMY : std_logic_vector (2 downto 0);
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component OR8_HXILINX_lab3_reg_file
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             I6 : in    std_logic; 
             I7 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_11 : label is "XLXI_11_4";
begin
   neg(2 downto 0) <= neg_DUMMY(2 downto 0);
   XLXI_1 : AND5
      port map (I0=>neg_DUMMY(2),
                I1=>s1,
                I2=>neg_DUMMY(0),
                I3=>x2,
                I4=>e,
                O=>XLXN_11);
   
   XLXI_2 : AND5
      port map (I0=>neg_DUMMY(2),
                I1=>s1,
                I2=>s0,
                I3=>x3,
                I4=>e,
                O=>XLXN_12);
   
   XLXI_3 : AND5
      port map (I0=>s2,
                I1=>neg_DUMMY(1),
                I2=>neg_DUMMY(0),
                I3=>x4,
                I4=>e,
                O=>XLXN_13);
   
   XLXI_4 : AND5
      port map (I0=>s2,
                I1=>neg_DUMMY(1),
                I2=>s0,
                I3=>x5,
                I4=>e,
                O=>XLXN_14);
   
   XLXI_5 : AND5
      port map (I0=>s2,
                I1=>s1,
                I2=>neg_DUMMY(0),
                I3=>x6,
                I4=>e,
                O=>XLXN_15);
   
   XLXI_6 : AND5
      port map (I0=>s2,
                I1=>s1,
                I2=>s0,
                I3=>x7,
                I4=>e,
                O=>XLXN_16);
   
   XLXI_7 : AND5
      port map (I0=>neg_DUMMY(2),
                I1=>neg_DUMMY(1),
                I2=>neg_DUMMY(0),
                I3=>x0,
                I4=>e,
                O=>XLXN_9);
   
   XLXI_8 : AND5
      port map (I0=>neg_DUMMY(2),
                I1=>neg_DUMMY(1),
                I2=>s0,
                I3=>x1,
                I4=>e,
                O=>XLXN_10);
   
   XLXI_11 : OR8_HXILINX_lab3_reg_file
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                I2=>XLXN_14,
                I3=>XLXN_13,
                I4=>XLXN_12,
                I5=>XLXN_11,
                I6=>XLXN_10,
                I7=>XLXN_9,
                O=>y);
   
   XLXI_12 : INV
      port map (I=>s0,
                O=>neg_DUMMY(0));
   
   XLXI_13 : INV
      port map (I=>s1,
                O=>neg_DUMMY(1));
   
   XLXI_14 : INV
      port map (I=>s2,
                O=>neg_DUMMY(2));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux8_4bit_MUSER_lab3_reg_file is
   port ( e  : in    std_logic; 
          s  : in    std_logic_vector (2 downto 0); 
          x0 : in    std_logic_vector (3 downto 0); 
          x1 : in    std_logic_vector (3 downto 0); 
          x2 : in    std_logic_vector (3 downto 0); 
          x3 : in    std_logic_vector (3 downto 0); 
          x4 : in    std_logic_vector (3 downto 0); 
          x5 : in    std_logic_vector (3 downto 0); 
          x6 : in    std_logic_vector (3 downto 0); 
          x7 : in    std_logic_vector (3 downto 0); 
          y  : out   std_logic_vector (3 downto 0));
end mux8_4bit_MUSER_lab3_reg_file;

architecture BEHAVIORAL of mux8_4bit_MUSER_lab3_reg_file is
   component mux8_MUSER_lab3_reg_file
      port ( e  : in    std_logic; 
             s0 : in    std_logic; 
             s1 : in    std_logic; 
             s2 : in    std_logic; 
             x0 : in    std_logic; 
             x1 : in    std_logic; 
             x2 : in    std_logic; 
             x3 : in    std_logic; 
             x4 : in    std_logic; 
             x5 : in    std_logic; 
             x6 : in    std_logic; 
             x7 : in    std_logic; 
             y  : out   std_logic);
   end component;
   
begin
   XLXI_1 : mux8_MUSER_lab3_reg_file
      port map (e=>e,
                s0=>s(0),
                s1=>s(1),
                s2=>s(2),
                x0=>x0(0),
                x1=>x1(0),
                x2=>x2(0),
                x3=>x3(0),
                x4=>x4(0),
                x5=>x5(0),
                x6=>x6(0),
                x7=>x7(0),
                y=>y(0));
   
   XLXI_2 : mux8_MUSER_lab3_reg_file
      port map (e=>e,
                s0=>s(0),
                s1=>s(1),
                s2=>s(2),
                x0=>x0(3),
                x1=>x1(3),
                x2=>x2(3),
                x3=>x3(3),
                x4=>x4(3),
                x5=>x5(3),
                x6=>x6(3),
                x7=>x7(3),
                y=>y(3));
   
   XLXI_3 : mux8_MUSER_lab3_reg_file
      port map (e=>e,
                s0=>s(0),
                s1=>s(1),
                s2=>s(2),
                x0=>x0(1),
                x1=>x1(1),
                x2=>x2(1),
                x3=>x3(1),
                x4=>x4(1),
                x5=>x5(1),
                x6=>x6(1),
                x7=>x7(1),
                y=>y(1));
   
   XLXI_4 : mux8_MUSER_lab3_reg_file
      port map (e=>e,
                s0=>s(0),
                s1=>s(1),
                s2=>s(2),
                x0=>x0(2),
                x1=>x1(2),
                x2=>x2(2),
                x3=>x3(2),
                x4=>x4(2),
                x5=>x5(2),
                x6=>x6(2),
                x7=>x7(2),
                y=>y(2));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab3_reg_file is
   port ( clock              : in    std_logic; 
          mode               : in    std_logic; 
          rd_addr1           : in    std_logic_vector (2 downto 0); 
          rd_addr2           : in    std_logic_vector (2 downto 0); 
          write_enable       : in    std_logic; 
          wr_addr            : in    std_logic_vector (2 downto 0); 
          wr_data            : in    std_logic_vector (3 downto 0); 
          rd_data1           : out   std_logic_vector (3 downto 0); 
          rd_data1_xor_data2 : out   std_logic_vector (3 downto 0); 
          rd_data2           : out   std_logic_vector (3 downto 0));
end lab3_reg_file;

architecture BEHAVIORAL of lab3_reg_file is
   attribute BOX_TYPE   : string ;
   signal XLXN_77                  : std_logic;
   signal XLXN_78                  : std_logic;
   signal XLXN_89                  : std_logic;
   signal XLXN_90                  : std_logic;
   signal XLXN_91                  : std_logic;
   signal XLXN_92                  : std_logic;
   signal XLXN_93                  : std_logic;
   signal XLXN_94                  : std_logic;
   signal XLXN_95                  : std_logic;
   signal XLXN_96                  : std_logic;
   signal XLXN_104                 : std_logic_vector (3 downto 0);
   signal XLXN_105                 : std_logic_vector (3 downto 0);
   signal XLXN_106                 : std_logic_vector (3 downto 0);
   signal XLXN_107                 : std_logic_vector (3 downto 0);
   signal XLXN_108                 : std_logic_vector (3 downto 0);
   signal XLXN_109                 : std_logic_vector (3 downto 0);
   signal XLXN_110                 : std_logic_vector (3 downto 0);
   signal XLXN_111                 : std_logic_vector (3 downto 0);
   signal XLXN_112                 : std_logic_vector (3 downto 0);
   signal rd_data1_DUMMY           : std_logic_vector (3 downto 0);
   signal rd_data2_DUMMY           : std_logic_vector (3 downto 0);
   signal rd_data1_xor_data2_DUMMY : std_logic_vector (3 downto 0);
   component mux8_4bit_MUSER_lab3_reg_file
      port ( e  : in    std_logic; 
             s  : in    std_logic_vector (2 downto 0); 
             x0 : in    std_logic_vector (3 downto 0); 
             x1 : in    std_logic_vector (3 downto 0); 
             x2 : in    std_logic_vector (3 downto 0); 
             x3 : in    std_logic_vector (3 downto 0); 
             x4 : in    std_logic_vector (3 downto 0); 
             x5 : in    std_logic_vector (3 downto 0); 
             x6 : in    std_logic_vector (3 downto 0); 
             x7 : in    std_logic_vector (3 downto 0); 
             y  : out   std_logic_vector (3 downto 0));
   end component;
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component demux8_MUSER_lab3_reg_file
      port ( e  : in    std_logic; 
             s  : in    std_logic_vector (2 downto 0); 
             x  : in    std_logic; 
             y0 : out   std_logic; 
             y1 : out   std_logic; 
             y2 : out   std_logic; 
             y3 : out   std_logic; 
             y4 : out   std_logic; 
             y5 : out   std_logic; 
             y6 : out   std_logic; 
             y7 : out   std_logic);
   end component;
   
   component mux4bit_MUSER_lab3_reg_file
      port ( d0 : in    std_logic_vector (3 downto 0); 
             d1 : in    std_logic_vector (3 downto 0); 
             s  : in    std_logic; 
             y  : out   std_logic_vector (3 downto 0));
   end component;
   
   component register_file_MUSER_lab3_reg_file
      port ( clock : in    std_logic; 
             rdata : out   std_logic_vector (3 downto 0); 
             wdata : in    std_logic_vector (3 downto 0));
   end component;
   
begin
   XLXN_77 <= '1';
   XLXN_78 <= '1';
   rd_data1(3 downto 0) <= rd_data1_DUMMY(3 downto 0);
   rd_data1_xor_data2(3 downto 0) <= rd_data1_xor_data2_DUMMY(3 downto 0);
   rd_data2(3 downto 0) <= rd_data2_DUMMY(3 downto 0);
   XLXI_65 : mux8_4bit_MUSER_lab3_reg_file
      port map (e=>XLXN_77,
                s(2 downto 0)=>rd_addr1(2 downto 0),
                x0(3 downto 0)=>XLXN_105(3 downto 0),
                x1(3 downto 0)=>XLXN_106(3 downto 0),
                x2(3 downto 0)=>XLXN_107(3 downto 0),
                x3(3 downto 0)=>XLXN_108(3 downto 0),
                x4(3 downto 0)=>XLXN_109(3 downto 0),
                x5(3 downto 0)=>XLXN_110(3 downto 0),
                x6(3 downto 0)=>XLXN_111(3 downto 0),
                x7(3 downto 0)=>XLXN_112(3 downto 0),
                y(3 downto 0)=>rd_data1_DUMMY(3 downto 0));
   
   XLXI_66 : mux8_4bit_MUSER_lab3_reg_file
      port map (e=>XLXN_78,
                s(2 downto 0)=>rd_addr2(2 downto 0),
                x0(3 downto 0)=>XLXN_105(3 downto 0),
                x1(3 downto 0)=>XLXN_106(3 downto 0),
                x2(3 downto 0)=>XLXN_107(3 downto 0),
                x3(3 downto 0)=>XLXN_108(3 downto 0),
                x4(3 downto 0)=>XLXN_109(3 downto 0),
                x5(3 downto 0)=>XLXN_110(3 downto 0),
                x6(3 downto 0)=>XLXN_111(3 downto 0),
                x7(3 downto 0)=>XLXN_112(3 downto 0),
                y(3 downto 0)=>rd_data2_DUMMY(3 downto 0));
   
   XLXI_68 : XOR2
      port map (I0=>rd_data2_DUMMY(0),
                I1=>rd_data1_DUMMY(0),
                O=>rd_data1_xor_data2_DUMMY(0));
   
   XLXI_69 : XOR2
      port map (I0=>rd_data2_DUMMY(1),
                I1=>rd_data1_DUMMY(1),
                O=>rd_data1_xor_data2_DUMMY(1));
   
   XLXI_70 : XOR2
      port map (I0=>rd_data2_DUMMY(2),
                I1=>rd_data1_DUMMY(2),
                O=>rd_data1_xor_data2_DUMMY(2));
   
   XLXI_71 : XOR2
      port map (I0=>rd_data2_DUMMY(3),
                I1=>rd_data1_DUMMY(3),
                O=>rd_data1_xor_data2_DUMMY(3));
   
   XLXI_74 : demux8_MUSER_lab3_reg_file
      port map (e=>write_enable,
                s(2 downto 0)=>wr_addr(2 downto 0),
                x=>clock,
                y0=>XLXN_89,
                y1=>XLXN_90,
                y2=>XLXN_91,
                y3=>XLXN_92,
                y4=>XLXN_93,
                y5=>XLXN_94,
                y6=>XLXN_95,
                y7=>XLXN_96);
   
   XLXI_75 : mux4bit_MUSER_lab3_reg_file
      port map (d0(3 downto 0)=>wr_data(3 downto 0),
                d1(3 downto 0)=>rd_data1_xor_data2_DUMMY(3 downto 0),
                s=>mode,
                y(3 downto 0)=>XLXN_104(3 downto 0));
   
   XLXI_76 : register_file_MUSER_lab3_reg_file
      port map (clock=>XLXN_89,
                wdata(3 downto 0)=>XLXN_104(3 downto 0),
                rdata(3 downto 0)=>XLXN_105(3 downto 0));
   
   XLXI_77 : register_file_MUSER_lab3_reg_file
      port map (clock=>XLXN_90,
                wdata(3 downto 0)=>XLXN_104(3 downto 0),
                rdata(3 downto 0)=>XLXN_106(3 downto 0));
   
   XLXI_78 : register_file_MUSER_lab3_reg_file
      port map (clock=>XLXN_91,
                wdata(3 downto 0)=>XLXN_104(3 downto 0),
                rdata(3 downto 0)=>XLXN_107(3 downto 0));
   
   XLXI_79 : register_file_MUSER_lab3_reg_file
      port map (clock=>XLXN_92,
                wdata(3 downto 0)=>XLXN_104(3 downto 0),
                rdata(3 downto 0)=>XLXN_108(3 downto 0));
   
   XLXI_80 : register_file_MUSER_lab3_reg_file
      port map (clock=>XLXN_93,
                wdata(3 downto 0)=>XLXN_104(3 downto 0),
                rdata(3 downto 0)=>XLXN_109(3 downto 0));
   
   XLXI_81 : register_file_MUSER_lab3_reg_file
      port map (clock=>XLXN_94,
                wdata(3 downto 0)=>XLXN_104(3 downto 0),
                rdata(3 downto 0)=>XLXN_110(3 downto 0));
   
   XLXI_82 : register_file_MUSER_lab3_reg_file
      port map (clock=>XLXN_95,
                wdata(3 downto 0)=>XLXN_104(3 downto 0),
                rdata(3 downto 0)=>XLXN_111(3 downto 0));
   
   XLXI_83 : register_file_MUSER_lab3_reg_file
      port map (clock=>XLXN_96,
                wdata(3 downto 0)=>XLXN_104(3 downto 0),
                rdata(3 downto 0)=>XLXN_112(3 downto 0));
   
end BEHAVIORAL;



