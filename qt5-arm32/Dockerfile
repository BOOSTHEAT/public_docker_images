FROM ubuntu:focal

ENV QT_MAJOR 5
ENV QT_MINOR 15
ENV QT_PATCH 9

ENV QT_NAME qt-everywhere-opensource-src-${QT_MAJOR}.${QT_MINOR}.${QT_PATCH}
ENV QT_DIR qt-everywhere-src-${QT_MAJOR}.${QT_MINOR}.${QT_PATCH}


COPY sources.list /etc/apt/sources.list

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    dpkg --add-architecture armhf && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential && \
	apt-get -y install wget && \
	apt-get -y install libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev build-essential bison flex libssl-dev bc && \
    apt-get -y install pip freeglut3-dev:armhf gdb git iputils-ping \
    libgl1-mesa-dev:armhf libglu1-mesa-dev:armhf libjpeg-dev:armhf libmysqlclient-dev:armhf \
    libnss3-dev:armhf libopus-dev:armhf libpng-dev:armhf libsqlite3-dev:armhf libssl-dev:armhf \
    libx11-xcb-dev:armhf libxcb-xinerama0-dev:armhf libxcb-xkb-dev:armhf libxcb1-dev:armhf \
    libxcursor-dev:armhf libxi-dev:armhf libxml2-dev:armhf libxrender-dev:armhf libxslt-dev:armhf \
    lzip mesa-common-dev:armhf nano perl python3 valgrind wget zlib1g-dev:armhf '^libxcb.*-dev:armhf' \
    libxkbcommon-dev:armhf libxkbcommon-x11-dev:armhf wget libwayland-dev:armhf flex bison gperf \
    libicu-dev:armhf libxslt-dev:armhf ruby libxcursor-dev:armhf libxcomposite-dev:armhf \
    libxdamage-dev:armhf libxrandr-dev:armhf libxtst-dev:armhf libxss-dev:armhf libdbus-1-dev:armhf \
    libevent-dev:armhf libfontconfig1-dev:armhf libcap-dev:armhf libpulse-dev:armhf libudev-dev:armhf \
    libpci-dev:armhf libnss3-dev:armhf libasound2-dev:armhf libegl1-mesa-dev:armhf gperf bison nodejs \
    libasound2-dev:armhf libgstreamer1.0-dev:armhf libgstreamer-plugins-base1.0-dev:armhf \
    libgstreamer-plugins-good1.0-dev:armhf libnspr4-dev:armhf libcups2-dev:armhf \
    libmng-dev:armhf libwebp-dev:armhf libxcb-xinput-dev:armhf libwebpmux3:armhf libvpx-dev:armhf \
    libavformat-dev:armhf libavcodec-dev:armhf libavutil-dev:armhf libswresample-dev:armhf libswscale-dev:armhf libavdevice-dev:armhf libzstd-dev:armhf \
    libpcre2-dev:armhf libclang-dev:armhf libxshmfence-dev:armhf libxkbfile-dev:armhf libbluetooth-dev:armhf \
    libsctp-dev:armhf libsnappy-dev:armhf libharfbuzz-dev:armhf libminizip-dev:armhf \
    libb2-dev:armhf libva-dev:armhf \
    gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf ninja-build cmake && \
    \
    apt-get -y install freeglut3-dev libgl1-mesa-dev libglu1-mesa-dev libjpeg-dev libmysqlclient-dev \
    libnss3-dev libopus-dev libpng-dev libsqlite3-dev libssl-dev \
    libx11-xcb-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb1-dev \
    libxcursor-dev libxi-dev libxml2-dev libxrender-dev libxslt-dev mesa-common-dev \
    zlib1g-dev '^libxcb.*-dev' libxkbcommon-dev libxkbcommon-x11-dev libwayland-dev \
    libicu-dev libxslt-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libxtst-dev \
    libxss-dev libdbus-1-dev libevent-dev libfontconfig1-dev libcap-dev libpulse-dev libudev-dev \
    libpci-dev libnss3-dev libasound2-dev libegl1-mesa-dev libasound2-dev libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libnspr4-dev libcups2-dev \
    libavformat-dev libavcodec-dev libavutil-dev libswresample-dev libswscale-dev libavdevice-dev \
    libmng-dev libwebp-dev libxcb-xinput-dev libwebpmux3 libvpx-dev zstd libzstd-dev \
    libpcre2-dev libclang-dev python3 python3-html5lib libxshmfence-dev libxkbfile-dev libbluetooth-dev \
    libsctp-dev libsnappy-dev libmd4c-dev libharfbuzz-dev libminizip-dev libb2-dev libva-dev

RUN \
    apt-get -y autoremove && \
    apt-get -y autoclean && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

#COPY toolchain.cmake /root/toolchain.cmake

RUN wget http://download.qt.io/official_releases/qt/${QT_MAJOR}.${QT_MINOR}/${QT_MAJOR}.${QT_MINOR}.${QT_PATCH}/single/${QT_NAME}.tar.xz && \
	tar xJf ${QT_NAME}.tar.xz && \
	rm ${QT_NAME}.tar.xz 


RUN \
    cp -R ${QT_DIR}/qtbase/mkspecs/linux-arm-gnueabi-g++ ${QT_DIR}/qtbase/mkspecs/linux-arm-gnueabihf-g++ && \
    sed -i -e 's/arm-linux-gnueabi-/arm-linux-gnueabihf-/g' ${QT_DIR}/qtbase/mkspecs/linux-arm-gnueabihf-g++/qmake.conf

RUN	cd ${QT_DIR} && \
	./configure -silent -shared -release -no-compile-examples -prefix /usr/local \
	 	-opensource -confirm-license \
        -nomake examples -nomake tests \
        -device linux-imx7-g++ \
        -device-option CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf- \
		-skip qt3d \
		-skip qtactiveqt \
		-skip qtandroidextras \
		-skip qtcanvas3d \
		-skip qtconnectivity \
		-skip qtdatavis3d \
		-skip qtdoc \
		-skip qtgamepad \
		-skip qtimageformats \
		-skip qtlocation \
		-skip qtmacextras \
		-skip qtmultimedia \
		-skip qtnetworkauth \
		-skip qtpurchasing \
		-skip qtscript \
		-skip qtscxml \
		-skip qtsensors \
		-skip qtserialport \
		-skip qtspeech \
		-skip qttools \
		-skip qtwayland \
		-skip qtwebchannel \
		-skip qtwebengine \
		-skip qtwebview \
		-skip qtwinextras \
		-skip qtxmlpatterns \
		-fontconfig \
		-no-icu -no-glib -no-qml-debug \
		-opengl desktop -no-eglfs -no-opengles3 -no-angle -no-egl \
		-openssl-runtime -dbus-runtime \
		-qt-freetype -qt-pcre -qt-harfbuzz -qt-libpng -qt-libjpeg \
		-system-zlib -system-freetype && \
	make -s -j`nproc` && \
	make -s install && \
	cd / && \
	rm -rf /${QT_DIR}