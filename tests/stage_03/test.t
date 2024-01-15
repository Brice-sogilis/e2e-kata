Setup
  $ PY=${PY:-python3}
  $ MAIN=${MAIN:-"${TESTDIR}/../../workspace/main.py"}
  $ VERIFY="${PY} ${MAIN}"

Ok lines
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/OkLines.md

Wrong lines
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/WrongLines.md
  WrongLines.md: Snippet 4-6: Source file content mismatch in Source.kt
  [1]

Multiple files
  $ $VERIFY --sources_root=${TESTDIR} ${TESTDIR}/*.md
  MissingSource.md: Snippet 5-9: Missing source file definitely_not_a_file.c
  WrongLines.md: Snippet 4-6: Source file content mismatch in Source.kt
  [1]
