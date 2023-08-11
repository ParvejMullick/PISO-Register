----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:33:35 08/11/2023 
-- Design Name: 
-- Module Name:    fourBit_PISO_register - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fourBit_PISO_register is
    Port ( D_in : in  STD_LOGIC_VECTOR (3 downto 0);
           L_Sbar : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           qout : out  STD_LOGIC);
end fourBit_PISO_register;

architecture Behavioral of fourBit_PISO_register is
component Multiplexer is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           c : in  STD_LOGIC;
           f : out  STD_LOGIC);
end component;

component D_flipFlop is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

signal a1:std_logic_vector(3 downto 0);
signal a2:std_logic_vector(3 downto 0);

begin

mux3 : Multiplexer port map ('0', D_in(3), L_Sbar, a2(3));
Dff3 : D_flipFlop port map (a2(3), clk, a1(3));

mux2 : Multiplexer port map (a1(3), D_in(2), L_Sbar, a2(2));
Dff2 : D_flipFlop port map (a2(2), clk, a1(2));

mux1 : Multiplexer port map (a1(2), D_in(1), L_Sbar, a2(1));
Dff1 : D_flipFlop port map (a2(1), clk, a1(1));

mux0 : Multiplexer port map (a1(1), D_in(0), L_Sbar, a2(0));
Dff0 : D_flipFlop port map (a2(0), clk, a1(0));


qout <= a1(0);
end Behavioral;

