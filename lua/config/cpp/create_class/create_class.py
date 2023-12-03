#!/bin/env python3
from sys import argv
import subprocess

fq_classname = argv[1].split('::')
classname = fq_classname[-1]
path = '/'.join(fq_classname[:-1])

header_template = f'''\
#ifndef {'_'.join(fq_classname).upper()}_HPP
#define {'_'.join(fq_classname).upper()}_HPP

namespace {'::'.join(fq_classname[:-1])} {{
class {classname} {{ 
public:
{f'virtual ~{classname}() = default;' if classname[0] == 'I' else ''}
}};
}};

#endif
'''

subprocess.run(['mkdir', '-p', 'include/' + path])
subprocess.run(['echo', header_template], stdout=open(f'include/{path}/{classname}.hpp', 'w'))

if(classname[0] == 'I'):
    exit(0)

source_template = f'''\
#include "{path}/{classname}.hpp"

using namespace {'::'.join(fq_classname[:-1])};
'''

subprocess.run(['mkdir', '-p', 'src/' + path])
subprocess.run(['echo', source_template], stdout=open(f'src/{path}/{classname}.cpp', 'w'))
