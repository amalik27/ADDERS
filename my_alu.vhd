library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_alu is
    Port (
        A, B, OPCODE : in std_logic_vector(3 downto 0);
        RES : out std_logic_vector(3 downto 0);
        clk : in std_logic
    );
end my_alu;

architecture Behavioral of my_alu is
    signal comp_out : std_logic_vector(3 downto 0) := (others => '0');
    signal comp : std_logic;
    signal shift_right_arithmetic_A : std_logic_vector(3 downto 0);

begin
    comp <= '1' when A > B else '0';
    shift_right_arithmetic_A <= std_logic_vector(shift_right(unsigned(A), 1));

    process(clk)
    begin
        if rising_edge(clk) then
            case comp is
                when '1' => comp_out <= "0001";
                when '0' => comp_out <= "0000";
                when others => comp_out <= (others => '0');
            end case;

            case OPCODE is
                when "0000" => RES <= std_logic_vector(unsigned(A) + unsigned(B));
                when "0001" => RES <= std_logic_vector(unsigned(A) - unsigned(B));
                when "0010" => RES <= std_logic_vector(unsigned(A) + 1);
                when "0011" => RES <= std_logic_vector(unsigned(A) - 1);
                when "0100" => RES <= std_logic_vector(0 - unsigned(A));
                when "0101" => RES <= comp_out;
                when "0110" => RES <= A(2 downto 0) & '0'; -- Shift left
                when "0111" => RES <= '0' & A(3 downto 1); -- Shift right
                when "1000" => RES <= A(3) & shift_right_arithmetic_A(2 downto 0); -- Shift right with MSB
                when "1001" => RES <= not A;
                when "1010" => RES <= A and B;
                when "1011" => RES <= A or B;
                when "1100" => RES <= A xor B;
                when "1101" => RES <= A xnor B;
                when "1110" => RES <= A nand B;
                when "1111" => RES <= A nor B;
                when others => RES <= (others => '0');
            end case;
        end if;
    end process;
end Behavioral;
