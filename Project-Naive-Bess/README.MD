# NAÏVE BEES - Project
##

# Import Python Libraries
```python
# Used to change filepaths
from pathlib import Path

# We set up matplotlib, pandas, and the display function
%matplotlib inline
import matplotlib.pyplot as plt
from IPython.display import display
import pandas as pd

# import numpy to use in this cell
import numpy as np

# import Image from PIL so we can use it later
from PIL import Image

# generate test_data
test_data = np.random.beta( size = [100, 100, 3], a = 1, b = 1)

# display the test_data
plt.imshow(test_data)
```


# Opening Images with PIL
```python
# open the image
img = Image.open('datasets/bee_1.jpg')

# Get the image size
img_size = img.size

print("The image size is: {}".format(img_size))

# Just having the image as the last line in the cell will display it in the notebook
img
```


# Image Manipulation with PIL
```python
# open the image
img = Image.open('datasets/bee_1.jpg')

# Get the image size
img_size = img.size

print("The image size is: {}".format(img_size))

# Just having the image as the last line in the cell will display it in the notebook
img
```

# Images as Arrays of Data
```python
# Turn our image object into a NumPy array
img_data = np.array( img )

# get the shape of the resulting array
img_data_shape = img_data.shape

print("Our NumPy array has the shape: {}".format(img_data_shape))

# plot the data with `imshow`
# ... YOUR CODE FOR TASK 4 ...
plt.imshow(img_data)

# plot the red channel
plt.imshow( img_data[:, :, 0] , cmap=plt.cm.Reds_r)
plt.show()

# plot the green channel
plt.imshow(img_data[:, :, 1], cmap=plt.cm.Greens_r)
plt.show()

# plot the blue channel
plt.imshow(img_data[:, :, 2], cmap=plt.cm.Blues_r)
plt.show()
```


# Explore the Color Channels
```python
def plot_kde(channel, color):
    """ Plots a kernel density estimate for the given data.

        `channel` must be a 2d array
        `color` must be a color string, e.g. 'r', 'g', or 'b'
    """
    data = channel.flatten()
    return pd.Series(data).plot.density(c=color)

# create the list of channels
channels = ['r', 'g', 'b']

def plot_rgb( channels ):
    # use enumerate to loop over colors and indexes
    for ix, color in enumerate(channels):
        # ... YOUR CODE FOR TASK 5 ...
        plot_kde( img_data[:,:,ix], color)
    plt.show()

plot_rgb( channels )
```


# Honey Bess and Bumble Bees
```python
# load bee_12.jpg as honey
# ... YOUR CODE FOR TASK 6 ...
honey = Image.open('datasets/bee_12.jpg')

# display the honey bee image
display( honey )

# NumPy array of the honey bee image data
# ... YOUR CODE FOR TASK 6 ...
honey_data = np.array( honey )


# plot the rgb densities for the honey bee image
plot_rgb( channels )
```


# Simplify, Simplify, Simplify
```python
# load bee_3.jpg as bumble
# ... YOUR CODE FOR TASK 7 ...
bumble = Image.open( 'datasets/bee_3.jpg')


# display the bumble bee image
display( bumble )

# NumPy array of the bumble bee image data
# ... YOUR CODE FOR TASK 7 ...
bumble_data = np.array( bumble )

# plot the rgb densities for the bumble bee image
plot_rgb( channels )

# convert honey to grayscale
honey_bw = honey.convert( "L")
display(honey_bw)

# convert the image to a NumPy array
honey_bw_arr = np.array( honey_bw )

# get the shape of the resulting array
honey_bw_arr_shape = honey_bw_arr.shape
print("Our NumPy array has the shape: {}".format(honey_bw_arr_shape))

# plot the array using matplotlib
plt.imshow(honey_bw_arr, cmap=plt.cm.gray)
plt.show()

# plot the kde of the new black and white array
plot_kde(honey_bw_arr, 'k')
```


# Save You Work
```python
# flip the image left-right with transpose

honey_bw_flip = honey_bw.transpose( Image.FLIP_LEFT_RIGHT )
# show the flipped image
display(honey_bw_flip)

# save the flipped image
# ... YOUR CODE FOR TASK 9 ...
honey_bw_flip.save( "saved_images/bw_flipped.jpg" )

# create higher contrast by reducing range
# ... YOUR CODE FOR TASK 9 ...
honey_hc_arr = np.maximum( honey_bw_arr, 100)

# show the higher contrast version
plt.imshow(honey_hc_arr, cmap=plt.cm.gray)

# convert the NumPy array of high contrast to an Image
# ... YOUR CODE FOR TASK 9 ...

honey_bw_hc = Image.fromarray( honey_hc_arr )

# save the high contrast version
# ... YOUR CODE FOR TASK 9 ...
honey_bw_hc.save( "saved_images/bw_hc.jpg")
```


# Make a Pipeline
```python
image_paths = ['datasets/bee_1.jpg', 'datasets/bee_12.jpg', 'datasets/bee_2.jpg', 'datasets/bee_3.jpg']

def process_image(path):
    img = Image.open(path)

    # create paths to save files to
    bw_path = "saved_images/bw_{}.jpg".format(path.stem)
    rcz_path = "saved_images/rcz_{}.jpg".format(path.stem)

    print("Creating grayscale version of {} and saving to {}.".format(path, bw_path))
    bw = img.convert("L")
    # ... YOUR CODE FOR TASK 10 ...
    bw.save( bw_path )

    print("Creating rotated, cropped, and zoomed version of {} and saving to {}.".format(path, rcz_path))
    rcz = bw.rotate(45).crop([25,25,75,75]).resize((100, 100))
    # ... YOUR CODE FOR TASK 10 ...
    rcz.save( rcz_path )

# for loop over image paths
for img_path in image_paths:
    process_image(Path(img_path))
```


# Research:

# Reference:
