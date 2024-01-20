PY=python3

workspace-all: workspace-checks workspace-tests

workspace-tests:
	$(MAKE) -C tests tests

workspace-checks:
	$(MAKE) -C workspace checks

reference-all: reference-checks reference-tests

reference-tests:
	$(MAKE) -C reference tests
	$(MAKE) -C tests reference-tests

reference-checks:
	$(MAKE) -C reference checks
	$(PY) reference/main.py --sources_root=. README.md

# Install globally pip dependencies, you may choose to run via docker to avoid polluting your global pip cache
ci-setup:
	$(MAKE) -C reference ci-setup

# Docker setup for windows users or distributions with insufficient python version/dependencies
DOCKER_IMAGE_NAME=e2e-test
docker-image:
	docker build -t $(DOCKER_IMAGE_NAME) .

in-docker:
	docker run -w /home -v $(CURDIR):/home $(DOCKER_IMAGE_NAME) make $(TARGET) UPDATE_REF=$(UPDATE_REF)
