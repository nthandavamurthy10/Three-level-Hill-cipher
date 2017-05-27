LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.mat.all;
use ieee.numeric_std.all;

entity mul_test is
port(a:in std_logic_vector(127 downto 0);
     b:in  std_logic_vector(127 downto 0);
     stir_i0 : out std_logic_vector(7 downto 0);
     stir_i1 : out std_logic_vector(7 downto 0);
     stir_i2 : out std_logic_vector(7 downto 0);
     stir_i3 : out std_logic_vector(7 downto 0);

     stir_i4 : out std_logic_vector(7 downto 0);
     stir_i5 : out std_logic_vector(7 downto 0);
     stir_i6 : out std_logic_vector(7 downto 0);
     stir_i7 : out std_logic_vector(7 downto 0);

     stir_i8 : out std_logic_vector(7 downto 0);
     stir_i9 : out std_logic_vector(7 downto 0);
     stir_i10 : out std_logic_vector(7 downto 0);
     stir_i11 : out std_logic_vector(7 downto 0);

     stir_i12: out std_logic_vector(7 downto 0);
     stir_i13 : out std_logic_vector(7 downto 0);
     stir_i14 : out std_logic_vector(7 downto 0);
     stir_i15 : out std_logic_vector(7 downto 0));
end mul_test;
architecture structure of mul_test is 
component matrix_mul is
port(plain_text1 :in std_logic_vector(127 downto 0);
     key :in std_logic_vector(127 downto 0);
     stir_in0 : out std_logic_vector(7 downto 0);
     stir_in1 : out std_logic_vector(7 downto 0);
     stir_in2 : out std_logic_vector(7 downto 0);
     stir_in3 : out std_logic_vector(7 downto 0);

     stir_in4 : out std_logic_vector(7 downto 0);
     stir_in5 : out std_logic_vector(7 downto 0);
     stir_in6 : out std_logic_vector(7 downto 0);
     stir_in7 : out std_logic_vector(7 downto 0);

     stir_in8 : out std_logic_vector(7 downto 0);
     stir_in9 : out std_logic_vector(7 downto 0);
     stir_in10 : out std_logic_vector(7 downto 0);
     stir_in11 : out std_logic_vector(7 downto 0);

     stir_in12: out std_logic_vector(7 downto 0);
     stir_in13 : out std_logic_vector(7 downto 0);
     stir_in14 : out std_logic_vector(7 downto 0);
     stir_in15 : out std_logic_vector(7 downto 0));
end component;
signal pt_out:matrix;
signal ct_out:matrix;
signal m_out:matrix;
signal matin1:matrix;
signal matin2:matrix;
begin
u3: matrix_mul port map(a,b,stir_i0,stir_i1,stir_i2,stir_i3,stir_i4,stir_i5,stir_i6,stir_i7,stir_i8,stir_i9,stir_i10,stir_i11,stir_i12,stir_i13,stir_i14,stir_i15);
end;