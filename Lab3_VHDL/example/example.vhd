LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Simple module that connects the SW switches to the LEDR lights
ENTITY example IS
	PORT (SW 	: IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		  LEDR	: OUT STD_LOGIC_VECTOR(17 DOWNTO 0));  -- red LEDs
END example;

ARCHITECTURE Structure OF example IS
	BEGIN
		LEDR <= SW;
	END Structure;