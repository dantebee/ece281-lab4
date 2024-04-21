----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 12:08:23 PM
-- Design Name: 
-- Module Name: binCodedDec - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binCodedDec is
    Port ( i_bin : in STD_LOGIC_VECTOR (3 downto 0);
           o_tens : out STD_LOGIC_VECTOR (3 downto 0);
           o_ones : out STD_LOGIC_VECTOR (3 downto 0));
end binCodedDec;

architecture Behavioral of binCodedDec is

signal w_tens, w_ones, w_floor : std_logic_vector (3 downto 0);


begin

o_tens <= w_tens;
o_ones <= w_ones;
w_floor <= i_bin;


  w_tens <=  "0001" when unsigned(w_floor) > "1001" else
             "0001" when w_floor = "0000" else
             "0000";       
               
 w_ones <=  "0001" when (w_floor = "0001" or w_floor = "1011") else
            "0010" when (w_floor = "0010" or w_floor = "1100") else
            "0011" when (w_floor = "0011" or w_floor = "1101") else
            "0100" when (w_floor = "0100" or w_floor = "1110") else
            "0101" when (w_floor = "0101" or w_floor = "1111") else
            "0110" when (w_floor = "0110" or w_floor = "0000") else
            "0111" when (w_floor = "0111") else
            "1000" when (w_floor = "1000") else
            "1001" when (w_floor = "1001") else
            "0000" when (w_floor = "1010") else
            "0000";
                  


end Behavioral;
