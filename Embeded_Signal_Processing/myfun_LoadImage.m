function Z = myfun_LoadImage(fname, row, col)
fin = fopen(fname,'r');
I = fread(fin, row*col, 'uint8=>uint8');
Z = reshape(I, row, col);
Z = Z';
end