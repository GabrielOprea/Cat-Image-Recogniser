function [H S V] = RGB_to_HSV(A)

  #Scalez matricea tridimensionala
  A = double(A)/255;

  #Extrag fiecare matrice principala
  R = A(:,:,1);
  G = A(:,:,2);
  B = A(:,:,3);

  #Determin dimensiunea unei matrice
  m = size (R, 1);
  n = size (R, 2);

  H = zeros (m,n);
  S = zeros (m,n);
  V = zeros (m,n);

  #Obtin maximul/minimul fiecarui element din cele 3 matrice din A
  Cmax = max (A, [], 3);
  Cmin = min (A, [], 3);   

  #Calculez Delta
  Delta = Cmax - Cmin;
  
  #Vectorizez fiecare operatie pentru timp de executie mai bun
  #Adaug 0 pe pozitiile unde Delta e 0
  H(Delta == 0)=0;

  #Exclud din calcule pozitiile unde Delta e 0, pentru ca deja au fost
  #considerate mai sus
  aux2 = Delta ~= 0;
  
  aux = Cmax == R;
  aux = aux & aux2;
  H(aux) = 60 * mod ((G(aux) - B(aux)) ./ Delta(aux), 6);

  aux = Cmax == G;
  aux = aux & aux2;
  H(aux) = 60 * (((B(aux) - R(aux)) ./ Delta(aux)) + 2);

  aux = Cmax == B;
  aux = aux & aux2;
  H(aux) = 60 * (((R(aux) - G(aux)) ./ Delta(aux)) + 4);      

  #Aplic formulele aferente
  H = H / 360;

  S(Cmax == 0)=0;

  aux = Cmax != 0;
      
  S(aux) = Delta(aux) ./ Cmax(aux);
      
  V = Cmax;
  
endfunction
