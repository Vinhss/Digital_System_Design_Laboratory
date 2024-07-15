LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ex2 IS
	
	PORT (SW: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		  LEDR: OUT STD_LOGIC_VECTOR(15 DOWNTO 0); -- red LEDs
		  LEDG: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- Green LEDs
END ex2;

ARCHITECTURE Structure OF ex2 IS
	COMPONENT test
		PORT (	A: in std_logic;
					B: in std_logic;
					SUM: out std_logic;
					Carry: out std_logic
				 );
	END COMPONENT;

	BEGIN
		LEDR <= SW;
		DUT: test PORT MAP (SW(1),SW(0),LEDG(1),LEDG(0));
		
END Structure;

library ieee;
use ieee.std_logic_1164.all;

entity test is
port(	A: in std_logic;
	    B: in std_logic;
	    SUM: out std_logic;
		Carry: out std_logic
);
end test;
  
architecture dataflow of test is
begin
   SUM <= A xor B;
	Carry  <= A and B;
end dataflow;
