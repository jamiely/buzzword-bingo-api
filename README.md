# Intro

For use with the BuzzwordBingo application

# Running

Tested with Ruby 1.9.3

```bash
bundle install
foreman start
```

# Routes

The base url is `/api/v0.1`.

## GET /lists

Returns an array of list names

## GET /lists/:name

Returns a JSON object like:

```javascript
{
  "name": "list name",
  "words": [ "word1", "word2" ]
}
```

# Examples


```bash
curl -v localhost:5000/api/v0.1/lists
```

Returns

```javascript
[
  "States",
  "State Capitals",
  "...",
  "Time's Top 100 Books",
  "Greek Mythology",
  "Metaphysicians"
]
```

```bash
curl -v localhost:5000/api/v0.1/lists/States
```

Returns

```javascript
{
  "name": "States",
  "words": [
    "Alabama",
    "Alaska",
    "American Samoa",
    "Arizona",
    "Arkansas",
    "...",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming"
  ]
}
```

# Troubleshooting

Problems installing event machine?

```
bundle config build.eventmachine \
  --with-cppflags=-I$(brew --prefix openssl)/include
```

