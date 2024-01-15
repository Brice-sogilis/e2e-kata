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
