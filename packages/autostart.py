import json
import subprocess

filename = "/etc/liota/packages/package_list.json"
scriptpath="/etc/liota/packages/liotapkg.sh"

with open(filename, "r") as fp:
    pkgs = json.load(fp)
    fp.close()

for pkgname in pkgs["packages"]:
    subprocess.call(['sudo','bash',scriptpath,'load',pkgname])
        
    
