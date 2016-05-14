import subprocess

def main():
    output = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD'])
    print("{}\t{}".format(0, output.strip()))

    number = 1
    while True:
        output = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', '@{{-{}}}'.format(number)])
        if not output: # output is empty
            break

        print("{}\t{}".format(number, output.strip()))
        number += 1

if __name__ == '__main__':
    main()
