#/bin/bash

# download tar archives from our main repository
wget --mirror --no-parent --directory-prefix=. --no-host-directories https://nullhomotopie.de/yacop-base/

docker build .
