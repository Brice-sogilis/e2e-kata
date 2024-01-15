Setup
  $ PY=${PY:-python3}
  $ MAIN=${MAIN:-"${TESTDIR}/../../workspace/main.py"}
  $ VERIFY="${PY} ${MAIN}"

No snippet no problem
  $ $VERIFY --sources_root=. ${TESTDIR}/NoSnippet.md

No source snippet
  $ $VERIFY --sources_root=. ${TESTDIR}/NoSourceSnippet.md
