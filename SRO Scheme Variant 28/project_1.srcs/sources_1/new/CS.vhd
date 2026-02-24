----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2026 17:41:19
-- Design Name: 
-- Module Name: CS - Behavioral
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

entity CS is
Port (
        x4 : in STD_LOGIC; -- Верхний вход
        x1 : in STD_LOGIC;
        x2 : in STD_LOGIC;
        x3 : in STD_LOGIC; -- Нижний вход
        y1 : out STD_LOGIC;
        y2 : out STD_LOGIC;
        y3 : out STD_LOGIC;
        y4 : out STD_LOGIC
    );
end CS;

architecture Behavioral of CS is
    component N is Port ( A : in STD_LOGIC; Y : out STD_LOGIC ); end component;
    
    component NO2 is Port ( A, B : in STD_LOGIC; Y : out STD_LOGIC ); end component;
    
    component NA2 is Port ( A, B : in STD_LOGIC; Y : out STD_LOGIC ); end component;
    
    component NO3 is Port ( A, B, C : in STD_LOGIC; Y : out STD_LOGIC ); end component;
    
    component NA4 is Port ( A, B, C, D : in STD_LOGIC; Y : out STD_LOGIC ); end component;
    
    component NOA2 is Port ( A, B, C : in STD_LOGIC; Y : out STD_LOGIC ); end component;
   
    component NA3O2 is Port ( A, B, C, D : in STD_LOGIC; Y : out STD_LOGIC ); end component;
    
    component NO3A2 is Port ( A, B, C, D : in STD_LOGIC; Y : out STD_LOGIC ); end component;
    
    component NAO22 is Port ( A, B, C, D : in STD_LOGIC; Y : out STD_LOGIC ); end component;

    signal s_n0, s_n1, s_n2, s_n3, s_n4, s_n5, s_n6, s_n7 : STD_LOGIC;
    
    signal s_no2, s_noa2, s_na4, s_na2, s_na3o2, s_no3a2 : STD_LOGIC;
begin

    N_0_inst: N port map ( A => x1, Y => s_n0 );
    N_1_inst: N port map ( A => s_no2, Y => s_n1 );
    N_2_inst: N port map ( A => x3, Y => s_n2 );
    N_3_inst: N port map ( A => s_n1, Y => s_n3 );
    N_4_inst: N port map ( A => s_n1, Y => s_n4 );
    N_5_inst: N port map ( A => s_no3a2, Y => s_n5 );
    N_6_inst: N port map ( A => s_n3, Y => s_n6 );
    N_7_inst: N port map ( A => s_n4, Y => s_n7 );


    NO2_inst: NO2 port map ( A => s_n0, B => x2, Y => s_no2 );

    NA2_inst: NA2 port map ( A => s_n0, B => x2, Y => s_na2 );

    NA4_inst: NA4 port map ( A => s_n2, B => x4, C => x1, D => x2, Y => s_na4 );

    NA3O2_inst: NA3O2 port map ( A => s_na4, B => s_n5, C => x4, D => x2, Y => s_na3o2 );

    NOA2_inst: NOA2 port map ( A => s_na3o2, B => s_n2, C => x2, Y => s_noa2 );

    NO3_inst: NO3 port map ( A => s_n6, B => s_n2, C => x4, Y => y3 );

    NO3A2_inst: NO3A2 port map ( A => x3, B => x4, C => s_na2, D => s_n7, Y => s_no3a2 );

    NAO22_inst: NAO22 port map ( A => s_n2, B => s_n1, C => x1, D => s_noa2, Y => y4 );


    y1 <= s_na3o2;
    y2 <= s_no3a2;
end Behavioral;