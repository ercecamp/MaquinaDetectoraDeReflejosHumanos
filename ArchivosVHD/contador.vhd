library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity contador is
    PORT (
        clk,enable,reset    : IN  STD_LOGIC;
        salida: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
end contador;
 
architecture sol of contador is
    signal cnt_tmp: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
begin
   process(clk,reset)
	begin
		if reset='0' then salida <= "0000";cnt_tmp <= "0000";
		elsif(clk'event and clk='1' and enable ='1') then
            cnt_tmp <= cnt_tmp + 1;
      end if;
		salida <= cnt_tmp;
    end process;
end sol;