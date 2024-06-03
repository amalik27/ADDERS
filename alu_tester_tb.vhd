library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity alu_tester_tb is
end alu_tester_tb;

architecture Behavioral of alu_tester_tb is
    signal tb_clk : std_logic := '0';
    signal tb_btn : std_logic_vector(3 downto 0):= (others=>'0');
    signal tb_sw  : std_logic_vector(3 downto 0) := (others=>'0');
    signal tb_led : std_logic_vector(3 downto 0):= (others=>'0'); 
    component alu_tester is
      Port (clk : in std_logic;
            sw : in std_logic_vector(3 downto 0);
            btn : in std_logic_vector(2 downto 0);
            led: out std_logic_vector(3 downto 0));
    end component alu_tester;


begin

    clk_gen_proc: process
    begin

        wait for 4 ns;
        tb_clk <= '1';

        wait for 4 ns;
        tb_clk <= '0';

    end process clk_gen_proc;

    
    sw_gen: process
    begin

        wait for 8 ns;
        tb_sw <= std_logic_vector (unsigned(tb_sw)+1);

    end process sw_gen;

    btn_gen: process
    begin

        wait for 4 ns;
        tb_btn <= "0001";
        wait for 4 ns;
        tb_btn <= "0010";
        wait for 4 ns;
        tb_btn <= "0100";
        wait for 4 ns;
        tb_btn <= "1000";
    end process btn_gen;
    
    alu: alu_tester
        port map(
            clk=>tb_clk,
            btn=>tb_btn,
            sw=>tb_sw,
            led=>tb_led);

end Behavioral;
