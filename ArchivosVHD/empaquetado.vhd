library ieee;
use ieee.std_logic_1164.all;
use work.componentes.all;


entity empaquetado is
	port(boton: in std_logic_vector(15 downto 0);
			clock,breset,bstart: in std_logic;
			num_aciertos: buffer std_logic_vector(3 downto 0);
			num_led: out std_logic_vector(15 downto 0);
			state: out std_logic_vector(3 downto 0);
			tiempo_medio: buffer std_logic_vector(7 downto 0);
			t_prom: buffer STD_LOGIC_VECTOR (7 downto 0);
			num_boton,tuni,tdec,tcet,auni,adec,acet: buffer std_logic_vector(3 downto 0));
end empaquetado;

architecture solucion of empaquetado is
signal aciertos,num_random,num_reg1,Qi: std_logic_vector(3 downto 0);
signal reset,start,clkRand,clk,tiempo,menor9,mayor9,OR_16,AigualB,enAigualB,enReg1,eni,igual15,enableR,fin: std_logic;
signal tiempo_reaccion,cnt_tiempo,A,B: std_logic_vector(7 downto 0);

signal clk100,clk10k,clk100k,clk10,dosseg,reset_delay,enrand,reset_reg: std_logic;
signal botton: std_logic_vector(15 downto 0);

begin
	random1: contador_rand port map(clk10k,enrand,reset,num_random);
	registro1: registro_random1 port map(clk,reset,enableR,OR_16,num_random,num_reg1);
	encoder1: bintodec port map(num_reg1,num_led);
	encoder2: dectobin port map(boton,num_boton);
	contadori: contador port map(clk,eni,reset,Qi);
	comparadori: comparador port map(Qi,"1111",'1',igual15);
	comparador1: comparador port map(num_reg1,num_boton,OR_16,AigualB);
	contador1: contador port map(clk,enAigualB,reset,aciertos);
	MSS: controlador port map(clk,reset,start,AigualB,dosseg,igual15,state,enableR,enReg1,enAigualB,eni,enrand,fin,reset_delay,reset_reg);
	registro2: registro_random port map(clk,reset,fin,'0',aciertos,num_aciertos);
	
	tiempo_TO_BCD: Conv_Bin_BCD port map(t_prom,tcet,tdec,tuni);
	--decoderDtuni: decoder_a_7segmentos port map(tuni,'1',Dtuni);
	--decoderDtdec: decoder_a_7segmentos port map(tdec,'1',Dtdec);
	--decoderDtcet: decoder_a_7segmentos port map(tcet,'1',Dtcet);
	
	aciertos_TO_BCD: Conv_Bin_BCD port map(B,acet,adec,auni);
	--decoderDauni: decoder_a_7segmentos port map(auni,'1',Dauni);
	--decoderDddec: decoder_a_7segmentos port map(adec,'1',Dadec);
	
	tiempo1s_S: tiempo2s port map(clk10,reset_delay,dosseg);
	
	OR_16 <= botton(15) OR botton(14) OR botton(13) OR botton(12) OR botton(11) OR botton(10) OR botton(9) OR botton(8) OR botton(7) OR botton(6) OR botton(5) OR botton(4) OR botton(3) OR botton(2) OR botton(1) OR botton(0);
	contador_tiempo1: contador_tiempo port map(clkRand,OR_16,dosseg,AigualB,reset,cnt_tiempo);
	registro3: registro_8bits port map(clkRand,reset,tiempo,cnt_tiempo,tiempo_reaccion);
	registro4: registro_tiempo port map(clk,reset,fin,tiempo_reaccion,tiempo_medio);
	A <= tiempo_medio;
	B <= "0000"&num_aciertos;
	divisor1: divisor port map(clk,reset,fin,A,B,t_prom);
	
	
	A0: ANTIREBOTE port map(not boton(0),clk100,botton(0));
	A1: ANTIREBOTE port map(not boton(1),clk100,botton(1));
	A2: ANTIREBOTE port map(not boton(2),clk100,botton(2));
	A3: ANTIREBOTE port map(not boton(3),clk100,botton(3));
	A4: ANTIREBOTE port map(not boton(4),clk100,botton(4));
	A5: ANTIREBOTE port map(not boton(5),clk100,botton(5));
	A6: ANTIREBOTE port map(not boton(6),clk100,botton(6));
	A7: ANTIREBOTE port map(not boton(7),clk100,botton(7));
	A8: ANTIREBOTE port map(not boton(8),clk100,botton(8));
	A9: ANTIREBOTE port map(not boton(9),clk100,botton(9));
	A10: ANTIREBOTE port map(not boton(10),clk100,botton(10));
	A11: ANTIREBOTE port map(not boton(11),clk100,botton(11));
	A12: ANTIREBOTE port map(not boton(12),clk100,botton(12));
	A13: ANTIREBOTE port map(not boton(13),clk100,botton(13));
	A14: ANTIREBOTE port map(not boton(14),clk100,botton(14));
	A15: ANTIREBOTE port map(not boton(15),clk100,botton(15));
	
	
	BTN_reset: ANTIREBOTE port map(breset,clk100,reset);
	BTN_start: ANTIREBOTE port map(bstart,clk100,start);
	
	
	DivFrec: CLOCK_DIV_50 port map(clock,clkRand,clK100k,clk10k,clk,clk100,clk10,tiempo);
	
end solucion;