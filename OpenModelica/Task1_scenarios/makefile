IMG_NAME=jmodelica

COMMAND_RUN=docker run \
	  --name bes_control \
	  --detach=false \
	  -e DISPLAY=${DISPLAY} \
	  -v /tmp/.X11-unix:/tmp/.X11-unix \
	  --rm \
	  -v `pwd`:/mnt/shared \
	  -i \
          -t \
	  ${IMG_NAME} /bin/bash -c


build:
	docker build --no-cache --rm -t ${IMG_NAME} .

remove-image:
	docker rmi ${IMG_NAME}

run:
	$(COMMAND_RUN) \
            "cd /mnt/shared && bash"
