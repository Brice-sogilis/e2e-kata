![Ci Status](https://github.com/Brice-sogilis/e2e-kata/actions/workflows/ci.yml/badge.svg)
# End-to-end kata: Markdown sourced snippets verifier

Python kata to experiment on testing a CLI program only from the terminal usage

## Theme

The program develop during this kata is a 'markdown snippet verifier'. It should allow us to write code snippets in a markdown document, annotate them with a source file and line range, and verify that they match an actual source file.

For example, we could write Markdown code like this in **markdown.md**:
````markdown
# My markdown document

## Section with code snippet
 
```python    source=workspace/main.py                       lines=1-3
hello = "Hello"
world = "World!"
print(hi, world, sep=", ")
```
````

And when running our program against this file, it will fail if workspace/main.py does not exists, or if it does not contain the expected lines.

Focusing on the snippet header line, here are the details of the parameters (note that the language parameters comes from the native markdown syntax and can be omitted. It helps for syntax highlighting e.g. when displaying the markdown in github):

````markdown
  language   source file from which the snippet is copied   lines in the source file corresponding to the snippet
   vvvvvv    vvvvvvvvvvvvvvvvvvvvvvvv                       vvvvvvvvv
```python    source=workspace/main.py                       lines=1-3
````

You can look at usage examples in [reference/usage/usage.t](reference/usage/usage.t).

## End to end test tool

We are going to use the [Cram tests framework](https://bitheap.org/cram/), which belongs to the acceptance testing family. The core principle of this framework is simple: write shell commands and their expected output in a test file, then run the commands and compare the actual output. The tool offers facilities to display errors as diffs, or automatically modify the test file when you decide to accept the modifications. Let's look at an example in the tests of our reference implementation [reference/usage/usage.t](reference/usage/usage.t)

```cram source=reference/usage/usage.t lines=1-17
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
```

+ The unindented lines are comments and are ignored during the tests run
+ The indented lines beginning by `$` are treated as shell command
+ The other indented lines are the expected output of the previous shell command

Ignore the `Setup` section, it is only here to simplify the use of `${VERIFY}` to call our python program in the rest of the file.

In the `Usage` section, we test a run of our program with the --help option. The following lines correspond to the expected output of this command. If during the test run the output does not correspond to the expected one, the test would fail, displaying a diff. For example, if we add replaced "markdown_files" with "markdowns" in our implementation, it would output something like this:

```
--- usage/usage.t
+++ usage/usage.t.err
@@ -5,12 +5,12 @@
 
 Usage
   $ ${VERIFY} --help
-  usage: SnippetCheck [-h] [-s SOURCES_ROOT] markdown_files [markdown_files ...]
+  usage: SnippetCheck [-h] [-s SOURCES_ROOT] markdowns [markdowns ...]
   
   Verify source code snippets actually correspond to source files content
   
   positional arguments:
-    markdown_files
+    markdowns
   
   options:
     -h, --help            show this help message and exit
```

## Structure

This kata is organized in three folder: 

+ [tests/](tests/)   contains the cram tests corresponding to the 'specifications' of the the program. They are divided into multiple stages corresponding roughly to incremental features of the verifier. When you run `make workspace-tests` initially only the first stage is run, add the other stages in the [test Makefile](tests/Makefile) tests target as you progress in the kata implementation.

+ [reference/](reference/)   contains a reference implementation compliant with the initial tests. It is meant to ease the maintenance of the repository, or eventually help understanding the expectations, but you should not need to look at it during the kata.

+ [workspace/](workspace/)   contains your implementation for this kata ! The tests in [tests/](tests/) target the [main.py file](workspace/main.py).

All the tests should be run from the repository root.

```bash
make reference-tests
``` 
to run the test on the reference implementations. 

```bash
make workspace-tests
```
to run the test on your current implementation.

## Kata

### Constraints: 

+ No unittest, no pytest, no fancy unit test framework, all your testing should be done via end to end cram tests.
+ You are free to add more end to end test to complete the existing ones.

### Get started !

+ Run `make workspace-tests`. 
+ It should fail, look at [tests/stage_01/test.t](tests/stage_01/test.t).
+ Implement a minimal version in [workspace/main.py](workspace/main.py) to pass the test.
+ Uncomment the tests of stage_02 in [tests/Makefile](tests/Makefile). 
+ Repeat until stage_04.

You may then consider adding more features to the program: 

+ Display the actual difference in case of a mismatch between the snippet and the source file
+ Update automatically the snippet from the source file when the mismatch is expected
+ Allow some form of escaping in the markdown snippet, for example
````markdown
```python source=source.py lines = 1-5
def main():
  some_stuff()
  # ...
  return 0
```
````

could match:
```python
def main():
  some_stuff()
  other_stuff()
  another_stuff()
  return 0
``` 
+ ... 

You can do it TDD style: add a simple cram test in a stage_n folder and iterate from here ;)
