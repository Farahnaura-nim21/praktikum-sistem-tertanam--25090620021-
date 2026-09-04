----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.09.2026 19:52:49
-- Design Name: 
-- Module Name: led_switch_top - Behavioral
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

entity led_switch_top is
    Port ( sw  : in  STD_LOGIC_VECTOR (15 downto 0); 
        led : out STD_LOGIC_VECTOR (15 downto 0) ); 
end led_switch_top;

architecture Behavioral of led_switch_top is
begin
    led(7 downto 0)  <= not sw(7 downto 0);
    led(15 downto 8) <= (others => '0'); 
end Behavioral;
