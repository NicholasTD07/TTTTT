import re
import json

color_text = "COLOR"
pattern = r"""
           (?P<color_number>\d+)
           \s
           (?P<color_name>[\w\s].*?)
           \s
           (?P<r>\d+)
           \s
           (?P<g>\d+)
           \s
           (?P<b>\d+)
           """

def prettify(obj):
    return json.dumps(obj, indent=4)

def parse_lines(lines):
    parsed_dicts = []
    for line in lines:
        if line.startswith(color_text):
            # print(line)
            continue

        matched_result = re.match(pattern, line, re.X)

        if matched_result is None:
            print("Did not match:")
            print(line)
            continue

        # # Print matched text and matched dict
        matched_text = matched_result.group()
        matched_dict = matched_result.groupdict()
        # print(matched_text)
        # print(prettify(matched_dict))

        parsed_dicts.append(matched_dict)
    return parsed_dicts


if __name__ == '__main__':
    with open("./raw-data.txt") as f:
        raw_data = f.read()
        raw_lines = raw_data.splitlines()

    def test():
        test_lines = raw_lines[:5]
        # Print test_lines
        print("######")
        print("\n".join(test_lines))
        print("######")

        matched_dicts = parse_lines(test_lines)
        print(prettify(matched_dicts))

    # test()

    with open("./processed.json", 'w') as f:
        json.dump(parse_lines(raw_lines), f, indent=4)
