-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity apint_arith_tb is
end;

architecture bench of apint_arith_tb is

  component apint_arith
  port (
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      inA : IN STD_LOGIC_VECTOR (7 downto 0);
      inB : IN STD_LOGIC_VECTOR (7 downto 0);
      Sel : IN STD_LOGIC_VECTOR (7 downto 0);
      output_r : OUT STD_LOGIC_VECTOR (7 downto 0);
      output_r_ap_vld : OUT STD_LOGIC;
      rem_r : OUT STD_LOGIC_VECTOR (7 downto 0);
      rem_r_ap_vld : OUT STD_LOGIC );
  end component;

  signal ap_clk: STD_LOGIC;
  signal ap_rst: STD_LOGIC;
  signal ap_start: STD_LOGIC;
  signal ap_done: STD_LOGIC;
  signal ap_idle: STD_LOGIC;
  signal ap_ready: STD_LOGIC;
  signal inA: STD_LOGIC_VECTOR (7 downto 0);
  signal inB: STD_LOGIC_VECTOR (7 downto 0);
  signal Sel: STD_LOGIC_VECTOR (7 downto 0);
  signal output_r: STD_LOGIC_VECTOR (7 downto 0);
  signal output_r_ap_vld: STD_LOGIC;
  signal rem_r: STD_LOGIC_VECTOR (7 downto 0);
  signal rem_r_ap_vld: STD_LOGIC ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: apint_arith port map ( ap_clk          => ap_clk,
                              ap_rst          => ap_rst,
                              ap_start        => ap_start,
                              ap_done         => ap_done,
                              ap_idle         => ap_idle,
                              ap_ready        => ap_ready,
                              inA             => inA,
                              inB             => inB,
                              Sel             => Sel,
                              output_r        => output_r,
                              output_r_ap_vld => output_r_ap_vld,
                              rem_r           => rem_r,
                              rem_r_ap_vld    => rem_r_ap_vld );

  stimulus: process
  begin
  
    -- Put initialisation code here
    ap_rst <= '0';
    ap_start <= '1';
    ap_clk <= '1';

    inA <= "00001000";
    inB <= "00000100";
    Sel <= "00000001";          --Add
    wait for 50ns;
    
    inA <= "00001001";
    inB <= "00000101";
    Sel <= "00000010";          --Subtract
    wait for 50ns;
    
    inA <= "00001010";
    inB <= "00000110";
    Sel <= "00000011";          --Multiply
    wait for 50ns;
    
    inA <= "00001011";
    inB <= "00000111";
    Sel <= "00000100";          --Divide
    wait for 50ns;
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;
end;