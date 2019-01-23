library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity tiempo2s is
    PORT (
        clk2,reset    : IN  STD_LOGIC;
        salida: OUT STD_LOGIC
    );
end tiempo2s;
 
architecture sol of tiempo2s is
    signal cnt_tmp: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
begin
   process(clk2,reset)
	begin
		if (reset='0') then salida <= '0';cnt_tmp <= "00";
		elsif(clk2'event and clk2='1') then
            cnt_tmp <= cnt_tmp + 1;
				if(cnt_tmp="10") then
					salida <= '1';
					cnt_tmp <= "00"; end if;
      end if;
    end process;
end sol;