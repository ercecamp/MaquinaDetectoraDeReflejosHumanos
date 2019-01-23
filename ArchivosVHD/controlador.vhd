LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY controlador IS
	PORT(clock,reset,start,AigualB,tiempo,igual15: IN STD_LOGIC;
			state: out std_logic_vector(3 downto 0);
		 enableR,enReg1,enAigualB,eni,enrand,fin,reset_delay,reset_reg: OUT STD_LOGIC);
END controlador;

ARCHITECTURE sol OF controlador IS
Type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Tx);
SIGNAL y:estado;
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then y<=Ta;
  		elsif (clock'event and clock='1') then
			case y is
				when Ta=> 	if start='1' then y<=Tb;
								else y<=Ta;
								end if;
				when Tb=>	if start='1' then y<=Tb;
								else y<=Tc;
								end if;
				when Tc=>	if igual15='1' then y<=Th;
								else y<=Td;
								end if;
				when Td=>	y<=Tx;
				when Tx=>	if tiempo='1' then y<=Te;
								else y<=Tc; end if;
				when Te=>	if AigualB='1'  then y<=Tf;
								else y<=Tg; end if;
				when Tf=>	y<=Tg;
				when Tg=>	y<=Tc;
				when Th=>	y<=Ta;
			end case;
		end if;
	END PROCESS;
	
PROCESS(y)
	BEGIN
		enableR<='0';enReg1<='0';enAigualB<='0';eni<='0';fin<='0';reset_delay<='1';enrand<='0';reset_reg<='0';
			case y is
				when Ta=>	state<="0001";
				when Tb=>	state<="0010"; reset_delay<='0';
				when Tc=>	state<="0011"; 
				when Td=>	state<="0100"; 
				when Tx=>	state<="0101";  
				when Te=>	state<="0110";  reset_delay<='0';  
				when Tf=>	enAigualB<='1'; state<="0000"; 
				when Tg=>	state<="1000"; eni<='1';enrand<='1';enableR<='1';
				when Th=>	fin<='1'; state<="1001";
			end case;
	END PROCESS;
END sol;

