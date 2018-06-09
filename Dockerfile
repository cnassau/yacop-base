ARG SAGE_VERSION
FROM sagemath/sagemath:$SAGE_VERSION

LABEL maintainer="Christian Nassau <nassau@nullhomotopie.de>"

USER root
RUN apt-get install -y make libx11-dev

USER sage
ENV HOME /home/sage
WORKDIR /home/sage
ADD --chown=sage yacop-base /tmp/yacop-base
RUN echo "Installing the Steenrod library and its dependencies" \
    && cd /tmp/yacop-base && sage -sh spkg-install \
    && echo "Starting Sage once" && echo "quit();" | sage \
    && echo "Cleaning up" \
    && rm -rf /tmp/* \
    && sync 

ENTRYPOINT [ "sage-entrypoint" ]
CMD [ "sage" ]
