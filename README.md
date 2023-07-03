# How to create step by step
this is a test about implementing the graphql over PostgreSQL Sample Database

## Setup
-go mod init 
``` #for examle
  go mod init github.com/go-related/graphql
 ```
- go get 
``` #for examle
  go get github.com/99designs/gqlgen
 ```

- generate folder structures
``` #for examle
  go run github.com/99designs/gqlgen init
 ```
- update the code after the graph/schema.grphqls changes
``` #for examle
  go run github.com/99designs/gqlgen generate
 ```


