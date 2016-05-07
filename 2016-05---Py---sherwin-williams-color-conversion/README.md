# Sherwin-Williams Colors Conversion Script

For converting colors in [this PDF](http://www.sherwin-williams.com/wcm/idc/groups/public/@swpublic/@sherwin-williams/@content/documents/webcontent/mdaw/mdc3/~edisp/sw-pdf-sherwin-williams-colorc.pdf) found on [this page](http://www.sherwin-williams.com/architects-specifiers-designers/color/color-tools/downloadable-color-palettes/) into a JSON file.

## Tools

* Python
* Regular Expression `imoprt re`
  * Verbose mode `re.X`
  * Named groups
* JSON `import json`

## Example Data & Key Parts

**Example Data**

`0001 Mulberry Silk 148 118 108`

**Key Parts**

```python
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

matched_result = re.match(pattern, line, re.X)
matched_dict = matched_result.groupdict()
```
