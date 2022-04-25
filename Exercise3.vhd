-----------------------------------------------------------------------------------------
-- Modulen Exercise3 används för att realisera ett system bestående av fyra insignaler
-- switch[3:0] samt fyra utsignaler led[3:0]. Sanningstabellen för modulen visas nedan:
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
-- Modulens funktionalitet implementeras i enlighet med ovanstående sanningstabell via 
-- en case-sats, placerad i en asynkron process som reagerar på förändring av insignaler
-- switch[3:0]. Via denna process sker uppdatering av utsignaler led[3:0] omedelbart vid 
-- förändring av insignaler switch[3:0]. Ifall en eller flera insignaler är odefinierade 
-- så nollställs samtliga utsignaler.
-----------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Exercise3 is
	port
	(
	   switch : in std_logic_vector(3 downto 0); -- Insignaler från slide-switchar.
		led    : out std_logic_vector(3 downto 0) -- Utsignaler till lysdioder.
	);
end entity;

architecture Behaviour of Exercise3 is
begin
   process (switch) is
	begin
	   case (switch) is
		   when "0000" => led <= "0001";
			when "0001" => led <= "0000";
			when "0010" => led <= "0101";
			when "0011" => led <= "0100";
			when "0100" => led <= "1101";
			when "0101" => led <= "1100";
			when "0110" => led <= "1011";
			when "0111" => led <= "1010";
			when "1000" => led <= "1001";
			when "1001" => led <= "1000";
			when "1010" => led <= "1101";
			when "1011" => led <= "1110";
			when "1100" => led <= "1101";
			when "1101" => led <= "1110";
			when "1110" => led <= "1011";
			when "1111" => led <= "1010";
			when others => led <= "0000";
		end case;
	end process;
end architecture;