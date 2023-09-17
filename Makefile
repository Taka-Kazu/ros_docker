ROS_DISTRO:=noetic
WORKSPACE:=~/catkin_ws

all:
	docker build \
		-f Dockerfile.${ROS_DISTRO} \
		--build-arg USER_ID=$(shell id -u) \
		--build-arg GROUP_ID=$(shell id -g) \
		-t ros_image:${ROS_DISTRO} \
		.

run-dev:
	docker run -ti --rm \
		--privileged \
		--env="DISPLAY" \
		-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
		-v ${WORKSPACE}:/home/user/ws \
		--runtime=nvidia \
		--name ros-container-${ROS_DISTRO}-run-dev \
		ros_image:${ROS_DISTRO} \
		bash
