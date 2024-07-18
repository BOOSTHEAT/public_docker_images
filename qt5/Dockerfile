
FROM ubuntu:22.04

#enable deb-src
#RUN sed -i '/deb-src/s/^# //' /etc/apt/sources.list && apt update 
#RUN apt-get -qq build-dep qtbase5-dev
ENV QT_MAJOR 5
ENV QT_MINOR 15
ENV QT_PATCH 9

ENV QT_NAME qt-everywhere-opensource-src-${QT_MAJOR}.${QT_MINOR}.${QT_PATCH}
ENV QT_DIR qt-everywhere-src-${QT_MAJOR}.${QT_MINOR}.${QT_PATCH}


RUN apt-get -qq update && \
	apt-get -qq install -y --no-install-recommends python3-pip python3-dev \
        libicu-dev \
        '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev \
		libx11-dev libxfixes-dev libxi-dev \
		libxcb1-dev libx11-xcb-dev libxcb-glx0-dev \
		libdbus-1-dev \
		zlib1g-dev libgl1-mesa-dev libfontconfig1-dev \
		build-essential wget libssl-dev > /dev/null && \
	apt-get -y clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
	wget http://download.qt.io/official_releases/qt/${QT_MAJOR}.${QT_MINOR}/${QT_MAJOR}.${QT_MINOR}.${QT_PATCH}/single/${QT_NAME}.tar.xz && \
	tar xJf ${QT_NAME}.tar.xz && \
	rm ${QT_NAME}.tar.xz && \
	cd ${QT_DIR} && \
	./configure -silent -shared -release -no-compile-examples -prefix /usr/local \
			-opensource -confirm-license \
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