Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subkey_generation is
port(generated_key: in std_logic_vector(255 downto 0);
     key_1: inout std_logic_vector(127 downto 0);
     key_2: inout std_logic_vector(127 downto 0);
     key_3: inout std_logic_vector(127 downto 0);
     key_4: inout std_logic_vector(127 downto 0);
     key_5: inout std_logic_vector(127 downto 0);
     key_6: inout std_logic_vector(127 downto 0);
     key_7: inout std_logic_vector(127 downto 0);
     key_8: inout std_logic_vector(127 downto 0));
end subkey_generation;
architecture behavioral of subkey_generation is
begin
process(generated_key)
begin
key_1(127 downto 96)<= generated_key(255 downto 224);
key_1(95 downto 64)<= generated_key(191 downto 160);
key_1(63 downto 32 )<= generated_key(127 downto 96);
key_1(31 downto 0)<= generated_key(63 downto 32);

key_2(127 downto 96)<= generated_key(223 downto 192);
key_2(95 downto 64)<= generated_key(159 downto 128);
key_2(63 downto 32 )<= generated_key(95 downto 64);
key_2(31 downto 0)<= generated_key(31 downto 0);

key_3(127 downto 32)<= generated_key(255 downto 160);
key_3(31 downto 0)<= generated_key(31 downto 0);

key_4(127 downto 32)<= generated_key(127 downto 32);
key_4(31 downto 0)<= generated_key(159 downto 128);

key_5<=generated_key(223 downto 96);

key_6(127 downto 32)<= generated_key(95 downto 0);
key_6(31 downto 0)<= generated_key(255 downto 224);

key_7(127 downto 96)<= generated_key(31 downto 0);
key_7(95 downto 0)<= generated_key(255 downto 160);

key_8(127 downto 0)<= generated_key(159 downto 32);

end process;
end; 