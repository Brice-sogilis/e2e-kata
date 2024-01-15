Setup
  $ PY=${PY:-python3}
  $ MAIN=${MAIN:-"${TESTDIR}/../../workspace/main.py"}
  $ VERIFY="${PY} ${MAIN}"

Various edge cases
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/Unclosed.md
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/Nested.md


