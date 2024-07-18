FROM ubuntu:22.04

WORKDIR /buildmps

RUN apt-get update -y && \
    apt-get install apt-utils git ant wget unzip gradle -y && \
    wget https://download.oracle.com/java/17/archive/jdk-17.0.2_linux-x64_bin.deb && \
    apt-get -qqy install ./jdk-17.0.2_linux-x64_bin.deb -y && \
    update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-17/bin/java 1717 && \
    git clone https://github.com/JetBrains/MPS-extensions.git && \
    cd MPS-extensions && \
    ./gradlew && \
    chmod +x ./build/mps/bin/mps.sh && \
    mv ./build/mps / && \
    mv ./artifacts/de.itemis.mps.extensions/* /mps/plugins && \
    rm -rf /buildmps

WORKDIR /mps
