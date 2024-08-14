import os

Number = 0
Number2 = 0
Number3 = 2**64 - 1

def main(args):
    file = "File.txt"
    if not os.path.exists(file):
        with open(file, "w") as f:
            f.write("Goodbye Cruel World!")

    print("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!")
    input("Press Enter to continue...")
    end()

def end():
    os.system('cls')
    file = "File.txt"
    with open(file, "r") as f:
        contents = f.read()
    while Number < Number3:
        with open(file, "a") as f:
            f.write(contents)
        print(f'\r{Number2 + 1}', end='')
        os.system(f'title {Number2 + 1}')
        file2 = f"File ({Number2}).txt"
        os.system(f'copy {file} {file2}')
        file = file2
        Number2 += 1
    print()

if __name__ == "__main__":
    main(0)