PY=python3
ifeq (${UPDATE_REF}, true)
	CRAM=cram -i -y
else
	CRAM=cram
endif

tests:
	MAIN=${PWD}/workspace/main.py $(PY) -m $(CRAM) stage_01

reference-tests:
	MAIN=${PWD}/reference/main.py $(PY) -m $(CRAM) stage_01
	MAIN=${PWD}/reference/main.py $(PY) -m $(CRAM) stage_02
	MAIN=${PWD}/reference/main.py $(PY) -m $(CRAM) stage_03
	MAIN=${PWD}/reference/main.py $(PY) -m $(CRAM) stage_04
