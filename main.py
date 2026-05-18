import requests

def fetch_data():
    url = "https://example.com"
    response = requests.get(url)
    print(response.text)

if __name__ == "__main__":
    fetch_data()
