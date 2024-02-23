import os
import sys
from pathlib import Path

def main(args: list[str]) -> None: 
    sourcePath = Path(args[0].split("=")[1])
    for markdown in [Path(a) for a in args[1:]]:
        markdownLines = read_file_lines(markdown)
        error = False
        for index, markdownLine in enumerate(markdownLines):
            if "source=" in markdownLine:
                text = markdownLine.split(" ") #TEXT = MARKDOWN
                fileName = text[1].replace("source=", "")
                if not os.path.exists(sourcePath/fileName):
                    error = True
                    print(f"{markdown.name}: Missing source file: {fileName}")
                else:
                    linesRange = [int(i) for i in text[2].replace("lines=", "").split("-")]
                    sourceFileLines = read_file_lines(sourcePath/fileName)
                    interestingLine = sourceFileLines[linesRange[0]-1:linesRange[1]]
                    linesToCompare = markdownLines[index+1] #Check the range totally
                    if len(interestingLine) == 0 or not interestingLine[0] == linesToCompare:
                        error = True
                        print(f"{markdown.name}: Snippet {index+1}-{index+3}: Source file content mismatch in {fileName}")
    if error:
        exit(1)
    # print("Called with arguments:", args)
def read_file_lines(filename: str | Path) -> list[str]:
    with open(filename, 'r', encoding='utf-8') as f:
        return f.readlines()
if __name__ == '__main__':
    args = sys.argv[1:] # Skip the first argument which is the name of the current executable
    main(args)
