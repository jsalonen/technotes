# Curl recipes

## Fake hostname

    curl -I -H "Host:example.com" http://localhost:8080/examplesiteurl

## Send HTTP POST with JSON body

    curl -I -H "Content-Type: application/json" -d '{"name":"John Doe","age":32}' http://localhost:3000/api/users
