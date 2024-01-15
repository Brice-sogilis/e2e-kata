PY=python3

all: checks tests

tests: snippet.py main.py
	$(PY) -m unittest snippet.py
	$(PY) -m cram usage

checks: snippet.py
	$(PY) -m mypy snippet.py

ci-setup:
	$(PY) -m pip install --user -r requirements.txt --upgrade pip
