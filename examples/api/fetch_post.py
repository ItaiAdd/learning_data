import requests

URL = "https://jsonplaceholder.typicode.com/posts/1"

response = requests.get(URL, timeout=10)
response.raise_for_status()
post = response.json()

print(f"Post {post['id']}: {post['title']}")
