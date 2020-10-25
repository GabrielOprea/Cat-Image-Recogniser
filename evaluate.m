function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)

  cat_set = strcat (path_to_testset, "cats/");
  nocat_set = strcat (path_to_testset,"not_cats/");

  cat_img = getImgNames (cat_set);
  nocat_img = getImgNames (nocat_set);

  #determin calea catre fiecare poza
  cat_path = strcat (cat_set,cat_img(:,:));
  nocat_path = strcat (nocat_set,nocat_img(:,:));

  n = size (cat_img, 1);
  m = size (nocat_img, 1);

  nr_total = n + m;
  nr_corect = 0;

  #Tratez fiecare histograma separat
  if histogram == 'RGB'
    for i = 1:n 
      #Obtin histogramele si le concatenez o valoare de 1
      x = rgbHistogram (cat_path(i,:), count_bins)';
      x(size (x,1)+1) = 1;
      #Verific
      val = w' * x;
      #Daca val indica o poza cu pisica, inseamna ca algortimul are dreptate
      if val > 0
        nr_corect = nr_corect + 1;
      endif
    endfor
    
    #Acum iterez prin pozele fara pisici
    for i = 1:m 
      x = rgbHistogram (nocat_path(i,:), count_bins)';
      x(size (x,1)+1) = 1;
      val = w' * x;
      #Daca val < 0, atunci nu este o poza cu pisica, deci este corect
      if val < 0
        nr_corect = nr_corect + 1;
      endif
    endfor
  endif

  #Analog pentru HSV
  if histogram == 'HSV'
    for i = 1:n 
      x = hsvHistogram (cat_path(i,:), count_bins)';
      x(size (x,1)+1) = 1;
      val = w' * x;
      if val > 0
        nr_corect = nr_corect + 1;
      endif
    endfor
    
    for i = 1:m 
      x = hsvHistogram (nocat_path(i,:), count_bins)';
      x(size (x,1)+1) = 1;
      val = w' * x;
      if val < 0
        nr_corect = nr_corect + 1;
      endif
    endfor
  endif

  percentage = nr_corect / nr_total;

endfunction
