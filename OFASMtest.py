#!/usr/bin/python
# -*- coding: utf-8 -*-

import subprocess
import os
import argparse
import re
import json
import collections
import os.path

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

class OFASMTest:
    base_command_string = """export LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH; cd ./{0}/{1}/{2}; pwd; {3};"""
    filtered_list = []
    excluded_list = []
    run_result_list = []
    success_test = []
    fail_test = []
    instruction_command = {
        'Mtest': 'make clean all',
        'Stest': 'make clean all install'
    }

    def __init__(self, arg):
        self.test_arguments = arg
        self.excludeTest()
        if not arg.failed_test or arg.list:
            self.filterInstruction(arg.category, arg.author, arg.instruction)

    def __del__(self):
        if not self.test_arguments.list:
            print bcolors.HEADER + " {0} ".format("delete temporary files").center(60, '=') + bcolors.ENDC
            self.cleanTest()

    def listTestCode(self):
        instruction_list = {}
        for root, dirs, files, depth in self.walklevel('.', 3):
            if '.git' in dirs:
                dirs.remove('.git')
            path = root.split(os.sep)

            try: 
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
        for key in instruction_list:
            print bcolors.HEADER + key + bcolors.ENDC
            ordered_list = collections.OrderedDict(sorted(instruction_list[key].items()))
            total_cnt = 0
            for instruction in ordered_list:
                print "===={0:20} ({1})".format(instruction, str(ordered_list[instruction]))
                total_cnt += ordered_list[instruction]
            print "total: {0}".format(total_cnt)

    def cleanTest(self):
        for item in self.filtered_list:
            clean_string = self.base_command_string.format(item['category'], item['author'], item['instruction'], "make clean")
            
            p = subprocess.Popen(clean_string, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            print "./%s/%s/%s" % (item['category'], item['author'], item['instruction'])
            for line in p.stderr.readlines():
                print line,
            p.wait()

    # traverse recursively directory and file names
    def walklevel(self, some_dir, level=1):
        some_dir = some_dir.rstrip(os.path.sep)
        assert os.path.isdir(some_dir)
        num_sep = some_dir.count(os.path.sep)

        for _root, _dirs, _files in os.walk(some_dir):
            num_sep_this = _root.count(os.path.sep)
            yield _root, _dirs, _files, num_sep_this
            if num_sep + level <= num_sep_this:
                del _dirs[:]

    def runTest(self):
        for item in self.filtered_list:
            install_string = self.base_command_string.format(item['category'], item['author'], item['instruction'], "make all")
            test_string = self.base_command_string.format(item['category'], item['author'], item['instruction'], "make test")
            print bcolors.HEADER + " {0} ".format("clean and install").center(60, '=') + bcolors.ENDC
            p = subprocess.Popen(install_string, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            for line in p.stdout.readlines():
                print line,
            p.wait()
            
            print bcolors.HEADER + " {0} ".format("test").center(60, '=') + bcolors.ENDC
            p2 = subprocess.Popen(test_string, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            test_out = p2.stdout.readlines()
            test_err = p2.stderr.readlines()
            for line in test_out:
                print line,
            p2.wait()

            if test_err:
                for line in test_err:
                    print bcolors.FAIL + line + bcolors.ENDC,
                res = {
                    "category": item['category'],
                    "author": item['author'],
                    "instruction": item['instruction'],
                    "status": False,
                    "stdout": test_out,
                    "stderr": test_err
                }
                self.fail_test.append(res)
                self.run_result_list.append(res)
            else:
                res = {
                    "category": item['category'],
                    "author": item['author'],
                    "instruction": item['instruction'],
                    "status": True,
                    "stderr": []
                }
                self.success_test.append(res)
                self.run_result_list.append(res)

    # index 1: category
    # index 2: author
    # index 3: instruction name
    def filterInstruction(self, category, author, instruction):
        regexp = re.compile('^%s[0-9]*$' % instruction)
        flag = False
        for root, dirs, files, depth in self.walklevel('.', 3):
            if '.git' in dirs:
                dirs.remove('.git')
            path = root.split(os.sep)

            try:
                if depth == 3:
                    for item in self.excluded_list:
                        if item['category'] in path[1] and item['author'] in path[2] and regexp.search(path[3]):
                            flag = True
                        else:
                            flag = False
                    if flag:
                        continue
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

                        self.filtered_list.append({
                            "category": path[1],
                            "author": path[2],
                            "instruction": path[3]
                        })
                    else:
                        self.filtered_list.append({
                            "category": path[1],
                            "author": path[2],
                            "instruction": path[3]
                        })
            except IndexError:
                print "check folder structure"
                print "<instruction_category> - <author_name> - <instruction_name##>"

    def printSummary(self):
        print bcolors.HEADER + " {0} ".format("summary").center(60, '=') + bcolors.ENDC
        for item in self.run_result_list:
            if item['status']:
                print (bcolors.OKGREEN + "./%s/%s/%s passed" + bcolors.ENDC) % (item['category'], item['author'], item['instruction'])
            else:
                print (bcolors.FAIL + "./%s/%s/%s failed" + bcolors.ENDC) % (item['category'], item['author'], item['instruction'])
                for line in item['stdout']:
                    print bcolors.WARNING + line + bcolors.ENDC,
                for line in item['stderr']:
                    print bcolors.WARNING + line + bcolors.ENDC,
        print "%d passed, %d failed" % (len(self.success_test), len(self.fail_test))

    def loadFailedTest(self):
        with open('test_log.json', 'r') as infile:
            failed_list = json.load(infile)
        for item in failed_list:
            self.filtered_list.append({
                'category': item['category'],
                'author': item['author'],
                'instruction': item['instruction']
            })
    
    def saveFailedTest(self):
        with open('test_log.json', 'w') as outfile:
            json.dump(self.fail_test, outfile)
    
    def excludeTest(self):
        exclude_file = os.path.isfile(".excluded_test")
        if exclude_file:
            with open('.excluded_test', 'r') as infile:
                content = infile.readlines()
        
            for line in content:
                parse = line.strip().split('.')
                self.excluded_list.append({
                    'category': parse[0],
                    'author': parse[1],
                    'instruction': parse[2]
                })

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='filter testing codes')
    parser.add_argument('-list', action='store_true')
    parser.add_argument('-failed_test', action='store_true')
    parser.add_argument('-category')
    parser.add_argument('-author')
    parser.add_argument('-instruction')
    # parser.add_argument('value', required=False)

    args = parser.parse_args()
    # parse_value = args.value.split('.')
    # args.category = parse_value[0]
    # args.author = parse_value[1]
    # args.instruction = parse_value[2]

    ofasm_test = OFASMTest(args)
    if args.list:
        ofasm_test.listTestCode()
    elif args.failed_test:
        ofasm_test.loadFailedTest()
        ofasm_test.runTest()
        ofasm_test.printSummary()
    else:
        ofasm_test.runTest()
        ofasm_test.printSummary()
        ofasm_test.saveFailedTest()
