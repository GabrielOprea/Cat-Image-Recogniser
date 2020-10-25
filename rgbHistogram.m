function [sol] = rgbHistogram(path_to_image, count_bins)
  
  A = imread(path_to_image); #citesc matricea tridimensionala a imaginii
  
  R = A(:, :, 1);
  R = R(:);
  
  G = A(:, :, 2);
  G = G(:);
  
  B = A(:, :, 3);
  B = B(:);
  
  #determin subintervalele bins-urilor
  step = 256 / count_bins;
  bins = 0 : step : 256;
  
  histR = histc (R, bins)';
  histG = histc (G, bins)';
  histB = histc (B, bins)';
  
  #concatenez histogramele intr-una singura
  sol = [histR(1 : count_bins) histG(1 : count_bins) histB(1 : count_bins)];
  sol = [histR(1 : count_bins) histG(1 : count_bins) histB(1 : count_bins)];
  
endfunction