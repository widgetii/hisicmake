#!/usr/bin/env python3

import sys
import os
import re


# strings ./mpp/ko/hi3516cv300_sys.ko|grep "\[SYS\] Version: "
def find_sdk_version(filename):
    # pattern = re.compile(br'\[SYS\]\sVersion: \[(.+)\].+\[(.+)\]')
    # Hi3516EV200_MPP_V1.0.1.2 B030 Release', b'Oct 18 2019, 18:21:00'
    r = br'\[SYS\]\sVersion: \[(.+)_MPP_V(\d+)\.(\d+)\.(\d+)\.(\d+) (.+) Release\].+\[(.+)\]'
    pattern = re.compile(r)
    with open(filename, "rb") as f:
        ret = pattern.findall(f.read())
        if len(ret) == 1 and len(ret[0]) == 7:
            print(";".join([x.decode() for x in ret[0]]), end='')


# traverse root directory, and list directories as dirs and files as files
def find_sys_ko(path):
    pattern = re.compile(r"hi35[0-9a-z]+_sys.ko")
    for root, dirs, files in os.walk(path):
        path = root.split(os.sep)
        for file in files:
            if re.match(pattern, file):
                find_sdk_version(os.path.join(root, file))
                return


def main():
    if len(sys.argv) != 2:
        root_dir = os.getcwd()
    else:
        root_dir = sys.argv[1]
    find_sys_ko(root_dir)


if __name__ == '__main__':
    main()
