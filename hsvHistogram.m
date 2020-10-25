function [sol] = hsvHistogram(path_to_image, count_bins)

  A = imread(path_to_image);

  #Determin matricele H, S si V cu functia implementata
  [H S V] = RGB_to_HSV(A);

  H = H(:);

  S = S(:);

  V = V(:);
  
  #Construiesc histogramele si le concatenez
  step = 1.01 / count_bins;
  bins = 0 : step : 1.01;
  
  histH = histc (H, bins)';

  histS = histc (S, bins)';

  histV = histc (V, bins)';

  sol = [histH(1 : count_bins) histS(1 : count_bins) histV(1 : count_bins)];

endfunction
