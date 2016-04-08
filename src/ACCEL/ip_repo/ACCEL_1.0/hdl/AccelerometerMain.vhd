library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity AccelerometerMain is
   port(
      clk_i          : in  std_logic;
      rstn_i         : in  std_logic;

      led_o          : out std_logic_vector(15 downto 0);

      -- SPI Interface signals for the ADXL362 accelerometer
      sclk           : out STD_LOGIC;
      mosi           : out STD_LOGIC;
      miso           : in STD_LOGIC;
      ss             : out STD_LOGIC;

      SCLK_DBG       : out STD_LOGIC;
      MOSI_DBG       : out STD_LOGIC;
      MISO_DBG       : out STD_LOGIC;
      SS_DBG         : out STD_LOGIC
   );
end AccelerometerMain;

architecture Behavioral of AccelerometerMain is

----------------------------------------------------------------------------------
-- Component Declarations
----------------------------------------------------------------------------------  

-- 200 MHz Clock Generator
component ClkGen
port
 (-- Clock in ports
  clk_100MHz_i           : in     std_logic;            
  -- Clock out ports
  clk_100MHz_o          : out    std_logic;
  clk_200MHz_o          : out    std_logic;
  -- Status and control signals
  reset_i             : in     std_logic;
  locked_o            : out    std_logic
 );
end component;

component AccelerometerCtl is
generic 
(
   SYSCLK_FREQUENCY_HZ : integer := 100000000;
   SCLK_FREQUENCY_HZ   : integer := 1000000;
   NUM_READS_AVG       : integer := 16;
   UPDATE_FREQUENCY_HZ : integer := 1000
);
port
(
 SYSCLK     : in STD_LOGIC; -- System Clock
 RESET      : in STD_LOGIC; -- Reset button on the Nexys4 board is active low

 -- SPI interface Signals
 SCLK       : out STD_LOGIC;
 MOSI       : out STD_LOGIC;
 MISO       : in STD_LOGIC;
 SS         : out STD_LOGIC;
 
-- Accelerometer data signals
 ACCEL_X_OUT    : out STD_LOGIC_VECTOR (8 downto 0);
 ACCEL_Y_OUT    : out STD_LOGIC_VECTOR (8 downto 0);
 ACCEL_MAG_OUT  : out STD_LOGIC_VECTOR (11 downto 0);
 ACCEL_TMP_OUT  : out STD_LOGIC_VECTOR (11 downto 0)
);
end component;

----------------------------------------------------------------------------------
-- Signal Declarations
----------------------------------------------------------------------------------  
-- Inverted input reset signal
signal rst        : std_logic;
-- Reset signal conditioned by the PLL lock
signal reset      : std_logic;
signal resetn     : std_logic;
signal locked     : std_logic;

-- 100 MHz buffered clock signal
signal clk_100MHz_buf : std_logic;
-- 200 MHz buffered clock signal
signal clk_200MHz_buf : std_logic;


-- ADXL362 Accelerometer data signals
signal ACCEL_X    : STD_LOGIC_VECTOR (8 downto 0);
signal ACCEL_Y    : STD_LOGIC_VECTOR (8 downto 0);
signal ACCEL_MAG  : STD_LOGIC_VECTOR (11 downto 0);
signal ACCEL_TMP  : STD_LOGIC_VECTOR (11 downto 0);

begin
   
   -- Assign LEDs
   led_o (8 downto 0) <= ACCEL_X;
   -- The Reset Button on the Nexys4 board is active-low,
   -- however many components need an active-high reset
   rst <= not rstn_i;

   -- Assign reset signals conditioned by the PLL lock
   reset <= rst or (not locked);
   -- active-low version of the reset signal
   resetn <= not reset;



----------------------------------------------------------------------------------
-- 200MHz Clock Generator
----------------------------------------------------------------------------------
   Inst_ClkGen: ClkGen
   port map (
      clk_100MHz_i   => clk_i,
      clk_100MHz_o   => clk_100MHz_buf,
      clk_200MHz_o   => clk_200MHz_buf,
      reset_i        => rst,
      locked_o       => locked
      );


----------------------------------------------------------------------------------
-- Accelerometer Controller
----------------------------------------------------------------------------------
   Inst_AccelerometerCtl: AccelerometerCtl
   generic map
   (
        SYSCLK_FREQUENCY_HZ   => 100000000,
        SCLK_FREQUENCY_HZ     => 100000,
        NUM_READS_AVG         => 16,
        UPDATE_FREQUENCY_HZ   => 1000
   )
   port map
   (
       SYSCLK     => clk_100MHz_buf,
       RESET      => reset, 
       -- Spi interface Signals
       SCLK       => sclk,
       MOSI       => mosi,
       MISO       => miso,
       SS         => ss,
     
      -- Accelerometer data signals
       ACCEL_X_OUT   => ACCEL_X,
       ACCEL_Y_OUT   => ACCEL_Y,
       ACCEL_MAG_OUT => ACCEL_MAG,
       ACCEL_TMP_OUT => ACCEL_TMP
   );

end Behavioral;

