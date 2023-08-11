--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:42:31 08/11/2023
-- Design Name:   
-- Module Name:   D:/Mini Project/FourBitPISORegister/testBench_pisoRegister.vhd
-- Project Name:  FourBitPISORegister
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fourBit_PISO_register
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testBench_pisoRegister IS
END testBench_pisoRegister;
 
ARCHITECTURE behavior OF testBench_pisoRegister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fourBit_PISO_register
    PORT(
         D_in : IN  std_logic_vector(3 downto 0);
         L_Sbar : IN  std_logic;
         clk : IN  std_logic;
         qout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D_in : std_logic_vector(3 downto 0) := (others => '0');
   signal L_Sbar : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal qout : std_logic;

   -- Clock period definitions
   constant clk_period : time := 60 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fourBit_PISO_register PORT MAP (
          D_in => D_in,
          L_Sbar => L_Sbar,
          clk => clk,
          qout => qout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	 
      
      D_in <= "1010";
		L_Sbar <= '1';	
		wait for 100 ns;
		L_Sbar <= '0';	
		wait for 1230 ns;
		
      D_in <= "1001";
      L_Sbar <= '1';		
		wait for 50 ns;
		L_Sbar <= '0';	
		wait for 1230 ns;
		
		D_in <= "1101";
      L_Sbar <= '1';		
		wait for 100 ns;
		L_Sbar <= '0';	
		wait for 230 ns;
		
		D_in <= "1001";
      L_Sbar <= '1';		
		wait for 100 ns;
		L_Sbar <= '0';	
		wait for 230 ns;
      wait;
   end process;

END;
