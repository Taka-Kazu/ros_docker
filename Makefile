ROS_DISTRO:=noetic

all:
	docker build -f Dockerfile.${ROS_DISTRO} -t ros_image:${ROS_DISTRO} .
