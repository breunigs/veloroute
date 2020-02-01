#!/usr/bin/env python3

import sys
import os
from subprocess import run, PIPE
import ruamel.yaml
import json
from atomicwrites import atomic_write

raw = open(sys.argv[1], encoding="utf-8").read()

parsed = ruamel.yaml.load(raw, Loader=ruamel.yaml.RoundTripLoader)

if not 'area' in parsed:
  print("Didn't find 'area' in YAML")
  sys.exit(0)

if isinstance(parsed['area'], list):
  print("'area' is already an array.")
  sys.exit(0)

area = json.dumps(parsed['area'])

dirname = os.path.dirname(__file__)
filename = os.path.join(dirname, 'geojson_coord_simplify.rb')
p = run([filename], stdout=PIPE, stderr=PIPE, input=area, encoding='utf8')
if p.returncode != 0:
  print("Failed to simplify coordinates!")
  print("= STDERR ==================================")
  print(p.stderr)
  print("= STDOUT ==================================")
  print(p.stdout)
  print("= GIVEN ==================================")
  print(area)
  sys.exit(1)

parsed['area'] = ruamel.yaml.load(p.stdout.strip(), Loader=ruamel.yaml.RoundTripLoader)

fixed = ruamel.yaml.dump(parsed, Dumper=ruamel.yaml.RoundTripDumper, width=sys.maxsize, allow_unicode=True)

with atomic_write(sys.argv[1], overwrite=True) as f:
  f.write(fixed)


print("Done!")

# print(p.stdout.strip())
# print(parsed['area'])

