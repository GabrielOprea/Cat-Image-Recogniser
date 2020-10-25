function [w] = learn(X, y)
  
  Xnew = X;
  [m, n] = size (X);
  
  bias = ones (m, 1);
  Xnew(:,n + 1) = bias;
  
  [Q R] = Householder (Xnew);
  
  w = SST (R, Q' * y);
  
endfunction