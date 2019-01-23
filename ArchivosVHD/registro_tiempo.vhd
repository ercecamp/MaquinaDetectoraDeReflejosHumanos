LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;

ENTITY registro_tiempo IS
	PORT(clock,reset,enable: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(7 downto 0);
		 Q : OUT STD_LOGIC_VECTOR (7 downto 0));
END registro_tiempo;

ARCHITECTURE sol OF registro_tiempo IS

SIGNAL temp: STD_LOGIC_VECTOR(7 downto 0):= "00000000";

BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then
		elsif (clock'event and clock='1') then
			if(enable='1') then 
				temp<=Ent;
			end if;
		end if;
	end process;
	Q<=temp;
END sol;
