PY=python3
ifeq (${UPDATE_REF}, true)
	CRAM=cram -i -y
else
	CRAM=cram
endif

tests:
	MAIN=$(CURDIR)/../workspace/main.py $(PY) -m $(CRAM) stage_01
#   MAIN=$(CURDIR)/../workspace/main.py $(PY) -m $(CRAM) stage_02
#   MAIN=$(CURDIR)/../workspace/main.py $(PY) -m $(CRAM) stage_03
#   MAIN=$(CURDIR)/../workspace/main.py $(PY) -m $(CRAM) stage_04
	

reference-tests:
	MAIN=$(CURDIR)/../reference/main.py $(PY) -m $(CRAM) stage_01
	MAIN=$(CURDIR)/../reference/main.py $(PY) -m $(CRAM) stage_02
	MAIN=$(CURDIR)/../reference/main.py $(PY) -m $(CRAM) stage_03
	MAIN=$(CURDIR)/../reference/main.py $(PY) -m $(CRAM) stage_04
