Setup
  $ PY=${PY:-python3}
  $ MAIN=${MAIN:-"${TESTDIR}/../../workspace/main.py"}
  $ VERIFY="${PY} ${MAIN}"

Various edge cases
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/Unclosed.md
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/Nested.md
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/Tabulated.md
  Tabulated.md: Snippet 10-12: Source file content mismatch in Source.ml
  [1]
