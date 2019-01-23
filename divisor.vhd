LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;

ENTITY divisor IS
	PORT(clock,reset,enable: IN STD_LOGIC;
		 A,B : IN STD_LOGIC_VECTOR(7 downto 0);
		 I: out STD_LOGIC_VECTOR (7 downto 0));
END divisor;

ARCHITECTURE sol OF divisor IS

SIGNAL temp: STD_LOGIC_VECTOR(7 downto 0):= "00000000";
signal int,int2,div: integer range 0 to 255;

BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then int <= 0; int2 <= 0; div <=0; temp <= "00000000";
		elsif (clock'event and clock='1') then
					int <= to_integer(unsigned(A));
					int2 <= to_integer(unsigned(B));
		end if;
		div <= int / int2;
		I <= std_logic_vector(to_unsigned(div,8));
		
	end process;
	
	
END sol;
