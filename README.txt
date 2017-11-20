0. checkout this repo
   git clone --recursive https://github.com/Stensal/webapp

   or

   git clone --recursive https://github.com/Stensal/webapp
   git submodule init
   git submodule update
      

1. install the webapp
   cd installation
   ./install.sh

2. run the web app, this is tested on Debian 8.
   cd installation
   docker-compose up

3.  access the webapps
   a. the whole webapp
      https://localhost 
   
   b. the cppcms webapp
      https://localhost:3500

   c. the php webapp
      https://localhost:4500
