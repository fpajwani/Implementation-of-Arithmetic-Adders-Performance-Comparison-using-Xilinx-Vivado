library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cla_adder is
generic (N : integer);
port( A,B : in std_logic_vector(N-1 downto 0);
      cin : in std_logic;
      S : out std_logic_vector(N-1 downto 0);
      cout : out std_logic );
end cla_adder;

architecture Behavioral of cla_adder is

signal P,G : STD_LOGIC_VECTOR(N-1 DOWNTO 0) := (others => '0');
signal C : STD_LOGIC_VECTOR(N DOWNTO 0) := (others => '0');

component cla_block is
port ( P : in std_logic_vector(N-1 downto 0);
       G : in std_logic_vector(N-1 downto 0);
       C : out std_logic_vector(N downto 0);
       cin : in std_logic );
end component;

begin

--first level
P <= A xor B;
G <= A and B;

--second level
gen_c : cla_block port map(P,G,C,cin);

--third level
S <= P xor C(N-1 downto 0);
cout <= C(N);

end Behavioral;