FROM debian:buster

RUN apt install -y git cmake \
RUN dpkg --add-architecture armhf && apt update && \
    apt install -y libgstreamer1.0-dev:armhf \
	                libgstreamer-plugins-base1.0-dev:armhf \
		             libssl-dev:armhf
						 
