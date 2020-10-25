function [X, y] = preprocess(path_to_dataset, histogram, count_bins)

  cat_set = strcat (path_to_dataset, "cats/");
  nocat_set = strcat (path_to_dataset,"not_cats/");

  cat_img = getImgNames (cat_set);
  nocat_img = getImgNames (nocat_set);

  cat_path = strcat (cat_set,cat_img(:,:));
  nocat_path = strcat (nocat_set,nocat_img(:,:));

  n = size(cat_img, 1); #nr de poze cu pisici
  m = size(nocat_img, 1); #nr de poze fara pisici

  #completez vectorul coloana y cu 1 pt poze cu pisici, si -1 pt cele fara
  y = zeros(n + m, 1); 
  y(1:n) = 1;
  y(n + 1: n + m) = -1;

  X = zeros(n + m, count_bins * 3);


  #adaug in matricea X fiecare histograma
  if histogram == 'RGB'
    for i = 1 : n
      X(i, :) = rgbHistogram (cat_path(i,:), count_bins);
    endfor
    for i = 1 : m
      X(n + i, :) = rgbHistogram (nocat_path(i,:), count_bins);
    endfor
  endif

  if histogram == 'HSV'
    for i = 1 : n    
      X(i, :) = hsvHistogram (cat_path(i,:), count_bins);
    endfor
    for i = 1 : m
      X(n + i, :) = hsvHistogram (nocat_path(i,:), count_bins);
    endfor
  endif

endfunction
