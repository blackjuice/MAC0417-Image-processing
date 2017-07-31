##############################
# date: 170722
# name: Lucas Sung Jun Hong
# NUSP: 8124329
#
# Questao 4 - Prova 2
#
# compilation:
# octave 8124329.m
##############################

# segmentManusc receives name of the file without file extension
function segmentManusc (filename)

    # Formatting filename
    f = [filename ".bmp"];

    # Reading image BW(m,n)
    BW = imread(f);

    # Apply Morphology transformations
    #  according to image size, checking min{m,n} < 800
    dim = size(BW);
    min = min(dim(1), dim(2));

    if min < 800
        # Threshold with an arbitrary 0.65 value
        new = im2bw(BW, 0.65);

        # color inversion for better results
        new = imcomplement(new);

        # apply thicker strel length edge of value 20
        SE  = strel('hypercube',2,20);
        
        # Apply tophat
        new = imtophat(new, SE);
    else
        # Threshold with an arbitrary value of 0
        new = im2bw(BW, 0);

        # color inversion for better results
        new = imcomplement(new);

        # apply thicker strel length edge of value 5
        SE  = strel('hypercube',2,5);
        
        # Apply tophat
        new = imtophat(new, SE);
        
        # Apply Dilate
        new = imdilate(new, SE);
    endif

    new = imcomplement(new);

    f = [filename "seg.bmp"];
    imwrite(new, f);
endfunction

for i = 1:10
    filename = int2str(i);
    segmentManusc(filename);
endfor