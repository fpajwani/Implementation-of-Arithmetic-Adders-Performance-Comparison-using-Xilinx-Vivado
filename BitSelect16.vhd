----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2020 03:19:45 PM
-- Design Name: 
-- Module Name: NBitAdder - Behavioral
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

entity BitSelect16 is
    Port ( An : in std_logic_vector (15 downto 0);
           Bn : in STD_LOGIC_vector (15 downto 0);
           Sn : out std_logic_vector (15 downto 0);
           Ci : in STD_LOGIC;
           Cn : out STD_LOGIC);
end BitSelect16;



architecture Structural of BitSelect16 is

    component fullAdder
    port ( A0,B0,Cin : in STD_LOGIC;
           SOUT, COUT : out STD_LOGIC);
    end component;
    
    
    component fourBlock is
    Port ( A4 : in std_logic_vector (3 downto 0);
           B4 : in STD_LOGIC_vector (3 downto 0);
           S4 : out std_logic_vector (3 downto 0);
           Ci : in STD_LOGIC;
           Co : out STD_LOGIC);
    end component;
    
    --a block is composed of 4 full adders running in ripple carry fashion
    
    
    signal cSmall : std_logic_vector (4 downto 0);
    signal cBig : std_logic_vector ((((15+1)/4)-1) downto 0);
    --need the intermediary signals between blocks
    --will need 1 between each block along with 1 at beginning and end
    --in the case of 16 bits, itll be 4 for carries
    --and 4 for sums
    --a vecotr of vectors???

    
    begin
        
        cSmall(0) <= Ci;
        
        --creation of og 4 
        GEN_REG1:
        for I in 0 to 3 generate
           F: fullAdder port map(A0 => An(I), B0 => Bn(I), Cin => cSmall(i), SOUT=>Sn(I), COUT => CSmall(I+1));
        end generate GEN_REG1;
       
       CBig(0) <= CSmall(4);
       
        --create the (15/4)-1 blocks of ripple carries
        --gunna be a generate statement
        
        GEN_REG2:
        for I in 1 to (((15+1)/4)-1) generate
            G: fourBlock port map (A4 => An((i*4)+3 downto i*4), B4 => Bn((i*4)+3 downto i*4), S4 => Sn((i*4)+3 downto i*4), Ci => CBig(i-1), Co => CBig(i));
        
        end generate GEN_REG2;
        
        Cn <= CBig((((15+1)/4))-1);
        -- An 
          -- Bn : in STD_LOGIC_vector (3 downto 0);
          -- Sn : out std_logic_vector (3 downto 0);
          -- Ci : in STD_LOGIC;
         --  Cn : out STD_LOGIC);

end Structural;

