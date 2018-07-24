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

# Save You Work

# Make a Pipeline

# Research:

# Reference:
