library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    Port (
        A, B : in std_logic_vector(3 downto 0);
        C0 : in std_logic;
        C4 : out std_logic;
        S : out std_logic_vector(3 downto 0)
    );
end ripple_adder;

architecture Behavioral of ripple_adder is
    component adder is
        Port (
            A, B, Cin : in std_logic;
            S, Cout : out std_logic
        );
    end component;

    signal C : std_logic_vector(3 downto 0);

begin
    C(0) <= C0;

    stage1: adder port map(
        A => A(0),
        B => B(0),
        Cin => C(0),
        Cout => C(1),
        S => S(0)
    );

    stage2: adder port map(
        A => A(1),
        B => B(1),
        Cin => C(1),
        Cout => C(2),
        S => S(1)
    );

    stage3: adder port map(
        A => A(2),
        B => B(2),
        Cin => C(2),
        Cout => C(3),
        S => S(2)
    );

    stage4: adder port map(
        A => A(3),
        B => B(3),
        Cin => C(3),
        Cout => C4,
        S => S(3)
    );

end Behavioral;
