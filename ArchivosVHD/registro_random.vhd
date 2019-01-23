LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY registro_random IS
	PORT(clock,reset,enable, enR: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(3 downto 0);
		 Q : OUT STD_LOGIC_VECTOR (3 downto 0));
END registro_random;

ARCHITECTURE sol OF registro_random IS
SIGNAL temp: STD_LOGIC_VECTOR(3 downto 0):= "0000";
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then temp <= "0000"; --Q <= "0000";
		elsif (clock'event and clock='1') then
			if(enable='1') then 
				temp<=Ent;
			end if;
			if (enR='1') then
				temp<=Ent + "0101";
			end if;
		end if;
	end process;
	Q<=temp;
END sol;
