import re
file = open("enums.txt", "r")
content = file.read()
file.close()
#// comments be gone
content = re.sub(r'//.*\n', '', content)
lines = content.split("\n")
count = 0
newContent = []
for line in lines:
    line = line.replace(",", "= " + str(count) + "," )
    count += 1
    newContent.append(line + "\n")
file = open("enums.txt", "w")
file.writelines(newContent)
file.close()