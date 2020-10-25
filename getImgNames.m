function [ imgs ]  = getImgNames(directory)
	path_to_imgs = strcat( directory,  '*jpg');
    
    % obtine toate pozele
	img_files = dir(path_to_imgs);
	
	% numarul de imagini
	n = length(img_files);
	
	% lungimea numelui unui fisier
	D = 1:10;
	imgs(1:n, D) = 0;

	for i = 1:n
		l = 1:length(img_files(i).name);
		imgs(i, l) = img_files(i).name;
	end

	imgs = char(imgs);
end