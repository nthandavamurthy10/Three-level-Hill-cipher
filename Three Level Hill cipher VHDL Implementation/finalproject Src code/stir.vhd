LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
Package mat is
type matrix is array (3 downto 0,3 downto 0) of std_logic_vector(7 downto 0);
end mat;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.mat.all;
use ieee.numeric_std.all;


entity stir is 
port(mul_res:in matrix;
     stir_out0:inout std_logic_vector(7 downto 0);
     stir_out1:inout std_logic_vector(7 downto 0);
     stir_out2:inout std_logic_vector(7 downto 0);
     stir_out3:inout std_logic_vector(7 downto 0);
     stir_out4:inout std_logic_vector(7 downto 0);
     stir_out5:inout std_logic_vector(7 downto 0);
     stir_out6:inout std_logic_vector(7 downto 0);
     stir_out7:inout std_logic_vector(7 downto 0);
     stir_out8:inout std_logic_vector(7 downto 0);
     stir_out9:inout std_logic_vector(7 downto 0);
     stir_out10:inout std_logic_vector(7 downto 0);
     stir_out11:inout std_logic_vector(7 downto 0);
     stir_out12:inout std_logic_vector(7 downto 0);
     stir_out13:inout std_logic_vector(7 downto 0);
     stir_out14:inout std_logic_vector(7 downto 0);
     stir_out15:inout std_logic_vector(7 downto 0));     
end stir;

architecture behavioral of stir is
begin 
process(mul_res)
begin
  
stir_out0 <= mul_res(0,0);
stir_out1 <= mul_res(0,1);
stir_out2 <= mul_res(0,2);
stir_out3 <= mul_res(0,3);

stir_out4 <= mul_res(1,0);
stir_out5 <= mul_res(1,1);
stir_out6 <= mul_res(1,2);
stir_out7 <= mul_res(1,3);

stir_out8 <= mul_res(2,0);
stir_out9 <= mul_res(2,1);
stir_out10 <= mul_res(2,2);
stir_out11 <= mul_res(2,3);

stir_out12 <= mul_res(3,0);
stir_out13 <= mul_res(3,1);
stir_out14 <= mul_res(3,2);
stir_out15 <= mul_res(3,3);

end process;

end;
