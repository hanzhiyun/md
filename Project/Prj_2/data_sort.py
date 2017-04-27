#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2017-04-26 20:33:18
# @Author  : Han Zhiyun
# @Email   : hanzhiyun1995@foxmail.com

filename = 'test.txt'
destname = 'result.lammpstrj'
source = open(filename, 'r')
destination = open(destname, 'w')
lines = source.readlines()
list_num = []
flag = 0
for line in lines:
    line = line.rstrip('\n')
    if line == "ITEM: ATOMS id xs ys zs c_3 c_4 c_5 ":
        # print line
        destination.write(line + '\n')
        flag = 257
    elif flag:
        flag -= 1
        # print line.split()
        list_num.append(line.split())
        # print list_num
        if 0 == flag:
            # print list_num
            list_num.sort(lambda x, y: cmp(int(x[0]), int(y[0])))
            # print list_num
            for line_num in list_num:
                line_num = ' '.join(line_num)
                # print line_n
                destination.write(line_num + '\n')
            list_num = []
    else:
        destination.write(line + '\n')
else:
    print 'End!'
    source.close()
    destination.close()
