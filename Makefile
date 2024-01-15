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