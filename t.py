import subprocess


def main():
    number = 1
    output = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', '@{{-{}}}'.format(number)])
    print("{}\t{}".format(number, output))

main()
