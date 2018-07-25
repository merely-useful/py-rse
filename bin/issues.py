#!/usr/bin/env python

import sys
import requests
import json


ISSUES_URL = 'https://api.github.com/repos/{repo}/issues?state=open&per_page=100&page={page}'
SEPARATOR = '\n---\n\n'
ENTRY = '''\
**{number} {title} ({all_labels})**

{body}
'''


def main():
    repo = sys.argv[1]
    issues = get_issues(repo)
    decorate(issues)
    print(SEPARATOR.join([ENTRY.format(**x) for x in issues]))


def get_issues(repo):
    issues, page = [], 1
    while True:
        req = requests.get(ISSUES_URL.format(repo=repo, page=page))
        data = json.loads(req.text)
        if not data:
            break
        issues += data
        page += 1
    return issues


def decorate(all_issues):
    for issue in all_issues:
        issue['all_labels'] = ', '.join([i['name'] for i in issue['labels']])
    all_issues.sort(key=lambda i: i['all_labels'])


if __name__ == '__main__':
    main()
