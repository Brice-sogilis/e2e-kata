import os
import sys
from pathlib import Path

def main(args: list[str]) -> None: 
    sourcePath = Path(args[0].split("=")[1])
    lines = read_file_lines(args[1])
    error = False
    for line in lines:
        if line.startswith("```c source="):
            text = line.split(" ")
            fileName = text[1].replace("source=", "")
            if not os.path.exists(sourcePath/fileName):
                error = True
                print(f"MissingSource.md: Missing source file: {fileName}")
    if error:
        exit(1)
    # print("Called with arguments:", args)
    # TODO => The kata starts here :)
def read_file_lines(filename: str | Path) -> list[str]:
    with open(filename, 'r', encoding='utf-8') as f:
        return f.readlines()
if __name__ == '__main__':
    args = sys.argv[1:] # Skip the first argument which is the name of the current executable
    main(args)
