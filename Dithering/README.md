# Floyd–Steinberg Dithering
Floyd–Steinberg dithering is an image dithering algorithm first published in 1976 by Robert W. Floyd and Louis Steinberg. It is commonly used by image manipulation software, for example when an image is converted into GIF format that is restricted to a maximum of 256 colors.

The algorithm achieves dithering using error diffusion, meaning it pushes (adds) the residual quantization error of a pixel onto its neighboring pixels, to be dealt with later.

This code was inspired by Dan Shiffman (find him here : https://github.com/shiffman)
## Requirements
  Processing
## Sample
The image on the left is the source and the image on the right is after processing with this technique.
![alt text](reference.png)
