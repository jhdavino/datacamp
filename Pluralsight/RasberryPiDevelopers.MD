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
- GP pins can send and receive data using using [high|low] voltage states.
- Just look up the pins diagram.
- A Breadboard is used for playing with circuits and prototyping.
- The most popular open source library to control hardware is called **wiringpi**
- You can install it with:
`git clone git://git.drogon.net/wiringpi && cd wiringpi && ./build`
- You can then use gpio on the console.
```bash
gpio mode 0 output
gpio write 0 1
gpio write 0 0
```
- To access with with Python, you can import RPi.GPIO package.
- The format is pretty simple:
```python
channel = 7 # set channel for communication over.
GPIO.setmode( GPIO.BOARD)
GPIO.setup( channel, GPIO.OUT )
GPIO.output( channel, GPIO.HIGH )
GPIO.output( channel, GPIO.LOW)
GPIO.cleanup()
```
- Arduino is another older hardware platform for control and coding.
- You can use them in tandem to increase the power.

# Rasberry Pi as a Webserver
- Why use it as a web server?
- Sharing data, hardware sharing, etc.
- Exposing a web server is the easiest way to access data.
- nginx is the current favorite small web server.
- It supports ARM architecture.
- It doesn't allow you to customize or code with, but it does allow you to run the service on another port.
- You need to run nginx as root.
- Dynamic content can be forwarded to via nginx.
- You can spin up a local server with python using `python -m CGIHTTPServer 8000`.
- *cgi-bin* is the default folder for cgi files.
- Make sure to tell bash what the interpreter is by having `#!/usr/bin/python` as the first line.
- Make sure the file has execute permissions.
```python
#httpserver.py
import http.server
import sys

Handler = http.server.CGIHTTPRequestHandler
PORT = 8002

httpd = http.server.HTTPServer( ("", PORT), Handler)
httpd.serve_forever()
print( 'server is up and running...')
```
- You might need to build it yourself.
- Start with `sudo apt-get git-core build-essential`
- Run this when you don't need your computer for anything:
```bash
git clone https://github.com/joyent/node.git
cd node
git checkout v<insert_yours_here>
./configure
make
sudo make install
```

# Rasberry Pi as a DVR
- XBMC is the defacto standard; now it's really plex.
- You can get it via purchase it, download it, or compile from source.
- Besides that it's open source, but you can extend it via add-ons in python.


# Research:
- What is tightvncserver?
- KVM switch?
- CGI
-

# Reference:
