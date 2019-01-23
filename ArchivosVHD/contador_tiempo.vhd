library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity contador_tiempo is
    PORT (
        clk,enable1,enable2,AigualB,reset    : IN  STD_LOGIC;
        salida: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
end contador_tiempo;
 
architecture sol of contador_tiempo is
    signal cnt_tmp: STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
begin
   process(clk,reset)
	begin
		if (reset='0') then salida <= "00000000";cnt_tmp <= "00000000";
		elsif(clk'event and clk='1' and enable1 ='1' and enable2 ='1' and AigualB='1') then
            cnt_tmp <= cnt_tmp + 1;
      end if;
		salida <= cnt_tmp;
    end process;
end sol;