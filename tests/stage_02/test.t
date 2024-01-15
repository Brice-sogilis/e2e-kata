Setup
  $ PY=${PY:-python3}
  $ MAIN=${MAIN:-"${TESTDIR}/../../workspace/main.py"}
  $ VERIFY="${PY} ${MAIN}"

Missing source file
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/MissingSource.md
  MissingSource.md: Snippet 5-9: Missing source file definitely_not_a_file.c
  [1]
