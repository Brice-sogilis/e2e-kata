tests:
	$(MAKE) -c tests tests

reference-tests:
	$(MAKE) -C reference tests
	$(MAKE) -C tests reference-tests

reference-checks:
	$(MAKE) -C reference checks