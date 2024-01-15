PY=python3
ifeq (${UPDATE_REF}, true)
	CRAM=cram -i -y
else
	CRAM=cram
endif

all: checks tests

tests: snippet.py main.py
	$(PY) -m unittest snippet.py
	$(PY) -m $(CRAM) usage

checks: snippet.py
	$(PY) -m mypy *.py
	
ci-setup:
	$(PY) -m pip install --user -r requirements.txt --upgrade pip
