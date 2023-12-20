library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rec is
    Port (
        input_1 : in std_logic_vector(7 downto 0);
		  input_2 : in std_logic_vector(7 downto 0);
		  input_3 : in std_logic_vector(7 downto 0);
        reset : in std_logic;
        clock : in std_logic;
        result : out std_logic_vector(7 downto 0)
    );
end rec;

architecture Behavioral of rec is
    signal reg_A: std_logic_vector(7 downto 0);
	 signal reg_B : std_logic_vector(7 downto 0);
	 signal reg_C : std_logic_vector(7 downto 0);
	 signal result_reg : std_logic_vector(7 downto 0);
    signal mul : std_logic_vector(7 downto 0); 
	 signal sub : std_logic_vector(7 downto 0);
	 signal som : std_logic_vector(7 downto 0);
begin
    process(clock, reset)
    begin
        if reset = '1' then
            reg_A <= (others => '0');
            reg_B <= (others => '0');
            reg_C <= (others => '0');
            result_reg <= (others => '0');
        elsif rising_edge(clock) then
            reg_A <= input_1;
            reg_B <= input_2;
            reg_C <= input_3;
            
            --Multiplicador
            mul <= std_logic_vector(unsigned(reg_A)*unsigned(reg_A));
            
            -- Subtrator
            sub <= std_logic_vector(unsigned(mul) - unsigned(reg_B));
            
            -- Somador
            som <= std_logic_vector(unsigned(sub) + unsigned(reg_C));
            
            -- Registrador de resultado
            result_reg <= som;
        end if;
    end process;

    result <= result_reg;
end Behavioral;
