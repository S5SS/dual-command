# By SSSS
# Doubles the unit caps for the 2X races

import os
import re

capsdir = 'unitcaps'

races = ['hiigaran_2x', 'vaygr_2x', 'kushan_2x', 'taiidan_2x']

# Step 0: get all default unit caps
sizes = os.listdir(capsdir)
contents = {}
for size in sizes:
	with open('%s/%s' % (capsdir, size), 'r') as f:
		contents[size] = f.read()

# Step 1: combine with race specific caps and double
for race in races:
	for size in os.listdir('%s/deathmatch/unitcaps' % race):
		with open('%s/deathmatch/unitcaps/%s' % (race, size), 'r+') as f:
			content = (contents[size] + f.read()).split('\n')
			f.truncate(0) # Delete file contents to overwrite with new content
			f.seek(0)
			
			# Double supply limits
			for line in content:
				if line.find('supplyLimit') != -1 and line.find('Research') == -1: # Don't double Research module cap
					cap = int(re.findall(r'\d+', line)[0])
					line = re.sub(str(cap), str(cap * 2), line, count=1)
				
				f.write(line + '\n')
			
			
			print('%s/deathmatch/unitcaps/%s' % (race, size))
			print(content)

print('Unit caps doubled')
print('Add this to all def_research.lua for double research costs:')
print(""""
for i,e in research do
	if research[i].Cost > 1 then
		research[i].Cost = research[i].Cost * 2
	end
end
""")
