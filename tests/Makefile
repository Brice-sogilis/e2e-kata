PY=python3

tests:
	MAIN=${PWD}/workspace/main.py $(PY) -m cram stage_01

reference-tests:
	MAIN=${PWD}/reference/main.py $(PY) -m cram stage_01
	MAIN=${PWD}/reference/main.py $(PY) -m cram stage_02
	MAIN=${PWD}/reference/main.py $(PY) -m cram stage_03
	MAIN=${PWD}/reference/main.py $(PY) -m cram stage_04
