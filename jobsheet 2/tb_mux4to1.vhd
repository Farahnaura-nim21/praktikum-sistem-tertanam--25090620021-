----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2026 21:43:32
-- Design Name: 
-- Module Name: tb_mux4to1 - Behavioral
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

-- tb_mux4to1.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux4to1 is
end tb_mux4to1;

architecture sim of tb_mux4to1 is
    signal sel_tb : STD_LOGIC_VECTOR(1 downto 0);
    signal in0_tb, in1_tb, in2_tb, in3_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal y_tb   : STD_LOGIC_VECTOR(3 downto 0);
begin
    DUT: entity work.mux4to1
        port map (
            sel => sel_tb, in0 => in0_tb, in1 => in1_tb,
            in2 => in2_tb, in3 => in3_tb, y => y_tb
        );

    stim_proc: process
    begin
        in0_tb <= "0001"; in1_tb <= "0010"; in2_tb <= "0100"; in3_tb <= "1000";

        sel_tb <= "00"; wait for 20 ns;
        assert (y_tb = in0_tb) report "MUX gagal: sel=00" severity error;

        sel_tb <= "01"; wait for 20 ns;
        assert (y_tb = in1_tb) report "MUX gagal: sel=01" severity error;

        sel_tb <= "10"; wait for 20 ns;
        assert (y_tb = in2_tb) report "MUX gagal: sel=10" severity error;

        sel_tb <= "11"; wait for 20 ns;
        assert (y_tb = in3_tb) report "MUX gagal: sel=11" severity error;

        in0_tb <= "1111"; sel_tb <= "00"; wait for 20 ns;
        assert (y_tb = in0_tb) report "MUX gagal: sel=00 setelah in0 berubah" severity error;

        report "Simulasi selesai." severity note;
        wait;
    end process;
end sim;