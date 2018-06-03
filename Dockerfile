FROM sagemath/sagemath

LABEL maintainer="Christian Nassau <nassau@nullhomotopie.de>"

ARG SAGE_SRC_TARGET=/opt
# Note: SAGE_BRANCH may also be a tag name
# Note: SAGE_COMMIT should be the sha1 hash of the actual commit we're
# building from--by passing in different values for this argument we
# can invalidate Docker's cache for this image (currently there is a slight
# race condition between this and the install_sage.sh script, but it is not
# terribly important for the purpose of cache invalidation)
ARG SAGE_BRANCH=master
ARG SAGE_COMMIT=HEAD
ARG N_CORES

USER root
RUN apt-get install -y make libx11-dev

USER sage
ENV HOME /home/sage
WORKDIR /home/sage
ADD --chown=sage yacop-base /tmp/yacop-base
RUN echo "Installing the Steenrod library and its dependencies" \
    && cd /tmp/yacop-base && sage -sh spkg-install \
    && echo "quit();" | sage \
    && rm -rf /tmp/* \
    && sync 

ENTRYPOINT [ "sage-entrypoint" ]
CMD [ "sage" ]
