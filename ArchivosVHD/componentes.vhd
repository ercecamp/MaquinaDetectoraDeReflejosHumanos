library ieee;
use ieee.std_logic_1164.all;


package componentes is
	
	component divisor is
		port (clock,reset,enable: IN STD_LOGIC;
		 A,B : IN STD_LOGIC_VECTOR(7 downto 0);
		 I: out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component dectobin is
		port(Ent: in std_logic_vector(15 downto 0);
		Salida: out std_logic_vector(3 downto 0));
	end component;
	
	component bintodec is
		port(Ent: in std_logic_vector(3 downto 0);
		Salida: out std_logic_vector(15 downto 0));
	end component;
	
	component comparador is
	Port ( A,B: in STD_LOGIC_VECTOR(3 downto 0);
		enable1: in STD_LOGIC;
		salida : OUT STD_LOGIC);
	end component;
		
	component contador is
	Port ( clk,enable,reset    : IN  STD_LOGIC;
        salida: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;
	
	component contador_tiempo is
	Port ( clk,enable1,enable2,AigualB,reset    : IN  STD_LOGIC;
        salida: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	end component;
	
	component contador_rand is
	Port ( clk,enable,reset    : IN  STD_LOGIC;
        salida: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;	
	component registro_random is
	PORT(clock,reset,enable, enR: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(3 downto 0);
		 Q : OUT STD_LOGIC_VECTOR (3 downto 0));
	end component;	
	
	component registro_random1 is
	PORT(clock,reset,enable, enR: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(3 downto 0);
		 Q : OUT STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component registro_8bits is
	PORT(clock,reset,enable: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(7 downto 0);
		 Q : OUT STD_LOGIC_VECTOR (7 downto 0));
	end component;	
	
	component registro_tiempo is
	PORT(clock,reset,enable: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(7 downto 0);
		 Q : OUT STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component decoder_a_7segmentos is
	Port(	w: in std_logic_vector(3 downto 0);
			en: in std_logic;
			Q1: out std_logic_vector(6 downto 0));
	end component;
	
	component Conv_Bin_BCD is
    Port ( Bin : in   STD_LOGIC_VECTOR (7 downto 0);
           Cen : out  STD_LOGIC_VECTOR (3 downto 0);
           Dec : out  STD_LOGIC_VECTOR (3 downto 0);
           Uni : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
component ANTIREBOTE IS
	PORT(PB_N, CLOCK_100Hz 	: IN	STD_LOGIC;
		 PB_SIN_REBOTE		: OUT	STD_LOGIC);
	end component;
	
	component CLOCK_DIV_50 IS
    PORT
    (  CLOCK_50MHz    :IN   STD_LOGIC;
       CLOCK_1MHz     :OUT  STD_LOGIC;
       CLOCK_100KHz   :OUT  STD_LOGIC;
       CLOCK_10KHz    :OUT  STD_LOGIC;
       CLOCK_1KHz     :OUT  STD_LOGIC;
       CLOCK_100Hz    :OUT  STD_LOGIC;
       CLOCK_10Hz     :OUT  STD_LOGIC;
       CLOCK_1Hz      :OUT  STD_LOGIC);
	end component;
	
	component tiempo2s is 
	PORT (
        clk2,reset    : IN  STD_LOGIC;
        salida: OUT STD_LOGIC);
	 end component;
	
	component controlador is
	port(clock,reset,start,AigualB,tiempo,igual15: IN STD_LOGIC;
			state: out std_logic_vector(3 downto 0);
		 enableR,enReg1,enAigualB,eni,enrand,fin,reset_delay,reset_reg : OUT STD_LOGIC);
	end component;
end componentes;