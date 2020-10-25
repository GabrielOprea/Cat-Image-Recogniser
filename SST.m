function X = SST (A, b)
  
  [n n] = size(A);
  for i = n:-1:1
    s = 0;
    
    for j = i+1:n
      s = s + A(i,j)*X(j);
    endfor
    
    X(i) = (b(i) - s)/A(i,i);
  endfor
  
  X = X';
endfunction