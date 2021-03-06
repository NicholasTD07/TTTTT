import subprocess

def main(limit):
    output = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD'])
    print("{}\t{}".format(0, output.strip()))

    number = 1
    while True:
        try:
            output = subprocess.check_output(
                ['git', 'rev-parse', '--abbrev-ref', '@{{-{}}}'.format(number)],
                stderr=subprocess.STDOUT
            )
        except subprocess.CalledProcessError as e:
            output = "unknown branch (perhaps deleted)"

        if (not output or number > limit): # output is empty
            break

        print("{}\t{}".format(number, output.strip()))
        number += 1

if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='Show the history of checkout.')
    parser.add_argument(
        '-n', dest='limit',
        default=10, help='limit the number of branch names to output.'
    )

    args = parser.parse_args()

    main(args.limit)
