# Yacop/Base - dependencies for the Yacop/Sage package

Yacop/Sage is a SageMath package that allows you to do homological algebra over the Steenrod algebra. It depends on several external libraries that are installed using this Yacop/Base package. 

These external libraries are:
   - Tcl/Tk 8.6 
   - SQLite (included in the Tcl distribution)
   - Steenrod (see https://github.com/cnassau/steenrod) 
   - BWidgets
   - pdf4tcl
   - Tkynter (a fork of the regular Tkinter package)

The packages are installed as an "old style spkg" using the script "yacop-base/spkg-install". 

The "build.sh" downloads the external libraries from our mirror at https://nullhomotopie.de/yacop-base and triggers a build of the docker image on top of the official https://hub.docker.com/r/sagemath/sagemath/.

An "official" yacop/base image can also be found here: https://hub.docker.com/r/cnassau/yacop-base/
   
