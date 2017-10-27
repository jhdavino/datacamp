# Rasberry Pi for Developers
## Jon Flanders

# Introduction to Rasberry Pi
- It's a compuer.
- Small.
- It's:
  1. Powerful
  2. Inexpensive
- Multiple Versions.
- Intended to run Linux.
- **Default** disto is rasbpian, but others work; I'm using Arch.
- **Scratch** is a visual programming language that should come with it.
- **IDLE** is on there as well, but I'm ssh'ing into it so I wont be using that.
- You can also C/C++ since it's on linux; I will also be using Elixir.
- **General Purpose Output Ports** GP IOs.
- You can send signals to control external hardware using these.
- You can do "lots of stuff" with it.
- Path:
  1. Buy it, duh.
  2. Copy OS Image onto SD card.
  3. Hook up Peripherals.
  4. Power Up!
- `ssh <ip> -l <username>`.
- `sudo apt-get install tightvncserver`.
- Open a windows session using `sudo vncserver :1`.
- Then, use a RealVNC to connect to it.
- Or, an Open Source version called VNC Viewer.


# Programming the Rasberry Pi
- There are a lots of choices for coding:
  1. Scratch
  2. Python.
- Skipping lectures about Python; I have tons of knowledge about this already.
```python
# Note that I didn't copy this correctly and wont run properly.

import http.client
import json

c = http.client.HTTPConnection( <url> )
c.request( 'GET', '/search.json?q=Pluralsight')
r = c.getresponse()
data = r.read()
dataString  = str(data, 'utf8')
o = json.loads(dataString)
tweets = o['results']

for tweet in tweets:
  print(tweet['text'])
```
- To work the GPIO you might need to install RPi.GPIO package.
- We're going to be using TKinter since it's the default, but should really use Qt since it's better.
- You can write C code and and then write wrappers around it for Python to use.
- You can also just use bash, the default shell for Linux.



# Rasberry Pi and Hardware

# Rasberry Pi as a Webserver

# Rasberry Pi as a DVR

# Research:
- What is tightvncserver?
- KVM switch?



# Reference:
