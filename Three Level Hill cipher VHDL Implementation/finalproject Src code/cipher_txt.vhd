library IEEE;
use IEEE.std_logic_1164.all;
entity cipher_text is
port( cipher00:in std_logic_vector(7 downto 0);
      cipher01:in std_logic_vector(7 downto 0);
      cipher02:in std_logic_vector(7 downto 0);
      cipher03:in std_logic_vector(7 downto 0);
      cipher10:in std_logic_vector(7 downto 0);
      cipher11:in std_logic_vector(7 downto 0);
      cipher12:in std_logic_vector(7 downto 0);
      cipher13:in std_logic_vector(7 downto 0);
      cipher20:in std_logic_vector(7 downto 0);
      cipher21:in std_logic_vector(7 downto 0);
      cipher22:in std_logic_vector(7 downto 0);
      cipher23:in std_logic_vector(7 downto 0);
      cipher30:in std_logic_vector(7 downto 0);
      cipher31:in std_logic_vector(7 downto 0);
      cipher32:in std_logic_vector(7 downto 0);
      cipher33:in std_logic_vector(7 downto 0);
      ct_out : out std_logic_vector(127 downto 0));
end cipher_text;

architecture behavioral of cipher_text is 
signal ct:std_logic_vector (127 downto 0);
begin
process(cipher00,cipher01,cipher02,cipher03,cipher10,cipher11,cipher12,cipher13,cipher20,cipher21,cipher22,cipher23,cipher30,cipher31,cipher32,cipher33)
begin
ct(127 downto 120)<=cipher00;
ct(119 downto 112)<=cipher01;
ct(111 downto 104)<=cipher02;
ct(103 downto 96)<=cipher03;

ct(95 downto 88)<=cipher10;
ct(87 downto 80 )<=cipher11;
ct(79 downto 72 )<=cipher12;
ct(71 downto 64 )<=cipher13;

ct(63 downto 56 )<=cipher20;
ct(55 downto 48 )<=cipher21;
ct(47 downto 40)<=cipher22;
ct(39 downto 32)<=cipher23;

ct(31 downto 24)<=cipher30;
ct(23 downto 16)<=cipher31;
ct(15 downto 8)<=cipher32;
ct(7 downto 0)<=cipher33;
end process;
ct_out<=ct;
end;