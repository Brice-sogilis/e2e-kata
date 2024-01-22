Setup
  $ PY=${PY:-python3}
  $ MAIN=${MAIN:-"${TESTDIR}/../../workspace/main.py"}
  $ VERIFY="${PY} ${MAIN}"

Missing source file
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/MissingSource.md
  MissingSource.md: Snippet 5-9: Missing source file definitely_not_a_file.c
  MissingSource.md: Snippet 13-17: Missing source file hidden.c
  [1]

From another sources root:
  $ $VERIFY --sources_root=${TESTDIR}/subfolder ${TESTDIR}/MissingSource.md
  MissingSource.md: Snippet 5-9: Missing source file definitely_not_a_file.c
  MissingSource.md: Snippet 22-26: Missing source file subfolder/hidden.c
  [1]
