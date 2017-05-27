LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity matrix_mul is
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
     stir_in10 :inout std_logic_vector(7 downto 0);
     stir_in11 : inout std_logic_vector(7 downto 0);

     stir_in12: inout std_logic_vector(7 downto 0);
     stir_in13 : inout std_logic_vector(7 downto 0);
     stir_in14 : inout std_logic_vector(7 downto 0);
     stir_in15 : inout std_logic_vector(7 downto 0));
end matrix_mul;

architecture behavioral of matrix_mul is
begin
process(in_pt00,in_pt01,in_pt02,in_pt03,in_pt10,in_pt11,in_pt12,in_pt13,in_pt20,in_pt21,in_pt22,in_pt23,in_pt30,in_pt31,in_pt32,in_pt33,in_key00,in_key01,in_key02,in_key03,in_key10,in_key11,in_key12,in_key13,in_key20,in_key21,in_key22,in_key23,in_key30,in_key31,in_key32,in_key33)
begin
stir_in0<=((in_pt00 and in_key00) xor (in_pt01 and in_key10) xor (in_pt02 and in_key20) xor (in_pt03 and in_key30));
stir_in1<=((in_pt00 and in_key01) xor (in_pt01 and in_key11) xor (in_pt02 and in_key21) xor (in_pt03 and in_key31));
stir_in2<=((in_pt00 and in_key02) xor (in_pt01 and in_key12) xor (in_pt02 and in_key22) xor (in_pt03 and in_key32));
stir_in3<=((in_pt00 and in_key03) xor (in_pt01 and in_key13) xor (in_pt02 and in_key23) xor (in_pt03 and in_key33));

stir_in4<=((in_pt10 and in_key00) xor (in_pt11 and in_key10) xor (in_pt12 and in_key20) xor (in_pt13 and in_key30));
stir_in5<=((in_pt10 and in_key01) xor (in_pt11 and in_key11) xor (in_pt12 and in_key21) xor (in_pt13 and in_key31));
stir_in6<=((in_pt10 and in_key02) xor (in_pt11 and in_key12) xor (in_pt12 and in_key22) xor (in_pt13 and in_key32));
stir_in7<=((in_pt10 and in_key03) xor (in_pt11 and in_key13) xor (in_pt12 and in_key23) xor (in_pt13 and in_key33));

stir_in8<=((in_pt20 and in_key00) xor (in_pt21 and in_key10) xor (in_pt22 and in_key20) xor (in_pt23 and in_key30));
stir_in9<=((in_pt20 and in_key01) xor (in_pt21 and in_key11) xor (in_pt22 and in_key21) xor (in_pt23 and in_key31));
stir_in10<=((in_pt20 and in_key02) xor (in_pt21 and in_key12) xor (in_pt22 and in_key22) xor (in_pt23 and in_key32));
stir_in11<=((in_pt20 and in_key03) xor (in_pt21 and in_key13) xor (in_pt22 and in_key23) xor (in_pt23 and in_key33));

stir_in12<=((in_pt30 and in_key00) xor (in_pt31 and in_key10) xor (in_pt32 and in_key20) xor (in_pt33 and in_key30));
stir_in13<=((in_pt30 and in_key01) xor (in_pt31 and in_key11) xor (in_pt32 and in_key21) xor (in_pt33 and in_key31));
stir_in14<=((in_pt30 and in_key02) xor (in_pt31 and in_key12) xor (in_pt32 and in_key22) xor (in_pt33 and in_key32));
stir_in15<=((in_pt30 and in_key03) xor (in_pt31 and in_key13) xor (in_pt32 and in_key23) xor (in_pt33 and in_key33));
end process;
end;