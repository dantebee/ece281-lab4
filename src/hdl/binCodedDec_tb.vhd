library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binCodedDec_tb is
end binCodedDec_tb;

architecture Behavioral of binCodedDec_tb is

    -- Component declaration for the unit under test (UUT)
    component binCodedDec
        Port ( i_bin : in STD_LOGIC_VECTOR (3 downto 0);
               o_tens : out STD_LOGIC_VECTOR (3 downto 0);
               o_ones : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- Inputs
    signal w_bin : STD_LOGIC_VECTOR (3 downto 0) := "0000";  -- Input value of 1

    -- Outputs
    signal w_tens : STD_LOGIC_VECTOR (3 downto 0);
    signal w_ones : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: binCodedDec port map (i_bin => w_bin, o_tens => w_tens, o_ones => w_ones);

    -- Stimulus process
    stimulus: process
    begin
        for i in 0 to 20 loop
            -- Increment input value
            w_bin <= std_logic_vector(unsigned(w_bin) + 1);
            wait for 10 ns;
            
            -- Convert BCD outputs to integer using Numeric library
            --assert to_integer(unsigned(w_tens)) = (to_integer(unsigned(w_bin)) / 10) report "Tens digit assertion failed" severity error;
            --assert to_integer(unsigned(w_ones)) = (to_integer(unsigned(w_bin)) mod 10) report "Ones digit assertion failed" severity error;
        end loop;
        
        -- End simulation
        wait;
    end process;

end Behavioral;
