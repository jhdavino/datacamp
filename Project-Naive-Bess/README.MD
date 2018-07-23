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

# Images as Arrays of Data

# Explore the Color Channels

# Honey Bess and Bumble Bees

# Simplify, Simplify, Simplify

# Save You Work

# Make a Pipeline

# Research:

# Reference:
