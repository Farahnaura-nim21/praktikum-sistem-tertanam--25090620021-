library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity checkerboard_pattern is
    Port ( h_count : in  integer range 0 to 799;
           v_count : in  integer range 0 to 524;
           rgb     : out STD_LOGIC_VECTOR(11 downto 0) );
end checkerboard_pattern;

architecture Behavioral of checkerboard_pattern is
    signal h_u : unsigned(9 downto 0);
    signal v_u : unsigned(9 downto 0);
    signal chk : STD_LOGIC;
begin

    h_u <= to_unsigned(h_count, 10);
    v_u <= to_unsigned(v_count, 10);

    -- Bit ke-5 = 32 piksel per kotak. Warna berganti bila bit h dan v berbeda.
    chk <= h_u(5) xor v_u(5);

    rgb <= x"FFF" when chk = '1' else x"000";

end Behavioral;
