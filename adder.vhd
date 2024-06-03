library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
  Port ( A, B, Cin : in std_logic;
         S, Cout : out std_logic);
end adder;

architecture Behavioral of adder is
    signal A_xor_B : std_logic;
begin
    A_xor_B <= A xor B;
    S <= Cin xor A_xor_B;
    Cout <= (A and B) or (Cin and A_xor_B);

end Behavioral;
