library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ripple_adder_tb is
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is
    signal tb_A, tb_B : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_sum : std_logic_vector(3 downto 0);
    signal tb_carry : std_logic;

begin

    A_gen: process
    begin
        while true loop
            tb_A <= "0001"; wait for 5 ns;
            tb_A <= "0010"; wait for 5 ns;
            tb_A <= "0100"; wait for 5 ns;
            tb_A <= "1000"; wait for 5 ns;
            tb_A <= "1111"; wait for 5 ns;
            tb_A <= "0000"; wait for 5 ns;
        end loop;
    end process A_gen;

    B_gen: process
    begin
        while true loop
            tb_B <= "0001"; wait for 10 ns;
            tb_B <= "0011"; wait for 10 ns;
            tb_B <= "0111"; wait for 10 ns;
            tb_B <= "1111"; wait for 10 ns;
            tb_B <= "0000"; wait for 10 ns;
        end loop;
    end process B_gen;
    
    adder: entity work.ripple_adder
        port map(
            A => tb_A,
            B => tb_B,
            C0 => '0',
            C4 => tb_carry,
            S => tb_sum
        );

end Behavioral;
