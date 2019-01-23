library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comparador is
	Port ( A,B: in STD_LOGIC_VECTOR(3 downto 0);
			enable1: in STD_LOGIC;
		salida : OUT STD_LOGIC);
end comparador;

Architecture sol of comparador is
Begin
		salida <='1' when (A=B)and(enable1='1') else '0';
		
end sol;