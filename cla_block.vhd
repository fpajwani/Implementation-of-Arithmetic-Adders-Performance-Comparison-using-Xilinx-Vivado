library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cla_block is
generic (N : integer);
port ( P : in std_logic_vector(N-1 downto 0);
       G : in std_logic_vector(N-1 downto 0);
       C : out std_logic_vector(N downto 0);
       cin : in std_logic );
end cla_block;

architecture Behavioral of cla_block is
begin

    C(0) <= cin;
    CARRY: for i in 0 to N-1 generate
        C(i+1) <= G(i) or (P(i) and cin);
    end generate CARRY;
    
--C(0) <= cin;
--C(1) <= G(0) or (P(0) and cin);
--C(2) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and cin);
--C(3) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and cin);
--C(4) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and cin);
 
end Behavioral;