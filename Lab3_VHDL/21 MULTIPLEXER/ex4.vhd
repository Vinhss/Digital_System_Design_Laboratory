library ieee;
use ieee.std_logic_1164.all;

entity my_gates is
    port (
        I0  : in  std_logic;
        I1  : in  std_logic;
        Sel : in  std_logic;
        Y   : out std_logic
    );
end my_gates;

architecture dataflow of my_gates is
begin
    Y <= (((not Sel) and I0) or (I1 and Sel));
end dataflow;

library ieee;
use ieee.std_logic_1164.all;

entity ex4 is
    port (
        SW   : in  std_logic_vector(15 downto 0);
        LEDR : out std_logic_vector(15 downto 0); -- red LEDs
        LEDG : out std_logic_vector(7 downto 0)   -- Green LEDs
    );
end ex4;

architecture Structure of ex4 is
    component my_gates
        port (
            I0  : in  std_logic;
            I1  : in  std_logic;
            Sel : in  std_logic;
            Y   : out std_logic
        );
    end component;

begin
    LEDR <= SW;
    DUT  : my_gates port map (I0 => SW(0), I1 => SW(1), Sel => SW(2), Y => LEDG(1));
end Structure;
