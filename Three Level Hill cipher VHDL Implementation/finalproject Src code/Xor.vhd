library IEEE;
use ieee.std_logic_1164.ALL;


entity xor_op is
port(xor_in00:in std_logic_vector(7 downto 0);
     xor_in01:in std_logic_vector(7 downto 0);
     xor_in02:in std_logic_vector(7 downto 0);
     xor_in03:in std_logic_vector(7 downto 0);
     xor_in10:in std_logic_vector(7 downto 0);
     xor_in11:in std_logic_vector(7 downto 0);
     xor_in12:in std_logic_vector(7 downto 0);
     xor_in13:in std_logic_vector(7 downto 0);
     xor_in20:in std_logic_vector(7 downto 0);
     xor_in21:in std_logic_vector(7 downto 0);
     xor_in22:in std_logic_vector(7 downto 0);
     xor_in23:in std_logic_vector(7 downto 0);
     xor_in30:in std_logic_vector(7 downto 0);
     xor_in31:in std_logic_vector(7 downto 0);
     xor_in32:in std_logic_vector(7 downto 0);
     xor_in33:in std_logic_vector(7 downto 0);

     sk_in00:in std_logic_vector(7 downto 0);
     sk_in01:in std_logic_vector(7 downto 0);
     sk_in02:in std_logic_vector(7 downto 0);
     sk_in03:in std_logic_vector(7 downto 0);
     sk_in10:in std_logic_vector(7 downto 0);
     sk_in11:in std_logic_vector(7 downto 0);
     sk_in12:in std_logic_vector(7 downto 0);
     sk_in13:in std_logic_vector(7 downto 0);
     sk_in20:in std_logic_vector(7 downto 0);
     sk_in21:in std_logic_vector(7 downto 0);
     sk_in22:in std_logic_vector(7 downto 0);
     sk_in23:in std_logic_vector(7 downto 0);
     sk_in30:in std_logic_vector(7 downto 0);
     sk_in31:in std_logic_vector(7 downto 0);
     sk_in32:in std_logic_vector(7 downto 0);
     sk_in33:in std_logic_vector(7 downto 0);

     xor_out00:out std_logic_vector(7 downto 0);
     xor_out01:out std_logic_vector(7 downto 0);
     xor_out02:out std_logic_vector(7 downto 0);
     xor_out03:out std_logic_vector(7 downto 0);
     xor_out10:out std_logic_vector(7 downto 0);
     xor_out11:out std_logic_vector(7 downto 0);
     xor_out12:out std_logic_vector(7 downto 0);
     xor_out13:out std_logic_vector(7 downto 0);
     xor_out20:out std_logic_vector(7 downto 0);
     xor_out21:out std_logic_vector(7 downto 0);
     xor_out22:out std_logic_vector(7 downto 0);
     xor_out23:out std_logic_vector(7 downto 0);
     xor_out30:out std_logic_vector(7 downto 0);
     xor_out31:out std_logic_vector(7 downto 0);
     xor_out32:out std_logic_vector(7 downto 0);
     xor_out33:out std_logic_vector(7 downto 0));

end xor_op;

architecture behavioral of xor_op is
begin 
process(xor_in00,xor_in01,xor_in02,xor_in03,xor_in10,xor_in11,xor_in12,xor_in13,xor_in20,xor_in21,xor_in22,xor_in23,xor_in30,xor_in31,xor_in32,xor_in33,sk_in00,sk_in01,sk_in02,sk_in03,sk_in10,sk_in11,sk_in12,sk_in13,sk_in20,sk_in21,sk_in22,sk_in23,sk_in30,sk_in31,sk_in32,sk_in33) 
begin
xor_out00<=xor_in00 xor sk_in00;
xor_out01<=xor_in01 xor sk_in01;
xor_out02<=xor_in02 xor sk_in02;
xor_out03<=xor_in03 xor sk_in03;
xor_out10<=xor_in10 xor sk_in10;
xor_out11<=xor_in11 xor sk_in11;
xor_out12<=xor_in12 xor sk_in12;
xor_out13<=xor_in13 xor sk_in13;
xor_out20<=xor_in20 xor sk_in20;
xor_out21<=xor_in21 xor sk_in21;
xor_out22<=xor_in22 xor sk_in22;
xor_out23<=xor_in23 xor sk_in23;
xor_out30<=xor_in30 xor sk_in30;
xor_out31<=xor_in31 xor sk_in31;
xor_out32<=xor_in32 xor sk_in32;
xor_out33<=xor_in33 xor sk_in33;
end process;
end;