# vulnerable_code.py

# Example 1: Flask vulnerability (CVE-2018-1000656)
# Flask <= 1.0.2 is vulnerable to a path traversal issue when processing file paths.

from flask import Flask, request, send_from_directory

app = Flask(__name__)

@app.route('/download')
def download_file():
    filename = request.args.get('filename')  # Vulnerable to Path Traversal
    return send_from_directory('/var/www/files', filename)

# Example 2: Django vulnerability (CVE-2020-13597)
# Django <= 2.2.12 has a vulnerability where attackers can execute code via a malicious payload in session cookies.

import django
from django.utils.crypto import get_random_string

# A simple vulnerable function that accepts insecure session cookies.
def vulnerable_function(session_cookie):
    # Insecure way to handle session cookies
    secret_key = get_random_string(32)
    return secret_key + session_cookie

# Example 3: Insecure deserialization in Python (CVE-2018-20212)
# Vulnerable Python code that allows an attacker to execute arbitrary code when deserializing untrusted objects.

import pickle

def insecure_deserialization(serialized_data):
    # Vulnerable code that deserializes user input without validation
    return pickle.loads(serialized_data)

# Example 4: Insecure Dependencies (CVE-2019-10744)
# This vulnerability is caused by using outdated, insecure libraries like `requests` <= 2.18.4

import requests

def fetch_data(url):
    # Vulnerable version of requests that could allow attackers to exploit SSL vulnerabilities
    response = requests.get(url)  # Vulnerable to SSL issues in older versions
    return response.text

if __name__ == "__main__":
    app.run(debug=True)
