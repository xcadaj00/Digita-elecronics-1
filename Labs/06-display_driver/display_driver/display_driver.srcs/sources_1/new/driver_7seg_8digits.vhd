----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2021 23:35:02
-- Design Name: 
-- Module Name: driver_7seg_8digits - Behavioral
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

------------------------------------------------------------------------
-- Entity declaration for display driver
------------------------------------------------------------------------
entity driver_7seg_8digits is
    port(
        clk     : in  std_logic;        -- Main clock
        reset   : in  std_logic;        -- Synchronous reset
        -- 4-bit input values for individual digits
        data0_i : in  std_logic_vector(4 - 1 downto 0);
        data1_i : in  std_logic_vector(4 - 1 downto 0);
        data2_i : in  std_logic_vector(4 - 1 downto 0);
        data3_i : in  std_logic_vector(4 - 1 downto 0);
        data4_i : in  std_logic_vector(4 - 1 downto 0);
        data5_i : in  std_logic_vector(4 - 1 downto 0);
        data6_i : in  std_logic_vector(4 - 1 downto 0);
        data7_i : in  std_logic_vector(4 - 1 downto 0);
        -- 4-bit input value for decimal points
        dp_i    : in  std_logic_vector(8 - 1 downto 0);
        -- Decimal point for specific digit
        dp_o    : out std_logic;
        -- Cathode values for individual segments
        seg_o   : out std_logic_vector(7 - 1 downto 0);
        -- Common anode signals to individual displays
        dig_o   : out std_logic_vector(8 - 1 downto 0)
    );
end entity driver_7seg_8digits;

------------------------------------------------------------------------
-- Architecture declaration for display driver
------------------------------------------------------------------------
architecture Behavioral of driver_7seg_8digits is

    -- Internal clock enable
    signal s_en  : std_logic;
    -- Internal 2-bit counter for multiplexing 4 digits
    signal s_cnt : std_logic_vector(3 - 1 downto 0);
    -- Internal 4-bit value for 7-segment decoder
    signal s_hex : std_logic_vector(4 - 1 downto 0);

begin
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates an enable pulse
    -- every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 200000        -- Number of clk pulses to generate
                                    -- one enable signal period
        )  -- Note that there IS a semicolon between generic and port
        -- sections
        port map(
            clk   => clk,      -- Main clock
            reset => reset,      -- Synchronous reset
            ce_o  => s_en       -- Clock enable pulse signal
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity performs a 2-bit down
    -- counter
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 3      -- Number of bits for counter
        )
        port map(
            clk      => clk,       -- Main clock
            reset    => reset,      -- Synchronous reset
            en_i     => s_en,      -- Enable input
            cnt_up_i => '0',      -- Direction of the counter
            cnt_o    => s_cnt
        );

    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity performs a 7-segment display
    -- decoder
    hex2seg : entity work.hex_7seg
        port map(
            hex_i => s_hex,
            seg_o => seg_o
        );

    --------------------------------------------------------------------
    -- p_mux:
    -- A combinational process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point signal, and 
    -- switches the common anodes of each display.
    --------------------------------------------------------------------
    p_mux : process(s_cnt, data0_i, data1_i, data2_i, data3_i, dp_i) -- all variables in () runs this process when changed
    begin
        case s_cnt is
            when "111" =>
                s_hex <= data7_i;
                dp_o  <= dp_i(7);
                dig_o <= "01111111";

            when "110" =>
                s_hex <= data6_i;
                dp_o  <= dp_i(6);
                dig_o <= "10111111";

            when "101" =>
                s_hex <= data5_i;
                dp_o  <= dp_i(5);
                dig_o <= "11011111";

            when "100" =>
                s_hex <= data4_i;
                dp_o  <= dp_i(4);
                dig_o <= "11101111";
                
            when "011" =>
                s_hex <= data3_i;
                dp_o  <= dp_i(3);
                dig_o <= "11110111";
                
            when "010" =>
                s_hex <= data2_i;
                dp_o  <= dp_i(2);
                dig_o <= "11111011";
                
            when "001" =>
                s_hex <= data1_i;
                dp_o  <= dp_i(1);
                dig_o <= "11111101";

            when others =>
                s_hex <= data0_i;
                dp_o  <= dp_i(0);
                dig_o <= "11111110";
        end case;
    end process p_mux;

end architecture Behavioral;