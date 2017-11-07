--------------------------------------------------------------------------------
    2 -- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
    3 --------------------------------------------------------------------------------
    4 --   ____  ____
    5 --  /   /\/   /
    6 -- /___/  \  /    Vendor: Xilinx
    7 -- \   \   \/     Version : 14.7
    8 --  \   \         Application : sch2hdl
    9 --  /   /         Filename : lab2_port_switch.vhf
   10 -- /___/   /\     Timestamp : 08/14/2017 16:27:21
   11 -- \   \  /  \
   12 --  \___\/\___\
   13 --
   14 --Command: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl lab2_port_switch.vhf -w /home/btech/cs1160341/lab2_port_switch/lab2_port_switch.sch
   15 --Design Name: lab2_port_switch
   16 --Device: artix7
   17 --Purpose:
   18 --    This vhdl netlist is translated from an ECS schematic. It can be
   19 --    synthesized and simulated, but it should not be modified.
   20 --
   21
   22 library ieee;
   23 use ieee.std_logic_1164.ALL;
   24 use ieee.numeric_std.ALL;
   25 library UNISIM;
   26 use UNISIM.Vcomponents.ALL;
   27
   28 entity de_mux_MUSER_lab2_port_switch is
   29    port ( e  : in    std_logic;
   30           s0 : in    std_logic;
   31           s1 : in    std_logic;
   32           x  : in    std_logic;
   33           y0 : out   std_logic;
   34           y1 : out   std_logic;
   35           y2 : out   std_logic;
   36           y3 : out   std_logic);
   37 end de_mux_MUSER_lab2_port_switch;
   38
   39 architecture BEHAVIORAL of de_mux_MUSER_lab2_port_switch is
   40    attribute BOX_TYPE   : string ;
   41    signal XLXN_17 : std_logic;
   42    signal XLXN_18 : std_logic;
   43    component INV
   44       port ( I : in    std_logic;
   45              O : out   std_logic);
   46    end component;
   47    attribute BOX_TYPE of INV : component is "BLACK_BOX";
   48
   49    component AND4
   50       port ( I0 : in    std_logic;
   51              I1 : in    std_logic;
   52              I2 : in    std_logic;
   53              I3 : in    std_logic;
   54              O  : out   std_logic);
   55    end component;
   56    attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   57
   58 begin
   59    XLXI_1 : INV
   60       port map (I=>s0,
   61                 O=>XLXN_18);
   62
   63    XLXI_2 : INV
   64       port map (I=>s1,
   65                 O=>XLXN_17);
   66
   67    XLXI_3 : AND4
   68       port map (I0=>x,
   69                 I1=>e,
   70                 I2=>XLXN_17,
   71                 I3=>XLXN_18,
   72                 O=>y0);
   73
   74    XLXI_4 : AND4
   75       port map (I0=>x,
   76                 I1=>e,
   77                 I2=>XLXN_17,
   78                 I3=>s0,
   79                 O=>y1);
   80
   81    XLXI_5 : AND4
   82       port map (I0=>x,
   83                 I1=>e,
   84                 I2=>XLXN_18,
   85                 I3=>s1,
   86                 O=>y2);
   87
   88    XLXI_6 : AND4
   89       port map (I0=>x,
   90                 I1=>e,
   91                 I2=>s1,
   92                 I3=>s0,
   93                 O=>y3);
   94
   95 end BEHAVIORAL;
   96
   97
   98
   99 library ieee;
  100 use ieee.std_logic_1164.ALL;
  101 use ieee.numeric_std.ALL;
  102 library UNISIM;
  103 use UNISIM.Vcomponents.ALL;
  104
  105 entity mux_MUSER_lab2_port_switch is
  106    port ( e  : in    std_logic;
  107           s0 : in    std_logic;
  108           s1 : in    std_logic;
  109           x0 : in    std_logic;
  110           x1 : in    std_logic;
  111           x2 : in    std_logic;
  112           x3 : in    std_logic;
  113           y  : out   std_logic);
  114 end mux_MUSER_lab2_port_switch;
  115
  116 architecture BEHAVIORAL of mux_MUSER_lab2_port_switch is
  117    attribute BOX_TYPE   : string ;
  118    signal XLXN_2  : std_logic;
  119    signal XLXN_4  : std_logic;
  120    signal XLXN_6  : std_logic;
  121    signal XLXN_7  : std_logic;
  122    signal XLXN_8  : std_logic;
  123    signal XLXN_12 : std_logic;
  124    signal XLXN_13 : std_logic;
  125    component INV
  126       port ( I : in    std_logic;
  127              O : out   std_logic);
  128    end component;
  129    attribute BOX_TYPE of INV : component is "BLACK_BOX";
  130
  131    component AND3
  132       port ( I0 : in    std_logic;
  133              I1 : in    std_logic;
  134              I2 : in    std_logic;
  135              O  : out   std_logic);
  136    end component;
  137    attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
  138
  139    component OR4
  140       port ( I0 : in    std_logic;
  141              I1 : in    std_logic;
  142              I2 : in    std_logic;
  143              I3 : in    std_logic;
  144              O  : out   std_logic);
  145    end component;
  146    attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
  147
  148    component AND2
  149       port ( I0 : in    std_logic;
  150              I1 : in    std_logic;
  151              O  : out   std_logic);
  152    end component;
  153    attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
  154
  155 begin
  156    XLXI_1 : INV
  157       port map (I=>s0,
  158                 O=>XLXN_12);
  159
  160    XLXI_2 : INV
  161       port map (I=>s1,
  162                 O=>XLXN_13);
  163
  164    XLXI_3 : AND3
  165       port map (I0=>x0,
  166                 I1=>XLXN_13,
  167                 I2=>XLXN_12,
  168                 O=>XLXN_4);
  169
  170    XLXI_4 : AND3
  171       port map (I0=>XLXN_13,
  172                 I1=>s0,
  173                 I2=>x1,
  174                 O=>XLXN_6);
  175
  176    XLXI_5 : AND3
  177       port map (I0=>x2,
  178                 I1=>XLXN_12,
  179                 I2=>s1,
  180                 O=>XLXN_7);
  181
  182    XLXI_6 : AND3
  183       port map (I0=>x3,
  184                 I1=>s0,
  185                 I2=>s1,
  186                 O=>XLXN_8);
  187
  188    XLXI_7 : OR4
  189       port map (I0=>XLXN_8,
  190                 I1=>XLXN_7,
  191                 I2=>XLXN_6,
  192                 I3=>XLXN_4,
  193                 O=>XLXN_2);
  194
  195    XLXI_8 : AND2
  196       port map (I0=>XLXN_2,
  197                 I1=>e,
  198                 O=>y);
  199
  200 end BEHAVIORAL;
  201
  202
  203
  204 library ieee;
  205 use ieee.std_logic_1164.ALL;
  206 use ieee.numeric_std.ALL;
  207 library UNISIM;
  208 use UNISIM.Vcomponents.ALL;
  209
  210 entity priority_encoder_MUSER_lab2_port_switch is
  211    port ( x0 : in    std_logic;
  212           x1 : in    std_logic;
  213           x2 : in    std_logic;
  214           x3 : in    std_logic;
  215           e  : out   std_logic;
  216           s0 : out   std_logic;
  217           s1 : out   std_logic);
  218 end priority_encoder_MUSER_lab2_port_switch;
  219
  220 architecture BEHAVIORAL of priority_encoder_MUSER_lab2_port_switch is
  221    attribute BOX_TYPE   : string ;
  222    signal XLXN_54 : std_logic;
  223    signal XLXN_60 : std_logic;
  224    signal XLXN_61 : std_logic;
  225    signal XLXN_62 : std_logic;
  226    component OR4
  227       port ( I0 : in    std_logic;
  228              I1 : in    std_logic;
  229              I2 : in    std_logic;
  230              I3 : in    std_logic;
  231              O  : out   std_logic);
  232    end component;
  233    attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
  234
  235    component OR2
  236       port ( I0 : in    std_logic;
  237              I1 : in    std_logic;
  238              O  : out   std_logic);
  239    end component;
  240    attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
  241
  242    component AND3
  243       port ( I0 : in    std_logic;
  244              I1 : in    std_logic;
  245              I2 : in    std_logic;
  246              O  : out   std_logic);
  247    end component;
  248    attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
  249
  250    component AND2
  251       port ( I0 : in    std_logic;
  252              I1 : in    std_logic;
  253              O  : out   std_logic);
  254    end component;
  255    attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
  256
  257    component INV
  258       port ( I : in    std_logic;
  259              O : out   std_logic);
  260    end component;
  261    attribute BOX_TYPE of INV : component is "BLACK_BOX";
  262
  263 begin
  264    XLXI_1 : OR4
  265       port map (I0=>x3,
  266                 I1=>x2,
  267                 I2=>x1,
  268                 I3=>x0,
  269                 O=>e);
  270
  271    XLXI_2 : OR2
  272       port map (I0=>XLXN_54,
  273                 I1=>x3,
  274                 O=>s1);
  275
  276    XLXI_3 : OR2
  277       port map (I0=>XLXN_62,
  278                 I1=>x3,
  279                 O=>s0);
  280
  281    XLXI_4 : AND3
  282       port map (I0=>x1,
  283                 I1=>XLXN_61,
  284                 I2=>XLXN_60,
  285                 O=>XLXN_62);
  286
  287    XLXI_5 : AND2
  288       port map (I0=>x2,
  289                 I1=>XLXN_60,
  290                 O=>XLXN_54);
  291
  292    XLXI_6 : INV
  293       port map (I=>x2,
  294                 O=>XLXN_61);
  295
  296    XLXI_8 : INV
  297       port map (I=>x3,
  298                 O=>XLXN_60);
  299
  300 end BEHAVIORAL;
  301
  302
  303
  304 library ieee;
  305 use ieee.std_logic_1164.ALL;
  306 use ieee.numeric_std.ALL;
  307 library UNISIM;
  308 use UNISIM.Vcomponents.ALL;
  309
  310 entity lab2_port_switch is
  311    port ( dest0 : in    std_logic_vector (1 downto 0);
  312           dest1 : in    std_logic_vector (1 downto 0);
  313           dest2 : in    std_logic_vector (1 downto 0);
  314           din0  : in    std_logic;
  315           din1  : in    std_logic;
  316           din2  : in    std_logic;
  317           req0  : in    std_logic;
  318           req1  : in    std_logic;
  319           req2  : in    std_logic;
  320           ack0  : out   std_logic;
  321           ack1  : out   std_logic;
  322           ack2  : out   std_logic;
  323           dout0 : out   std_logic;
  324           dout1 : out   std_logic;
  325           dout2 : out   std_logic;
  326           src   : out   std_logic_vector (1 downto 0));
  327 end lab2_port_switch;
  328
  329 architecture BEHAVIORAL of lab2_port_switch is
  330    signal XLXN_14   : std_logic;
  331    signal XLXN_18   : std_logic;
  332    signal XLXN_21   : std_logic;
  333    signal XLXN_72   : std_logic;
  334    signal XLXN_78   : std_logic;
  335    signal XLXN_79   : std_logic;
  336    signal XLXN_80   : std_logic;
  337    signal XLXN_81   : std_logic;
  338    signal XLXN_82   : std_logic;
  339    signal src_DUMMY : std_logic_vector (1 downto 0);
  340    component priority_encoder_MUSER_lab2_port_switch
  341       port ( e  : out   std_logic;
  342              s0 : out   std_logic;
  343              s1 : out   std_logic;
  344              x0 : in    std_logic;
  345              x1 : in    std_logic;
  346              x2 : in    std_logic;
  347              x3 : in    std_logic);
  348    end component;
  349
  350    component de_mux_MUSER_lab2_port_switch
  351       port ( e  : in    std_logic;
  352              s0 : in    std_logic;
  353              s1 : in    std_logic;
  354              x  : in    std_logic;
  355              y0 : out   std_logic;
  356              y1 : out   std_logic;
  357              y2 : out   std_logic;
  358              y3 : out   std_logic);
  359    end component;
  360
  361    component mux_MUSER_lab2_port_switch
  362       port ( x0 : in    std_logic;
  363              s0 : in    std_logic;
  364              x1 : in    std_logic;
  365              e  : in    std_logic;
  366              s1 : in    std_logic;
  367              x2 : in    std_logic;
  368              x3 : in    std_logic;
  369              y  : out   std_logic);
  370    end component;
  371
  372 begin
  373    XLXN_14 <= '0';
  374    XLXN_21 <= '1';
  375    XLXN_72 <= '0';
  376    XLXN_78 <= '0';
  377    XLXN_82 <= '0';
  378    src(1 downto 0) <= src_DUMMY(1 downto 0);
  379    XLXI_2 : priority_encoder_MUSER_lab2_port_switch
  380       port map (x0=>req0,
  381                 x1=>req1,
  382                 x2=>req2,
  383                 x3=>XLXN_14,
  384                 e=>XLXN_18,
  385                 s0=>src_DUMMY(0),
  386                 s1=>src_DUMMY(1));
  387
  388    XLXI_4 : de_mux_MUSER_lab2_port_switch
  389       port map (e=>XLXN_18,
  390                 s0=>src_DUMMY(0),
  391                 s1=>src_DUMMY(1),
  392                 x=>XLXN_21,
  393                 y0=>ack0,
  394                 y1=>ack1,
  395                 y2=>ack2,
  396                 y3=>open);
  397
  398    XLXI_6 : mux_MUSER_lab2_port_switch
  399       port map (e=>XLXN_18,
  400                 s0=>src_DUMMY(0),
  401                 s1=>src_DUMMY(1),
  402                 x0=>din0,
  403                 x1=>din1,
  404                 x2=>din2,
  405                 x3=>XLXN_82,
  406                 y=>XLXN_81);
  407
  408    XLXI_10 : mux_MUSER_lab2_port_switch
  409       port map (e=>XLXN_18,
  410                 s0=>src_DUMMY(0),
  411                 s1=>src_DUMMY(1),
  412                 x0=>dest0(0),
  413                 x1=>dest1(0),
  414                 x2=>dest2(0),
  415                 x3=>XLXN_72,
  416                 y=>XLXN_79);
  417
  418    XLXI_11 : mux_MUSER_lab2_port_switch
  419       port map (e=>XLXN_18,
  420                 s0=>src_DUMMY(0),
  421                 s1=>src_DUMMY(1),
  422                 x0=>dest0(1),
  423                 x1=>dest1(1),
  424                 x2=>dest2(1),
  425                 x3=>XLXN_78,
  426                 y=>XLXN_80);
  427
  428    XLXI_12 : de_mux_MUSER_lab2_port_switch
  429       port map (e=>XLXN_18,
  430                 s0=>XLXN_79,
  431                 s1=>XLXN_80,
  432                 x=>XLXN_81,
  433                 y0=>dout0,
  434                 y1=>dout1,
  435                 y2=>dout2,
  436                 y3=>open);
  437
  438 end BEHAVIORAL;
  439
  440
  441
  442
