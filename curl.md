# Curl recipes

## Set hostname header ("Fake hostname")

    curl -i -H "Host:example.com" http://localhost:8080/examplesiteurl

## Send HTTP POST with JSON body

    curl -i -H "Content-Type: application/json" -d '{"name":"John","age":32}' http://localhost:3000/api/users
