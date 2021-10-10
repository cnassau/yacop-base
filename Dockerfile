ARG BASE_IMAGE sagemath/sagemath
FROM $BASE_IMAGE

LABEL maintainer="Christian Nassau <nassau@nullhomotopie.de>"

# X11 + fonts are required to support the chart Tk-GUI

USER root
RUN apt-get install -yq make libx11-dev fontconfig libxrender-dev libxft-dev libfontconfig1-dev libfreetype6-dev okular

USER sage
#ENV HOME /home/sage
#WORKDIR /home/sage
ADD --chown=sage yacop-base /tmp/yacop-base
RUN echo "Installing the Steenrod library and its dependencies" \
    && cd /tmp/yacop-base && sage -sh spkg-install \
    && echo "Starting Sage once" && echo "quit();" | sage \
    && echo "Cleaning up" \
    && rm -rf /tmp/* \
    && sync 

ENTRYPOINT [ "sage-entrypoint" ]
CMD [ "sage" ]
