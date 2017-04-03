function [ transFunct ] = ex2_trasferfunct( R1, R2, L1, L2, L3 )
% Esta função deve receber os valores de componentes de certo circuito e
% retornará sua função de transferência

    syms V
    syms I1 I2 I3
    syms S
    
    A = [ R1+S*L1 -S*L1 -R1; ...
          -S*L1 S*L1+S*L3+R2 -R2;...
          -R1 -R2 R1+R2+S*L2     ];
  
    B = [ V; 0; 0 ];
    
    I = A\B;
    
    I3 = simplify( I(3) );
    
    V3 = I3 * S * L3;
    
    H = V3/V;
    
    [nH, dH] = numden(H);
    
    HtransN = sym2poly(nH);
    HtransD = sym2poly(dH);
    
    transFunct = tf( HtransN, HtransD, 'InputName','Tensão V(S)',...
        'OutputName', 'Tensão em L3' );
    
    %Reference: https://www.mathworks.com/matlabcentral/answers/131113-how-to-extract-transfer-function-coefficient-from-symbolic-functions

end

