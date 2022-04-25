-----------------------------------------------------------------------------------------
-- Modulen Exercise3_tb används som testbänk för modulen Exercise3_tb, som består av 
-- fyra insignaler switch[3:0] samt fyra utsignaler led[3:0]. Sanningstabellen för modulen 
-- Exercise1 visas nedan:
--
-- switch[3:0]   led[3:0]
--    0000         0001
--    0001         0000  
--    0010         0101
--    0011         0100
--    0100         1101
--    0101         1100
--    0110         1011
--    0111         1010
--    1000         1001
--    1001         1000
--    1010         1101
--    1011         1110
--    1100         1101
--    1101         1110
--    1110         1011
--    1111         1010
--
-- I denna testbänk deklareras signaler med samma namn som toppmodulens I/O-portar. 
-- Varje kombination av insignaler switch[3:0] testas en efter en under 10 ns var, 
-- där utsignaler led[3:0] kontrolleras via simulering i ModelSim. Total tid för 
-- simuleringen uppgår därmed till 160 ns.
-----------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Exercise3_tb is
end entity;

architecture Behaviour of Exercise3_tb is

signal switch : std_logic_vector(3 downto 0); -- Simulerade insignaler.
signal led    : std_logic_vector(3 downto 0); -- Simulerade utsignaler.

---------------------------------------------------------------------------------
-- Deklarerar toppmodulen Exercise3 för att kunna skapa en instans av denna,
-- vilket möjliggör sammankoppling av dess I/O-portar med simulerade signaler 
-- med samma namn för simulering.
---------------------------------------------------------------------------------
component Exercise3 is
	port
	(
	   switch : in std_logic_vector(3 downto 0); -- Insignaler från slide-switchar.
		led    : out std_logic_vector(3 downto 0) -- Utsignaler till lysdioder.
	);
end component;

begin

   ---------------------------------------------------------------------------------
   -- Sammankopplar toppmodulens I/O-portar med signaler med samma namn i testbänken
   -- för simulering via port mapping. En instans av toppmdolen Exercise3 döpt
   -- Exercise3_instance deklareras för att möjliggöra sammankopplingen.
   ---------------------------------------------------------------------------------
   Exercise3_instance: Exercise3 port map
	(
	   switch => switch,
		led    => led
	);
	
	---------------------------------------------------------------------------------
   -- Simulerar samtliga kombinationer 0000 - 1111 via en process, där varje 
	-- kombination av insignaler switch[3:0] testas under 10 ns.
   ---------------------------------------------------------------------------------
	process is
	begin
	   for i in 0 to 15 loop
		   switch <= std_logic_vector(to_unsigned(i, 4));
			wait for 10 ns;
		end loop;
		wait;
	end process;
	
end architecture;