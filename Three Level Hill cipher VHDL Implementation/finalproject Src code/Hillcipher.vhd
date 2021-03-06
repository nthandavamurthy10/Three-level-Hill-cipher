LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity hill_cipher is
port( clk:in std_logic;
      plain_txt:in std_logic_vector(127 downto 0);
      cipher:out std_logic_vector(127 downto 0));
end hill_cipher;

architecture structural of hill_cipher is 
component random_number is
port(clk:in std_logic;
     k1:inout std_logic_vector(255 downto 0);
     k2:inout std_logic_vector(255 downto 0);
     k3:inout std_logic_vector(255 downto 0));
end component;

Component subkey_generation is
port(generated_key: in std_logic_vector(255 downto 0);
     key_1: inout std_logic_vector(127 downto 0);
     key_2: inout std_logic_vector(127 downto 0);
     key_3: inout std_logic_vector(127 downto 0);
     key_4: inout std_logic_vector(127 downto 0);
     key_5: inout std_logic_vector(127 downto 0);
     key_6: inout std_logic_vector(127 downto 0);
     key_7: inout std_logic_vector(127 downto 0);
     key_8: inout std_logic_vector(127 downto 0));
end component;


component vector_conv is
port( vector_in: in std_logic_vector (127 downto 0);
     mat_out00:inout std_logic_vector(7 downto 0);
     mat_out01:inout std_logic_vector(7 downto 0);
mat_out02:inout std_logic_vector(7 downto 0);
mat_out03:inout std_logic_vector(7 downto 0);
mat_out10:inout std_logic_vector(7 downto 0);
mat_out11:inout std_logic_vector(7 downto 0);
mat_out12:inout std_logic_vector(7 downto 0);
mat_out13:inout std_logic_vector(7 downto 0);
mat_out20:inout std_logic_vector(7 downto 0);
mat_out21:inout std_logic_vector(7 downto 0);
mat_out22:inout std_logic_vector(7 downto 0);
mat_out23:inout std_logic_vector(7 downto 0);
mat_out30:inout std_logic_vector(7 downto 0);
mat_out31:inout std_logic_vector(7 downto 0);
mat_out32:inout std_logic_vector(7 downto 0);
mat_out33:inout std_logic_vector(7 downto 0));
end component;

component matrix_mul is
port(in_pt00:in std_logic_vector(7 downto 0);
     in_pt01:in std_logic_vector(7 downto 0);
     in_pt02:in std_logic_vector(7 downto 0);
     in_pt03:in std_logic_vector(7 downto 0);
     in_pt10:in std_logic_vector(7 downto 0);
     in_pt11:in std_logic_vector(7 downto 0);
     in_pt12:in std_logic_vector(7 downto 0);
     in_pt13:in std_logic_vector(7 downto 0);
     in_pt20:in std_logic_vector(7 downto 0);
     in_pt21:in std_logic_vector(7 downto 0);
     in_pt22:in std_logic_vector(7 downto 0);
     in_pt23:in std_logic_vector(7 downto 0);
     in_pt30:in std_logic_vector(7 downto 0);
     in_pt31:in std_logic_vector(7 downto 0);
     in_pt32:in std_logic_vector(7 downto 0);
     in_pt33:in std_logic_vector(7 downto 0);
     in_key00:in std_logic_vector(7 downto 0);
     in_key01:in std_logic_vector(7 downto 0);
     in_key02:in std_logic_vector(7 downto 0);
     in_key03:in std_logic_vector(7 downto 0);
     in_key10:in std_logic_vector(7 downto 0);
     in_key11:in std_logic_vector(7 downto 0);
     in_key12:in std_logic_vector(7 downto 0);
     in_key13:in std_logic_vector(7 downto 0);
     in_key20:in std_logic_vector(7 downto 0);
     in_key21:in std_logic_vector(7 downto 0);
     in_key22:in std_logic_vector(7 downto 0);
     in_key23:in std_logic_vector(7 downto 0);
     in_key30:in std_logic_vector(7 downto 0);
     in_key31:in std_logic_vector(7 downto 0);
     in_key32:in std_logic_vector(7 downto 0);
     in_key33:in std_logic_vector(7 downto 0);

     
     stir_in0 : inout std_logic_vector(7 downto 0);
     stir_in1 : inout std_logic_vector(7 downto 0);
     stir_in2 : inout std_logic_vector(7 downto 0);
     stir_in3 : inout std_logic_vector(7 downto 0);

     stir_in4 : inout std_logic_vector(7 downto 0);
     stir_in5 : inout std_logic_vector(7 downto 0);
     stir_in6 : inout std_logic_vector(7 downto 0);
     stir_in7 : inout std_logic_vector(7 downto 0);

     stir_in8 : inout std_logic_vector(7 downto 0);
     stir_in9 : inout std_logic_vector(7 downto 0);
     stir_in10 : inout std_logic_vector(7 downto 0);
     stir_in11 : inout std_logic_vector(7 downto 0);

     stir_in12: inout std_logic_vector(7 downto 0);
     stir_in13 : inout std_logic_vector(7 downto 0);
     stir_in14 : inout std_logic_vector(7 downto 0);
     stir_in15 : inout std_logic_vector(7 downto 0));
end component;

component xor_op is
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

end component;

component stir_op is 
port (stir_in0:in std_logic_vector(7 downto 0);
      stir_in1:in std_logic_vector(7 downto 0);
      stir_in2:in std_logic_vector(7 downto 0);
      stir_in3:in std_logic_vector(7 downto 0);
      stir_in4:in std_logic_vector(7 downto 0);
      stir_in5:in std_logic_vector(7 downto 0);
      stir_in6:in std_logic_vector(7 downto 0);
      stir_in7:in std_logic_vector(7 downto 0);
      stir_in8:in std_logic_vector(7 downto 0);
      stir_in9:in std_logic_vector(7 downto 0);
      stir_in10:in std_logic_vector(7 downto 0);
      stir_in11:in std_logic_vector(7 downto 0);
      stir_in12:in std_logic_vector(7 downto 0);
      stir_in13:in std_logic_vector(7 downto 0);
      stir_in14:in std_logic_vector(7 downto 0);
      stir_in15:in std_logic_vector(7 downto 0);
      stir_out00:inout std_logic_vector(7 downto 0);
      stir_out01:inout std_logic_vector(7 downto 0);
      stir_out02:inout std_logic_vector(7 downto 0);
      stir_out03:inout std_logic_vector(7 downto 0);
      stir_out10:inout std_logic_vector(7 downto 0);
      stir_out11:inout std_logic_vector(7 downto 0);
      stir_out12:inout std_logic_vector(7 downto 0);
     stir_out13:inout std_logic_vector(7 downto 0);
     stir_out20:inout std_logic_vector(7 downto 0);
     stir_out21:inout std_logic_vector(7 downto 0);
     stir_out22:inout std_logic_vector(7 downto 0);
     stir_out23:inout std_logic_vector(7 downto 0);
     stir_out30:inout std_logic_vector(7 downto 0);
    stir_out31:inout std_logic_vector(7 downto 0);
    stir_out32:inout std_logic_vector(7 downto 0);
    stir_out33:inout std_logic_vector(7 downto 0));

end component;

component cipher_text is
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
end component;

signal key1:std_logic_vector(255 downto 0);
signal key2:std_logic_vector(255 downto 0);
signal key3:std_logic_vector(255 downto 0);

signal sk1:std_logic_vector(127 downto 0);
signal sk2:std_logic_vector(127 downto 0);
signal sk3:std_logic_vector(127 downto 0);
signal sk4:std_logic_vector(127 downto 0);
signal sk5:std_logic_vector(127 downto 0);
signal sk6:std_logic_vector(127 downto 0);
signal sk7:std_logic_vector(127 downto 0);
signal sk8:std_logic_vector(127 downto 0);

signal sk11:std_logic_vector(127 downto 0);
signal sk21:std_logic_vector(127 downto 0);
signal sk31:std_logic_vector(127 downto 0);
signal sk41:std_logic_vector(127 downto 0);
signal sk51:std_logic_vector(127 downto 0);
signal sk61:std_logic_vector(127 downto 0);
signal sk71:std_logic_vector(127 downto 0);
signal sk81:std_logic_vector(127 downto 0);

signal sk12:std_logic_vector(127 downto 0);
signal sk22:std_logic_vector(127 downto 0);
signal sk32:std_logic_vector(127 downto 0);
signal sk42:std_logic_vector(127 downto 0);
signal sk52:std_logic_vector(127 downto 0);
signal sk62:std_logic_vector(127 downto 0);
signal sk72:std_logic_vector(127 downto 0);
signal sk82:std_logic_vector(127 downto 0);



signal convk_o00:std_logic_vector(7 downto 0);
signal convk_o01:std_logic_vector(7 downto 0);
signal convk_o02:std_logic_vector(7 downto 0);
signal convk_o03:std_logic_vector(7 downto 0);
signal convk_o10:std_logic_vector(7 downto 0);
signal convk_o11:std_logic_vector(7 downto 0);
signal convk_o12:std_logic_vector(7 downto 0);
signal convk_o13:std_logic_vector(7 downto 0);
signal convk_o20:std_logic_vector(7 downto 0);
signal convk_o21:std_logic_vector(7 downto 0);
signal convk_o22:std_logic_vector(7 downto 0);
signal convk_o23:std_logic_vector(7 downto 0);
signal convk_o30:std_logic_vector(7 downto 0);
signal convk_o31:std_logic_vector(7 downto 0);
signal convk_o32:std_logic_vector(7 downto 0);
signal convk_o33:std_logic_vector(7 downto 0);

signal convk1_o00:std_logic_vector(7 downto 0);
signal convk1_o01:std_logic_vector(7 downto 0);
signal convk1_o02:std_logic_vector(7 downto 0);
signal convk1_o03:std_logic_vector(7 downto 0);
signal convk1_o10:std_logic_vector(7 downto 0);
signal convk1_o11:std_logic_vector(7 downto 0);
signal convk1_o12:std_logic_vector(7 downto 0);
signal convk1_o13:std_logic_vector(7 downto 0);
signal convk1_o20:std_logic_vector(7 downto 0);
signal convk1_o21:std_logic_vector(7 downto 0);
signal convk1_o22:std_logic_vector(7 downto 0);
signal convk1_o23:std_logic_vector(7 downto 0);
signal convk1_o30:std_logic_vector(7 downto 0);
signal convk1_o31:std_logic_vector(7 downto 0);
signal convk1_o32:std_logic_vector(7 downto 0);
signal convk1_o33:std_logic_vector(7 downto 0);

signal convk2_o00:std_logic_vector(7 downto 0);
signal convk2_o01:std_logic_vector(7 downto 0);
signal convk2_o02:std_logic_vector(7 downto 0);
signal convk2_o03:std_logic_vector(7 downto 0);
signal convk2_o10:std_logic_vector(7 downto 0);
signal convk2_o11:std_logic_vector(7 downto 0);
signal convk2_o12:std_logic_vector(7 downto 0);
signal convk2_o13:std_logic_vector(7 downto 0);
signal convk2_o20:std_logic_vector(7 downto 0);
signal convk2_o21:std_logic_vector(7 downto 0);
signal convk2_o22:std_logic_vector(7 downto 0);
signal convk2_o23:std_logic_vector(7 downto 0);
signal convk2_o30:std_logic_vector(7 downto 0);
signal convk2_o31:std_logic_vector(7 downto 0);
signal convk2_o32:std_logic_vector(7 downto 0);
signal convk2_o33:std_logic_vector(7 downto 0);

signal convp_o00:std_logic_vector(7 downto 0);
signal convp_o01:std_logic_vector(7 downto 0);
signal convp_o02:std_logic_vector(7 downto 0);
signal convp_o03:std_logic_vector(7 downto 0);
signal convp_o10:std_logic_vector(7 downto 0);
signal convp_o11:std_logic_vector(7 downto 0);
signal convp_o12:std_logic_vector(7 downto 0);
signal convp_o13:std_logic_vector(7 downto 0);
signal convp_o20:std_logic_vector(7 downto 0);
signal convp_o21:std_logic_vector(7 downto 0);
signal convp_o22:std_logic_vector(7 downto 0);
signal convp_o23:std_logic_vector(7 downto 0);
signal convp_o30:std_logic_vector(7 downto 0);
signal convp_o31:std_logic_vector(7 downto 0);
signal convp_o32:std_logic_vector(7 downto 0);
signal convp_o33:std_logic_vector(7 downto 0);

signal convk3_o00:std_logic_vector(7 downto 0);
signal convk3_o01:std_logic_vector(7 downto 0);
signal convk3_o02:std_logic_vector(7 downto 0);
signal convk3_o03:std_logic_vector(7 downto 0);
signal convk3_o10:std_logic_vector(7 downto 0);
signal convk3_o11:std_logic_vector(7 downto 0);
signal convk3_o12:std_logic_vector(7 downto 0);
signal convk3_o13:std_logic_vector(7 downto 0);
signal convk3_o20:std_logic_vector(7 downto 0);
signal convk3_o21:std_logic_vector(7 downto 0);
signal convk3_o22:std_logic_vector(7 downto 0);
signal convk3_o23:std_logic_vector(7 downto 0);
signal convk3_o30:std_logic_vector(7 downto 0);
signal convk3_o31:std_logic_vector(7 downto 0);
signal convk3_o32:std_logic_vector(7 downto 0);
signal convk3_o33:std_logic_vector(7 downto 0);

signal convk4_o00:std_logic_vector(7 downto 0);
signal convk4_o01:std_logic_vector(7 downto 0);
signal convk4_o02:std_logic_vector(7 downto 0);
signal convk4_o03:std_logic_vector(7 downto 0);
signal convk4_o10:std_logic_vector(7 downto 0);
signal convk4_o11:std_logic_vector(7 downto 0);
signal convk4_o12:std_logic_vector(7 downto 0);
signal convk4_o13:std_logic_vector(7 downto 0);
signal convk4_o20:std_logic_vector(7 downto 0);
signal convk4_o21:std_logic_vector(7 downto 0);
signal convk4_o22:std_logic_vector(7 downto 0);
signal convk4_o23:std_logic_vector(7 downto 0);
signal convk4_o30:std_logic_vector(7 downto 0);
signal convk4_o31:std_logic_vector(7 downto 0);
signal convk4_o32:std_logic_vector(7 downto 0);
signal convk4_o33:std_logic_vector(7 downto 0);

signal convk5_o00:std_logic_vector(7 downto 0);
signal convk5_o01:std_logic_vector(7 downto 0);
signal convk5_o02:std_logic_vector(7 downto 0);
signal convk5_o03:std_logic_vector(7 downto 0);
signal convk5_o10:std_logic_vector(7 downto 0);
signal convk5_o11:std_logic_vector(7 downto 0);
signal convk5_o12:std_logic_vector(7 downto 0);
signal convk5_o13:std_logic_vector(7 downto 0);
signal convk5_o20:std_logic_vector(7 downto 0);
signal convk5_o21:std_logic_vector(7 downto 0);
signal convk5_o22:std_logic_vector(7 downto 0);
signal convk5_o23:std_logic_vector(7 downto 0);
signal convk5_o30:std_logic_vector(7 downto 0);
signal convk5_o31:std_logic_vector(7 downto 0);
signal convk5_o32:std_logic_vector(7 downto 0);
signal convk5_o33:std_logic_vector(7 downto 0);

signal convk6_o00:std_logic_vector(7 downto 0);
signal convk6_o01:std_logic_vector(7 downto 0);
signal convk6_o02:std_logic_vector(7 downto 0);
signal convk6_o03:std_logic_vector(7 downto 0);
signal convk6_o10:std_logic_vector(7 downto 0);
signal convk6_o11:std_logic_vector(7 downto 0);
signal convk6_o12:std_logic_vector(7 downto 0);
signal convk6_o13:std_logic_vector(7 downto 0);
signal convk6_o20:std_logic_vector(7 downto 0);
signal convk6_o21:std_logic_vector(7 downto 0);
signal convk6_o22:std_logic_vector(7 downto 0);
signal convk6_o23:std_logic_vector(7 downto 0);
signal convk6_o30:std_logic_vector(7 downto 0);
signal convk6_o31:std_logic_vector(7 downto 0);
signal convk6_o32:std_logic_vector(7 downto 0);
signal convk6_o33:std_logic_vector(7 downto 0);

signal convk7_o00:std_logic_vector(7 downto 0);
signal convk7_o01:std_logic_vector(7 downto 0);
signal convk7_o02:std_logic_vector(7 downto 0);
signal convk7_o03:std_logic_vector(7 downto 0);
signal convk7_o10:std_logic_vector(7 downto 0);
signal convk7_o11:std_logic_vector(7 downto 0);
signal convk7_o12:std_logic_vector(7 downto 0);
signal convk7_o13:std_logic_vector(7 downto 0);
signal convk7_o20:std_logic_vector(7 downto 0);
signal convk7_o21:std_logic_vector(7 downto 0);
signal convk7_o22:std_logic_vector(7 downto 0);
signal convk7_o23:std_logic_vector(7 downto 0);
signal convk7_o30:std_logic_vector(7 downto 0);
signal convk7_o31:std_logic_vector(7 downto 0);
signal convk7_o32:std_logic_vector(7 downto 0);
signal convk7_o33:std_logic_vector(7 downto 0);

signal mat_out0:std_logic_vector(7 downto 0);
signal mat_out1:std_logic_vector(7 downto 0);
signal mat_out2:std_logic_vector(7 downto 0);
signal mat_out3:std_logic_vector(7 downto 0);
signal mat_out4:std_logic_vector(7 downto 0);
signal mat_out5:std_logic_vector(7 downto 0);
signal mat_out6:std_logic_vector(7 downto 0);
signal mat_out7:std_logic_vector(7 downto 0);
signal mat_out8:std_logic_vector(7 downto 0);
signal mat_out9:std_logic_vector(7 downto 0);
signal mat_out10:std_logic_vector(7 downto 0);
signal mat_out11:std_logic_vector(7 downto 0);
signal mat_out12:std_logic_vector(7 downto 0);
signal mat_out13:std_logic_vector(7 downto 0);
signal mat_out14:std_logic_vector(7 downto 0);
signal mat_out15:std_logic_vector(7 downto 0);

signal mat1_out0:std_logic_vector(7 downto 0);
signal mat1_out1:std_logic_vector(7 downto 0);
signal mat1_out2:std_logic_vector(7 downto 0);
signal mat1_out3:std_logic_vector(7 downto 0);
signal mat1_out4:std_logic_vector(7 downto 0);
signal mat1_out5:std_logic_vector(7 downto 0);
signal mat1_out6:std_logic_vector(7 downto 0);
signal mat1_out7:std_logic_vector(7 downto 0);
signal mat1_out8:std_logic_vector(7 downto 0);
signal mat1_out9:std_logic_vector(7 downto 0);
signal mat1_out10:std_logic_vector(7 downto 0);
signal mat1_out11:std_logic_vector(7 downto 0);
signal mat1_out12:std_logic_vector(7 downto 0);
signal mat1_out13:std_logic_vector(7 downto 0);
signal mat1_out14:std_logic_vector(7 downto 0);
signal mat1_out15:std_logic_vector(7 downto 0);

signal mat2_out0:std_logic_vector(7 downto 0);
signal mat2_out1:std_logic_vector(7 downto 0);
signal mat2_out2:std_logic_vector(7 downto 0);
signal mat2_out3:std_logic_vector(7 downto 0);
signal mat2_out4:std_logic_vector(7 downto 0);
signal mat2_out5:std_logic_vector(7 downto 0);
signal mat2_out6:std_logic_vector(7 downto 0);
signal mat2_out7:std_logic_vector(7 downto 0);
signal mat2_out8:std_logic_vector(7 downto 0);
signal mat2_out9:std_logic_vector(7 downto 0);
signal mat2_out10:std_logic_vector(7 downto 0);
signal mat2_out11:std_logic_vector(7 downto 0);
signal mat2_out12:std_logic_vector(7 downto 0);
signal mat2_out13:std_logic_vector(7 downto 0);
signal mat2_out14:std_logic_vector(7 downto 0);
signal mat2_out15:std_logic_vector(7 downto 0);

signal mat3_out0:std_logic_vector(7 downto 0);
signal mat3_out1:std_logic_vector(7 downto 0);
signal mat3_out2:std_logic_vector(7 downto 0);
signal mat3_out3:std_logic_vector(7 downto 0);
signal mat3_out4:std_logic_vector(7 downto 0);
signal mat3_out5:std_logic_vector(7 downto 0);
signal mat3_out6:std_logic_vector(7 downto 0);
signal mat3_out7:std_logic_vector(7 downto 0);
signal mat3_out8:std_logic_vector(7 downto 0);
signal mat3_out9:std_logic_vector(7 downto 0);
signal mat3_out10:std_logic_vector(7 downto 0);
signal mat3_out11:std_logic_vector(7 downto 0);
signal mat3_out12:std_logic_vector(7 downto 0);
signal mat3_out13:std_logic_vector(7 downto 0);
signal mat3_out14:std_logic_vector(7 downto 0);
signal mat3_out15:std_logic_vector(7 downto 0);

signal mat4_out0:std_logic_vector(7 downto 0);
signal mat4_out1:std_logic_vector(7 downto 0);
signal mat4_out2:std_logic_vector(7 downto 0);
signal mat4_out3:std_logic_vector(7 downto 0);
signal mat4_out4:std_logic_vector(7 downto 0);
signal mat4_out5:std_logic_vector(7 downto 0);
signal mat4_out6:std_logic_vector(7 downto 0);
signal mat4_out7:std_logic_vector(7 downto 0);
signal mat4_out8:std_logic_vector(7 downto 0);
signal mat4_out9:std_logic_vector(7 downto 0);
signal mat4_out10:std_logic_vector(7 downto 0);
signal mat4_out11:std_logic_vector(7 downto 0);
signal mat4_out12:std_logic_vector(7 downto 0);
signal mat4_out13:std_logic_vector(7 downto 0);
signal mat4_out14:std_logic_vector(7 downto 0);
signal mat4_out15:std_logic_vector(7 downto 0);

signal mat5_out0:std_logic_vector(7 downto 0);
signal mat5_out1:std_logic_vector(7 downto 0);
signal mat5_out2:std_logic_vector(7 downto 0);
signal mat5_out3:std_logic_vector(7 downto 0);
signal mat5_out4:std_logic_vector(7 downto 0);
signal mat5_out5:std_logic_vector(7 downto 0);
signal mat5_out6:std_logic_vector(7 downto 0);
signal mat5_out7:std_logic_vector(7 downto 0);
signal mat5_out8:std_logic_vector(7 downto 0);
signal mat5_out9:std_logic_vector(7 downto 0);
signal mat5_out10:std_logic_vector(7 downto 0);
signal mat5_out11:std_logic_vector(7 downto 0);
signal mat5_out12:std_logic_vector(7 downto 0);
signal mat5_out13:std_logic_vector(7 downto 0);
signal mat5_out14:std_logic_vector(7 downto 0);
signal mat5_out15:std_logic_vector(7 downto 0);

signal mat6_out0:std_logic_vector(7 downto 0);
signal mat6_out1:std_logic_vector(7 downto 0);
signal mat6_out2:std_logic_vector(7 downto 0);
signal mat6_out3:std_logic_vector(7 downto 0);
signal mat6_out4:std_logic_vector(7 downto 0);
signal mat6_out5:std_logic_vector(7 downto 0);
signal mat6_out6:std_logic_vector(7 downto 0);
signal mat6_out7:std_logic_vector(7 downto 0);
signal mat6_out8:std_logic_vector(7 downto 0);
signal mat6_out9:std_logic_vector(7 downto 0);
signal mat6_out10:std_logic_vector(7 downto 0);
signal mat6_out11:std_logic_vector(7 downto 0);
signal mat6_out12:std_logic_vector(7 downto 0);
signal mat6_out13:std_logic_vector(7 downto 0);
signal mat6_out14:std_logic_vector(7 downto 0);
signal mat6_out15:std_logic_vector(7 downto 0);

signal mat7_out0:std_logic_vector(7 downto 0);
signal mat7_out1:std_logic_vector(7 downto 0);
signal mat7_out2:std_logic_vector(7 downto 0);
signal mat7_out3:std_logic_vector(7 downto 0);
signal mat7_out4:std_logic_vector(7 downto 0);
signal mat7_out5:std_logic_vector(7 downto 0);
signal mat7_out6:std_logic_vector(7 downto 0);
signal mat7_out7:std_logic_vector(7 downto 0);
signal mat7_out8:std_logic_vector(7 downto 0);
signal mat7_out9:std_logic_vector(7 downto 0);
signal mat7_out10:std_logic_vector(7 downto 0);
signal mat7_out11:std_logic_vector(7 downto 0);
signal mat7_out12:std_logic_vector(7 downto 0);
signal mat7_out13:std_logic_vector(7 downto 0);
signal mat7_out14:std_logic_vector(7 downto 0);
signal mat7_out15:std_logic_vector(7 downto 0);


signal stir_o00: std_logic_vector(7 downto 0);
signal stir_o01: std_logic_vector(7 downto 0);
signal stir_o02: std_logic_vector(7 downto 0);
signal stir_o03: std_logic_vector(7 downto 0);
signal stir_o10: std_logic_vector(7 downto 0);
signal stir_o11: std_logic_vector(7 downto 0);
signal stir_o12: std_logic_vector(7 downto 0);
signal stir_o13: std_logic_vector(7 downto 0);
signal stir_o20: std_logic_vector(7 downto 0);
signal stir_o21: std_logic_vector(7 downto 0);
signal stir_o22: std_logic_vector(7 downto 0);
signal stir_o23: std_logic_vector(7 downto 0);
signal stir_o30: std_logic_vector(7 downto 0);
signal stir_o31: std_logic_vector(7 downto 0);
signal stir_o32: std_logic_vector(7 downto 0);
signal stir_o33: std_logic_vector(7 downto 0);

signal stir1_o00: std_logic_vector(7 downto 0);
signal stir1_o01: std_logic_vector(7 downto 0);
signal stir1_o02: std_logic_vector(7 downto 0);
signal stir1_o03: std_logic_vector(7 downto 0);
signal stir1_o10: std_logic_vector(7 downto 0);
signal stir1_o11: std_logic_vector(7 downto 0);
signal stir1_o12: std_logic_vector(7 downto 0);
signal stir1_o13: std_logic_vector(7 downto 0);
signal stir1_o20: std_logic_vector(7 downto 0);
signal stir1_o21: std_logic_vector(7 downto 0);
signal stir1_o22: std_logic_vector(7 downto 0);
signal stir1_o23: std_logic_vector(7 downto 0);
signal stir1_o30: std_logic_vector(7 downto 0);
signal stir1_o31: std_logic_vector(7 downto 0);
signal stir1_o32: std_logic_vector(7 downto 0);
signal stir1_o33: std_logic_vector(7 downto 0);

signal stir2_o00: std_logic_vector(7 downto 0);
signal stir2_o01: std_logic_vector(7 downto 0);
signal stir2_o02: std_logic_vector(7 downto 0);
signal stir2_o03: std_logic_vector(7 downto 0);
signal stir2_o10: std_logic_vector(7 downto 0);
signal stir2_o11: std_logic_vector(7 downto 0);
signal stir2_o12: std_logic_vector(7 downto 0);
signal stir2_o13: std_logic_vector(7 downto 0);
signal stir2_o20: std_logic_vector(7 downto 0);
signal stir2_o21: std_logic_vector(7 downto 0);
signal stir2_o22: std_logic_vector(7 downto 0);
signal stir2_o23: std_logic_vector(7 downto 0);
signal stir2_o30: std_logic_vector(7 downto 0);
signal stir2_o31: std_logic_vector(7 downto 0);
signal stir2_o32: std_logic_vector(7 downto 0);
signal stir2_o33: std_logic_vector(7 downto 0);

signal stir3_o00: std_logic_vector(7 downto 0);
signal stir3_o01: std_logic_vector(7 downto 0);
signal stir3_o02: std_logic_vector(7 downto 0);
signal stir3_o03: std_logic_vector(7 downto 0);
signal stir3_o10: std_logic_vector(7 downto 0);
signal stir3_o11: std_logic_vector(7 downto 0);
signal stir3_o12: std_logic_vector(7 downto 0);
signal stir3_o13: std_logic_vector(7 downto 0);
signal stir3_o20: std_logic_vector(7 downto 0);
signal stir3_o21: std_logic_vector(7 downto 0);
signal stir3_o22: std_logic_vector(7 downto 0);
signal stir3_o23: std_logic_vector(7 downto 0);
signal stir3_o30: std_logic_vector(7 downto 0);
signal stir3_o31: std_logic_vector(7 downto 0);
signal stir3_o32: std_logic_vector(7 downto 0);
signal stir3_o33: std_logic_vector(7 downto 0);

signal stir4_o00: std_logic_vector(7 downto 0);
signal stir4_o01: std_logic_vector(7 downto 0);
signal stir4_o02: std_logic_vector(7 downto 0);
signal stir4_o03: std_logic_vector(7 downto 0);
signal stir4_o10: std_logic_vector(7 downto 0);
signal stir4_o11: std_logic_vector(7 downto 0);
signal stir4_o12: std_logic_vector(7 downto 0);
signal stir4_o13: std_logic_vector(7 downto 0);
signal stir4_o20: std_logic_vector(7 downto 0);
signal stir4_o21: std_logic_vector(7 downto 0);
signal stir4_o22: std_logic_vector(7 downto 0);
signal stir4_o23: std_logic_vector(7 downto 0);
signal stir4_o30: std_logic_vector(7 downto 0);
signal stir4_o31: std_logic_vector(7 downto 0);
signal stir4_o32: std_logic_vector(7 downto 0);
signal stir4_o33: std_logic_vector(7 downto 0);

signal stir5_o00: std_logic_vector(7 downto 0);
signal stir5_o01: std_logic_vector(7 downto 0);
signal stir5_o02: std_logic_vector(7 downto 0);
signal stir5_o03: std_logic_vector(7 downto 0);
signal stir5_o10: std_logic_vector(7 downto 0);
signal stir5_o11: std_logic_vector(7 downto 0);
signal stir5_o12: std_logic_vector(7 downto 0);
signal stir5_o13: std_logic_vector(7 downto 0);
signal stir5_o20: std_logic_vector(7 downto 0);
signal stir5_o21: std_logic_vector(7 downto 0);
signal stir5_o22: std_logic_vector(7 downto 0);
signal stir5_o23: std_logic_vector(7 downto 0);
signal stir5_o30: std_logic_vector(7 downto 0);
signal stir5_o31: std_logic_vector(7 downto 0);
signal stir5_o32: std_logic_vector(7 downto 0);
signal stir5_o33: std_logic_vector(7 downto 0);

signal stir6_o00: std_logic_vector(7 downto 0);
signal stir6_o01: std_logic_vector(7 downto 0);
signal stir6_o02: std_logic_vector(7 downto 0);
signal stir6_o03: std_logic_vector(7 downto 0);
signal stir6_o10: std_logic_vector(7 downto 0);
signal stir6_o11: std_logic_vector(7 downto 0);
signal stir6_o12: std_logic_vector(7 downto 0);
signal stir6_o13: std_logic_vector(7 downto 0);
signal stir6_o20: std_logic_vector(7 downto 0);
signal stir6_o21: std_logic_vector(7 downto 0);
signal stir6_o22: std_logic_vector(7 downto 0);
signal stir6_o23: std_logic_vector(7 downto 0);
signal stir6_o30: std_logic_vector(7 downto 0);
signal stir6_o31: std_logic_vector(7 downto 0);
signal stir6_o32: std_logic_vector(7 downto 0);
signal stir6_o33: std_logic_vector(7 downto 0);

signal stir7_o00: std_logic_vector(7 downto 0);
signal stir7_o01: std_logic_vector(7 downto 0);
signal stir7_o02: std_logic_vector(7 downto 0);
signal stir7_o03: std_logic_vector(7 downto 0);
signal stir7_o10: std_logic_vector(7 downto 0);
signal stir7_o11: std_logic_vector(7 downto 0);
signal stir7_o12: std_logic_vector(7 downto 0);
signal stir7_o13: std_logic_vector(7 downto 0);
signal stir7_o20: std_logic_vector(7 downto 0);
signal stir7_o21: std_logic_vector(7 downto 0);
signal stir7_o22: std_logic_vector(7 downto 0);
signal stir7_o23: std_logic_vector(7 downto 0);
signal stir7_o30: std_logic_vector(7 downto 0);
signal stir7_o31: std_logic_vector(7 downto 0);
signal stir7_o32: std_logic_vector(7 downto 0);
signal stir7_o33: std_logic_vector(7 downto 0);

signal xor_o00: std_logic_vector(7 downto 0);
signal xor_o01: std_logic_vector(7 downto 0);
signal xor_o02: std_logic_vector(7 downto 0);
signal xor_o03: std_logic_vector(7 downto 0);
signal xor_o10: std_logic_vector(7 downto 0);
signal xor_o11: std_logic_vector(7 downto 0);
signal xor_o12: std_logic_vector(7 downto 0);
signal xor_o13: std_logic_vector(7 downto 0);
signal xor_o20: std_logic_vector(7 downto 0);
signal xor_o21: std_logic_vector(7 downto 0);
signal xor_o22: std_logic_vector(7 downto 0);
signal xor_o23: std_logic_vector(7 downto 0);
signal xor_o30: std_logic_vector(7 downto 0);
signal xor_o31: std_logic_vector(7 downto 0);
signal xor_o32: std_logic_vector(7 downto 0);
signal xor_o33: std_logic_vector(7 downto 0);

signal xor1_o00: std_logic_vector(7 downto 0);
signal xor1_o01: std_logic_vector(7 downto 0);
signal xor1_o02: std_logic_vector(7 downto 0);
signal xor1_o03: std_logic_vector(7 downto 0);
signal xor1_o10: std_logic_vector(7 downto 0);
signal xor1_o11: std_logic_vector(7 downto 0);
signal xor1_o12: std_logic_vector(7 downto 0);
signal xor1_o13: std_logic_vector(7 downto 0);
signal xor1_o20: std_logic_vector(7 downto 0);
signal xor1_o21: std_logic_vector(7 downto 0);
signal xor1_o22: std_logic_vector(7 downto 0);
signal xor1_o23: std_logic_vector(7 downto 0);
signal xor1_o30: std_logic_vector(7 downto 0);
signal xor1_o31: std_logic_vector(7 downto 0);
signal xor1_o32: std_logic_vector(7 downto 0);
signal xor1_o33: std_logic_vector(7 downto 0);

signal xor2_o00: std_logic_vector(7 downto 0);
signal xor2_o01: std_logic_vector(7 downto 0);
signal xor2_o02: std_logic_vector(7 downto 0);
signal xor2_o03: std_logic_vector(7 downto 0);
signal xor2_o10: std_logic_vector(7 downto 0);
signal xor2_o11: std_logic_vector(7 downto 0);
signal xor2_o12: std_logic_vector(7 downto 0);
signal xor2_o13: std_logic_vector(7 downto 0);
signal xor2_o20: std_logic_vector(7 downto 0);
signal xor2_o21: std_logic_vector(7 downto 0);
signal xor2_o22: std_logic_vector(7 downto 0);
signal xor2_o23: std_logic_vector(7 downto 0);
signal xor2_o30: std_logic_vector(7 downto 0);
signal xor2_o31: std_logic_vector(7 downto 0);
signal xor2_o32: std_logic_vector(7 downto 0);
signal xor2_o33: std_logic_vector(7 downto 0);

signal cipher_text1:std_logic_vector(127 downto 0);
signal cipher_text2:std_logic_vector(127 downto 0);
signal cipher_text3:std_logic_vector(127 downto 0);
signal sk: std_logic_vector(127 downto 0);
begin


h1: random_number port map (clk,key1,key2,key3);
h2: subkey_generation port map(key1,sk1,sk2,sk3,sk4,sk5,sk6,sk7,sk8);
h3: vector_conv port map(sk1,convk_o00,convk_o01,convk_o02,convk_o03,convk_o10,convk_o11,convk_o12,convk_o13,convk_o20,convk_o21,convk_o22,convk_o23,convk_o30,convk_o31,convk_o32,convk_o33); 
h4: vector_conv port map(plain_txt,convp_o00,convp_o01,convp_o02,convp_o03,convp_o10,convp_o11,convp_o12,convp_o13,convp_o20,convp_o21,convp_o22,convp_o23,convp_o30,convp_o31,convp_o32,convp_o33); 
h5: matrix_mul port map(convp_o00,convp_o01,convp_o02,convp_o03,convp_o10,convp_o11,convp_o12,convp_o13,convp_o20,convp_o21,convp_o22,convp_o23,convp_o30,convp_o31,convp_o32,convp_o33,convk_o00,convk_o01,convk_o02,convk_o03,convk_o10,convk_o11,convk_o12,convk_o13,convk_o20,convk_o21,convk_o22,convk_o23,convk_o30,convk_o31,convk_o32,convk_o33,mat_out0,mat_out1,mat_out2,mat_out3,mat_out4,mat_out5,mat_out6,mat_out7,mat_out8,mat_out9,mat_out10,mat_out11,mat_out12,mat_out13,mat_out14,mat_out15);
h6: stir_op port map(mat_out0,mat_out1,mat_out2,mat_out3,mat_out4,mat_out5,mat_out6,mat_out7,mat_out8,mat_out9,mat_out10,mat_out11,mat_out12,mat_out13,mat_out14,mat_out15,stir_o00,stir_o01,stir_o02,stir_o03,stir_o10,stir_o11,stir_o12,stir_o13,stir_o20,stir_o21,stir_o22,stir_o23,stir_o30,stir_o31,stir_o32,stir_o33);
h7: xor_op port map(stir_o00,stir_o01,stir_o02,stir_o03,stir_o10,stir_o11,stir_o12,stir_o13,stir_o20,stir_o21,stir_o22,stir_o23,stir_o30,stir_o31,stir_o32,stir_o33,convk_o00,convk_o01,convk_o02,convk_o03,convk_o10,convk_o11,convk_o12,convk_o13,convk_o20,convk_o21,convk_o22,convk_o23,convk_o30,convk_o31,convk_o32,convk_o33,xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33);



h8: vector_conv port map(sk2,convk1_o00,convk1_o01,convk1_o02,convk1_o03,convk1_o10,convk1_o11,convk1_o12,convk1_o13,convk1_o20,convk1_o21,convk1_o22,convk1_o23,convk1_o30,convk1_o31,convk1_o32,convk1_o33);
h9: matrix_mul port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,convk1_o00,convk1_o01,convk1_o02,convk1_o03,convk1_o10,convk1_o11,convk1_o12,convk1_o13,convk1_o20,convk1_o21,convk1_o22,convk1_o23,convk1_o30,convk1_o31,convk1_o32,convk1_o33,mat1_out0,mat1_out1,mat1_out2,mat1_out3,mat1_out4,mat1_out5,mat1_out6,mat1_out7,mat1_out8,mat1_out9,mat1_out10,mat1_out11,mat1_out12,mat1_out13,mat1_out14,mat1_out15);
h10: stir_op port map(mat1_out0,mat1_out1,mat1_out2,mat1_out3,mat1_out4,mat1_out5,mat1_out6,mat1_out7,mat1_out8,mat1_out9,mat1_out10,mat1_out11,mat1_out12,mat1_out13,mat1_out14,mat1_out15,stir1_o00,stir1_o01,stir1_o02,stir1_o03,stir1_o10,stir1_o11,stir1_o12,stir1_o13,stir1_o20,stir1_o21,stir1_o22,stir1_o23,stir1_o30,stir1_o31,stir1_o32,stir1_o33);
h11: xor_op port map(stir1_o00,stir1_o01,stir1_o02,stir1_o03,stir1_o10,stir1_o11,stir1_o12,stir1_o13,stir1_o20,stir1_o21,stir1_o22,stir1_o23,stir1_o30,stir1_o31,stir1_o32,stir1_o33,convk1_o00,convk1_o01,convk1_o02,convk1_o03,convk1_o10,convk1_o11,convk1_o12,convk1_o13,convk1_o20,convk1_o21,convk1_o22,convk1_o23,convk1_o30,convk1_o31,convk1_o32,convk1_o33);



h12: vector_conv port map(sk2,convk2_o00,convk2_o01,convk2_o02,convk2_o03,convk2_o10,convk2_o11,convk2_o12,convk2_o13,convk2_o20,convk2_o21,convk2_o22,convk2_o23,convk2_o30,convk2_o31,convk2_o32,convk2_o33);
h13: matrix_mul port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,convk2_o00,convk2_o01,convk2_o02,convk2_o03,convk2_o10,convk2_o11,convk2_o12,convk2_o13,convk2_o20,convk2_o21,convk2_o22,convk2_o23,convk2_o30,convk2_o31,convk2_o32,convk2_o33,mat2_out0,mat2_out1,mat2_out2,mat2_out3,mat2_out4,mat2_out5,mat2_out6,mat2_out7,mat2_out8,mat2_out9,mat2_out10,mat2_out11,mat2_out12,mat2_out13,mat2_out14,mat2_out15);
h14: stir_op port map(mat2_out0,mat2_out1,mat2_out2,mat2_out3,mat2_out4,mat2_out5,mat2_out6,mat2_out7,mat2_out8,mat2_out9,mat2_out10,mat2_out11,mat2_out12,mat2_out13,mat2_out14,mat2_out15,stir2_o00,stir2_o01,stir2_o02,stir2_o03,stir2_o10,stir2_o11,stir2_o12,stir2_o13,stir2_o20,stir2_o21,stir2_o22,stir2_o23,stir2_o30,stir2_o31,stir2_o32,stir2_o33);
h15: xor_op port map(stir2_o00,stir2_o01,stir2_o02,stir2_o03,stir2_o10,stir2_o11,stir2_o12,stir2_o13,stir2_o20,stir2_o21,stir2_o22,stir2_o23,stir2_o30,stir2_o31,stir2_o32,stir2_o33,convk1_o00,convk1_o01,convk1_o02,convk1_o03,convk1_o10,convk1_o11,convk1_o12,convk1_o13,convk1_o20,convk1_o21,convk1_o22,convk1_o23,convk1_o30,convk1_o31,convk1_o32,convk1_o33);



h16: vector_conv port map(sk4,convk3_o00,convk3_o01,convk3_o02,convk3_o03,convk3_o10,convk3_o11,convk3_o12,convk3_o13,convk3_o20,convk3_o21,convk3_o22,convk3_o23,convk3_o30,convk3_o31,convk3_o32,convk3_o33);
h17: matrix_mul port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,convk3_o00,convk3_o01,convk3_o02,convk3_o03,convk3_o10,convk3_o11,convk3_o12,convk3_o13,convk3_o20,convk3_o21,convk3_o22,convk3_o23,convk3_o30,convk3_o31,convk3_o32,convk3_o33,mat3_out0,mat3_out1,mat3_out2,mat3_out3,mat3_out4,mat3_out5,mat3_out6,mat3_out7,mat3_out8,mat3_out9,mat3_out10,mat3_out11,mat3_out12,mat3_out13,mat3_out14,mat3_out15);
h18: stir_op port map(mat3_out0,mat3_out1,mat3_out2,mat3_out3,mat3_out4,mat3_out5,mat3_out6,mat3_out7,mat3_out8,mat3_out9,mat3_out10,mat3_out11,mat3_out12,mat3_out13,mat3_out14,mat3_out15,stir3_o00,stir3_o01,stir3_o02,stir3_o03,stir3_o10,stir3_o11,stir3_o12,stir3_o13,stir3_o20,stir3_o21,stir3_o22,stir3_o23,stir3_o30,stir3_o31,stir3_o32,stir3_o33);
h19: xor_op port map(stir3_o00,stir3_o01,stir3_o02,stir3_o03,stir3_o10,stir3_o11,stir3_o12,stir3_o13,stir3_o20,stir3_o21,stir3_o22,stir3_o23,stir3_o30,stir3_o31,stir3_o32,stir3_o33,convk3_o00,convk3_o01,convk3_o02,convk3_o03,convk3_o10,convk3_o11,convk3_o12,convk3_o13,convk3_o20,convk3_o21,convk3_o22,convk3_o23,convk3_o30,convk3_o31,convk3_o32,convk3_o33);

h20: vector_conv port map(sk5,convk4_o00,convk4_o01,convk4_o02,convk4_o03,convk4_o10,convk4_o11,convk4_o12,convk4_o13,convk4_o20,convk4_o21,convk4_o22,convk4_o23,convk4_o30,convk4_o31,convk4_o32,convk4_o33);
h21: matrix_mul port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,convk4_o00,convk4_o01,convk4_o02,convk4_o03,convk4_o10,convk4_o11,convk4_o12,convk4_o13,convk4_o20,convk4_o21,convk4_o22,convk4_o23,convk4_o30,convk4_o31,convk4_o32,convk4_o33,mat4_out0,mat4_out1,mat4_out2,mat4_out3,mat4_out4,mat4_out5,mat4_out6,mat4_out7,mat4_out8,mat4_out9,mat4_out10,mat4_out11,mat4_out12,mat4_out13,mat5_out14,mat4_out15);
h22: stir_op port map(mat4_out0,mat4_out1,mat4_out2,mat4_out3,mat4_out4,mat4_out5,mat4_out6,mat4_out7,mat4_out8,mat4_out9,mat4_out10,mat4_out11,mat4_out12,mat4_out13,mat5_out14,mat4_out15,stir4_o00,stir4_o01,stir4_o02,stir4_o03,stir4_o10,stir4_o11,stir4_o12,stir4_o13,stir4_o20,stir4_o21,stir4_o22,stir4_o23,stir4_o30,stir4_o31,stir4_o32,stir4_o33);
h23: xor_op port map(stir4_o00,stir4_o01,stir4_o02,stir4_o03,stir4_o10,stir4_o11,stir4_o12,stir4_o13,stir4_o20,stir4_o21,stir4_o22,stir4_o23,stir4_o30,stir4_o31,stir4_o32,stir4_o33,convk4_o00,convk4_o01,convk4_o02,convk4_o03,convk4_o10,convk4_o11,convk4_o12,convk4_o13,convk4_o20,convk4_o21,convk4_o22,convk4_o23,convk4_o30,convk4_o31,convk4_o32,convk4_o33);

h24: vector_conv port map(sk6,convk5_o00,convk5_o01,convk5_o02,convk5_o03,convk5_o10,convk5_o11,convk5_o12,convk5_o13,convk5_o20,convk5_o21,convk5_o22,convk5_o23,convk5_o30,convk5_o31,convk5_o32,convk5_o33);
h25: matrix_mul port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,convk5_o00,convk5_o01,convk5_o02,convk5_o03,convk5_o10,convk5_o11,convk5_o12,convk5_o13,convk5_o20,convk5_o21,convk5_o22,convk5_o23,convk5_o30,convk5_o31,convk5_o32,convk5_o33,mat5_out0,mat5_out1,mat5_out2,mat5_out3,mat5_out4,mat5_out5,mat5_out6,mat5_out7,mat5_out8,mat5_out9,mat5_out10,mat5_out11,mat5_out12,mat5_out13,mat5_out14,mat5_out15);
h26: stir_op port map(mat5_out0,mat5_out1,mat5_out2,mat5_out3,mat5_out4,mat5_out5,mat5_out6,mat5_out7,mat5_out8,mat5_out9,mat5_out10,mat5_out11,mat5_out12,mat5_out13,mat5_out14,mat5_out15,stir5_o00,stir5_o01,stir5_o02,stir5_o03,stir5_o10,stir5_o11,stir5_o12,stir5_o13,stir5_o20,stir5_o21,stir5_o22,stir5_o23,stir5_o30,stir5_o31,stir5_o32,stir5_o33);
h27: xor_op port map(stir5_o00,stir5_o01,stir5_o02,stir5_o03,stir5_o10,stir5_o11,stir5_o12,stir5_o13,stir5_o20,stir5_o21,stir5_o22,stir5_o23,stir5_o30,stir5_o31,stir5_o32,stir5_o33,convk5_o00,convk5_o01,convk5_o02,convk5_o03,convk5_o10,convk5_o11,convk5_o12,convk5_o13,convk5_o20,convk5_o21,convk5_o22,convk5_o23,convk5_o30,convk5_o31,convk5_o32,convk5_o33);

h28: vector_conv port map(sk7,convk6_o00,convk6_o01,convk6_o02,convk6_o03,convk6_o10,convk6_o11,convk6_o12,convk6_o13,convk6_o20,convk6_o21,convk6_o22,convk6_o23,convk6_o30,convk6_o31,convk6_o32,convk6_o33);
h29: matrix_mul port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,convk6_o00,convk6_o01,convk6_o02,convk6_o03,convk6_o10,convk6_o11,convk6_o12,convk6_o13,convk6_o20,convk6_o21,convk6_o22,convk6_o23,convk6_o30,convk6_o31,convk6_o32,convk6_o33,mat6_out0,mat6_out1,mat6_out2,mat6_out3,mat6_out4,mat6_out5,mat6_out6,mat6_out7,mat6_out8,mat6_out9,mat6_out10,mat6_out11,mat6_out12,mat6_out13,mat6_out14,mat6_out15);
h30: stir_op port map(mat6_out0,mat6_out1,mat6_out2,mat6_out3,mat6_out4,mat6_out5,mat6_out6,mat6_out7,mat6_out8,mat6_out9,mat6_out10,mat6_out11,mat6_out12,mat6_out13,mat6_out14,mat6_out15,stir6_o00,stir6_o01,stir6_o02,stir6_o03,stir6_o10,stir6_o11,stir6_o12,stir6_o13,stir6_o20,stir6_o21,stir6_o22,stir6_o23,stir4_o30,stir6_o31,stir6_o32,stir6_o33);
h31: xor_op port map(stir6_o00,stir6_o01,stir6_o02,stir6_o03,stir6_o10,stir6_o11,stir6_o12,stir6_o13,stir6_o20,stir6_o21,stir6_o22,stir6_o23,stir4_o30,stir6_o31,stir6_o32,stir6_o33,convk6_o00,convk6_o01,convk6_o02,convk6_o03,convk6_o10,convk6_o11,convk6_o12,convk6_o13,convk6_o20,convk6_o21,convk6_o22,convk6_o23,convk6_o30,convk6_o31,convk6_o32,convk6_o33);

h32: vector_conv port map(sk8,convk7_o00,convk7_o01,convk7_o02,convk7_o03,convk7_o10,convk7_o11,convk7_o12,convk7_o13,convk7_o20,convk7_o21,convk7_o22,convk7_o23,convk7_o30,convk7_o31,convk7_o32,convk7_o33);
h33: matrix_mul port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,convk7_o00,convk7_o01,convk7_o02,convk7_o03,convk7_o10,convk7_o11,convk7_o12,convk7_o13,convk7_o20,convk7_o21,convk7_o22,convk7_o23,convk7_o30,convk7_o31,convk7_o32,convk7_o33,mat7_out0,mat7_out1,mat7_out2,mat7_out3,mat7_out4,mat7_out5,mat7_out6,mat7_out7,mat7_out8,mat7_out9,mat7_out10,mat7_out11,mat7_out12,mat7_out13,mat7_out14,mat7_out15);
h34: stir_op port map(mat7_out0,mat7_out1,mat7_out2,mat7_out3,mat7_out4,mat7_out5,mat7_out6,mat7_out7,mat7_out8,mat7_out9,mat7_out10,mat7_out11,mat7_out12,mat7_out13,mat7_out14,mat7_out15,stir7_o00,stir7_o01,stir7_o02,stir7_o03,stir7_o10,stir7_o11,stir7_o12,stir7_o13,stir7_o20,stir7_o21,stir7_o22,stir7_o23,stir7_o30,stir7_o31,stir7_o32,stir7_o33);
h35: xor_op port map(stir7_o00,stir7_o01,stir7_o02,stir7_o03,stir7_o10,stir7_o11,stir7_o12,stir7_o13,stir7_o20,stir7_o21,stir7_o22,stir7_o23,stir7_o30,stir7_o31,stir7_o32,stir7_o33,convk7_o00,convk7_o01,convk7_o02,convk7_o03,convk7_o10,convk7_o11,convk7_o12,convk7_o13,convk7_o20,convk7_o21,convk7_o22,convk7_o23,convk7_o30,convk7_o31,convk7_o32,convk7_o33);

h36:cipher_text port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,cipher_text1);


h37:cipher_text port map(xor_o00,xor_o01,xor_o02,xor_o03,xor_o10,xor_o11,xor_o12,xor_o13,xor_o20,xor_o21,xor_o22,xor_o23,xor_o30,xor_o31,xor_o32,xor_o33,cipher_text3);
cipher<=cipher_text3;
end;

