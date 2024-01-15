import sys

def main(args: list[str]) -> None:
    print("Called with arguments:", args)

if __name__ == '__main__':
    args = sys.argv[1:] # Skip the first argument which is the name of the current executable
    main(args)

