from scipy import fftpack
import numpy as np
import pylab as py

img = np.matrix('1 0; 0 1')

# Transform
T = fftpack.fft2(img)

# Insert 0 freq in center
T = fftpack.fftshift(T)
spectra = np.abs(T)**2

# img plot
py.figure(1)
py.clf()
py.imshow(spectra)
py.show()
