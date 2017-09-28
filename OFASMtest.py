#!/usr/bin/python
# -*- coding: utf-8 -*-

import subprocess
import os
import argparse
import re
import json
import collections

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def walklevel(some_dir, level=1):
    some_dir = some_dir.rstrip(os.path.sep)
    assert os.path.isdir(some_dir)
    num_sep = some_dir.count(os.path.sep)

    for _root, _dirs, _files in os.walk(some_dir):
        num_sep_this = _root.count(os.path.sep)
        yield _root, _dirs, _files, num_sep_this
        if num_sep + level <= num_sep_this:
            del _dirs[:]

# def listTestCode():
#     for root, dirs, files, depth in walklevel('.', 3):
#         if '.git' in dirs:
#             dirs.remove('.git')
#         path = root.split(os.sep)

#         try:
#           if depth == 1:
#               print (len(path) - 1) * '==' + os.path.basename(root)
#           elif depth == 3:
#               print (len(path) - 1) * '---' + path[2] + '.' + path[3]
#         except IndexError:
#             print "check folder structure"
#             print "<instruction_category> - <author_name> - <instruction_name##>"
#             return

def listTestCode():
    instruction_list = {}
    for root, dirs, files, depth in walklevel('.', 3):
        if '.git' in dirs:
            dirs.remove('.git')
        path = root.split(os.sep)

        try: 
            # if depth == 1:
            #     print (len(path) - 1) * '==' + os.path.basename(root)
            if depth == 3:
                if not path[1] in instruction_list:
                    instruction_list[path[1]] = {}
                name = re.search('[a-zA-Z]+', path[3]).group(0)
                if name in instruction_list[path[1]]:
                    instruction_list[path[1]][name] += 1
                else:
                    instruction_list[path[1]][name] = 1
        except IndexError:
            print IndexError.message
            print "check folder structure"
            print "<instruction_category> - <author_name> - <instruction_name##>"
            return
    
    for key in instruction_list:
        print bcolors.HEADER + key + bcolors.ENDC
        ordered_list = collections.OrderedDict(sorted(instruction_list[key].items()))
        total_cnt = 0
        for instruction in ordered_list:
            print "===={0:20} ({1})".format(instruction, str(ordered_list[instruction]))
            total_cnt += ordered_list[instruction]
        print "total: {0}".format(total_cnt)

def runTest(category, author, instruction_name):
    run_result = []
    install_string = "export LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH; cd ./%s/%s/%s; pwd; make clean all;" % (category, author, instruction_name)
    test_string = "export LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH; cd ./%s/%s/%s; pwd; make test;" % (category, author, instruction_name)
    print bcolors.HEADER + "======================= clean and install =======================" + bcolors.ENDC
    p = subprocess.Popen(install_string, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    for line in p.stdout.readlines():
        print line,
    
    print bcolors.HEADER + "============================= test =============================" + bcolors.ENDC
    p2 = subprocess.Popen(test_string, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    test_out = p2.stdout.readlines()
    test_err = p2.stderr.readlines()
    for line in test_out:
        print line,

    p.wait();p2.wait()

    if test_err:
        for line in test_err:
            print bcolors.FAIL + line + bcolors.ENDC,
        return {
            "category": category,
            "author": author,
            "instruction": instruction_name,
            "status": False,
            "stdout": test_out,
            "stderr": test_err
        }
    
    return {
        "category": category,
        "author": author,
        "instruction": instruction_name,
        "status": True,
        "stderr": []
    }

def cleanTest(category, author, instruction_name):
    clean_string = "export LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH; cd ./%s/%s/%s; pwd; make clean;" % (category, author, instruction_name)
    p = subprocess.Popen(clean_string, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    print "./%s/%s/%s" % (category, author, instruction_name)
    for line in p.stderr.readlines():
        print line,

# index 1: category
# index 2: author
# index 3: instruction name
def filterInstruction(category, author, instruction):
    filter_result = []
    regexp = re.compile('^%s[0-9]*$' % instruction)
    for root, dirs, files, depth in walklevel('.', 3):
        if '.git' in dirs:
            dirs.remove('.git')
        path = root.split(os.sep)

        try:
            if depth == 3:
                if category or author or instruction:
                    if category:
                        if not category in path[1]:
                            continue
                    if author:
                        if not author in path[2]:
                            continue
                    if instruction:
                        if not regexp.search(path[3]):
                            continue

                    filter_result.append({
                        "category": path[1],
                        "author": path[2],
                        "instruction": path[3]
                    })
                else:
                    filter_result.append({
                        "category": path[1],
                        "author": path[2],
                        "instruction": path[3]
                    })
        except IndexError:
          print "check folder structure"
          print "<instruction_category> - <author_name> - <instruction_name##>"
          return

    return filter_result

def printSummary(res):
    fail_cnt = 0
    print bcolors.HEADER + "================================ summary ===================================" + bcolors.ENDC
    for item in res:
        if item['status']:
            print (bcolors.OKGREEN + "./%s/%s/%s passed" + bcolors.ENDC) % (item['category'], item['author'], item['instruction'])
        else:
            fail_cnt+=1
            print (bcolors.FAIL + "./%s/%s/%s failed" + bcolors.ENDC) % (item['category'], item['author'], item['instruction'])
            for line in item['stdout']:
                print bcolors.WARNING + line + bcolors.ENDC,
            for line in item['stderr']:
                print bcolors.WARNING + line + bcolors.ENDC,
    print "%d passed, %d failed" % (len(res) - fail_cnt, fail_cnt)

def failedTests(flag, res=None):
    if flag:
        with open('test_log.json', 'r') as infile:
            failed_list = json.load(infile)
        run_result = []
        for test in failed_list:
            run_result.append(runTest(test['category'], test['author'], test['instruction']))

        print bcolors.HEADER + "======================= delete temporary files =======================" + bcolors.ENDC
        for test in failed_list:
            cleanTest(test['category'], test['author'], test['instruction'])
        printSummary(run_result)
        failedTests(False, run_result)
    else:
        failed_tests = []
        for item in res:
            if not item['status']:
                failed_tests.append(item)
                
        with open('test_log.json', 'w') as outfile:
            json.dump(failed_tests, outfile)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='filter testing codes')
    parser.add_argument('-list', action='store_true')
    parser.add_argument('-failed_test', action='store_true')
    parser.add_argument('-category')
    parser.add_argument('-author')
    parser.add_argument('-instruction')

    args = parser.parse_args()

    if args.list:
        listTestCode()
    elif args.failed_test:
        failedTests(True)
    else:
        run_result = []
        filter_res = filterInstruction(args.category, args.author, args.instruction)
        for test in filter_res:
            run_result.append(runTest(test['category'], test['author'], test['instruction']))

        print bcolors.HEADER + "======================= delete temporary files =======================" + bcolors.ENDC
        for test in filter_res:
            cleanTest(test['category'], test['author'], test['instruction'])
        printSummary(run_result)
        failedTests(False, run_result)

