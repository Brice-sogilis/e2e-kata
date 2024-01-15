Setup
  $ PY=${PY:-python3}
  $ MAIN=${MAIN:-"${TESTDIR}/../main.py"}
  $ VERIFY="${PY} ${MAIN}"

Usage
  $ ${VERIFY} --help
  usage: SnippetCheck [-h] [-s SOURCES_ROOT] markdown_files [markdown_files ...]
  
  Verify source code snippets actually correspond to source files content
  
  positional arguments:
    markdown_files
  
  options:
    -h, --help            show this help message and exit
    -s SOURCES_ROOT, --sources_root SOURCES_ROOT

Invalid argument:
  $ ${VERIFY} invalid-argument
  Snippet validation failed with error: "[Errno 2] No such file or directory: 'invalid-argument'"
  [2]

Valid:
  $ ${VERIFY} --sources_root ${TESTDIR} ${TESTDIR}/TestOk.md

Wrong lines:
  $ ${VERIFY} --sources_root ${TESTDIR} ${TESTDIR}/TestKo.md
  TestKo.md: Snippet 4-8: Source file content mismatch in TestSource.java
  [1]

Missing source file:
  $ ${VERIFY} --sources_root ${TESTDIR} ${TESTDIR}/TestNoSource.md
  TestNoSource.md: Snippet 4-8: Missing source file DoesNotExist.java
  [1]

Multiple files:
  $ ${VERIFY} --sources_root ${TESTDIR} ${TESTDIR}/TestKo.md ${TESTDIR}/TestNoSource.md
  TestKo.md: Snippet 4-8: Source file content mismatch in TestSource.java
  TestNoSource.md: Snippet 4-8: Missing source file DoesNotExist.java
  [1]

Using glob:
  $ ${VERIFY} --sources_root ${TESTDIR} ${TESTDIR}/*.md
  TestKo.md: Snippet 4-8: Source file content mismatch in TestSource.java
  TestNoSource.md: Snippet 4-8: Missing source file DoesNotExist.java
  [1]
