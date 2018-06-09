#/bin/bash

# download tar archives from our main repository
wget --mirror --no-parent --directory-prefix=. --no-host-directories https://nullhomotopie.de/yacop-base/

SAGE_VERSION=8.2
DOCKERID=cnassau

docker build --tag $DOCKERID/yacop-base:latest --tag $DOCKERID/yacop-base:$SAGE_VERSION --build-arg SAGE_VERSION=$SAGE_VERSION .
