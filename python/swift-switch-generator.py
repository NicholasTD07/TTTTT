import re

example = """
enum Activity {
    case email
    case message
    case facebook
    case other(activity: String)
    case ttttt(name: String, age: Int)
}
"""

expected = """
switch <thing> {
    case .email:
    case .message:
    case .facebook:
    case let .other(activity):
    case let .ttttt(name, age):
}
"""


pattern = re.compile(r'case [\w,(): ]+')

matches = pattern.findall(example)

matches = [ match.strip('case ') for match in matches ]

removing_pattern = re.compile(r':\s*\w+')

print("switch CHANGEME {")

for match in matches:
    if '(' in match:
        let = 'let '
    else:
        let = ''

    match = removing_pattern.sub('', match)
    print("case {}{}:".format(let, match))

print("}")
