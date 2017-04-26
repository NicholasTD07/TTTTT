import datetime


def t(year):
    """
    t(2017) ->
    ```
    ## Year 2017

    ### Jan Week 0

    ### Jan Week 1

    .
    .
    .

    ### Dec Week 51

    ### Dec Week 52

    ### Dec Week 53

    ```
    """

    month_format = "%b" # Jan, Feb, ...
    week_format = "%W" # Monday as the first day
    month_week_format = "### {} Week {}".format(month_format, week_format)

    day = datetime.datetime(year, 1, 1)

    month_week = lambda day: day.strftime(month_week_format)

    year_string = day.strftime("# %Y")

    texts = [year_string]

    while day.year <= year:
        texts.append(month_week(day))

        day = day + datetime.timedelta(days=7)

    with open('{}.md'.format(year), 'w') as f:
        f.write('\n\n'.join(texts))

if __name__ == '__main__':
    t(2017)
