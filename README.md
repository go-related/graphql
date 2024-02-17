# How to create step by step
this is a test about implementing the graphql over PostgreSQL Sample Database. if you want to run this application follow [prerequisites.](PREREQUISITES.md)

## Setup a New application From Scratch
- ###  Step-1 : Initialize the Module 
    like any other new project in go.
    ``` #for examle
      go mod init github.com/go-related/graphql
     ```
- ### Step-2 : Get the graph package
    In order to create a graphQl project first we need to load tha package which can be done using the command below:

    ``` #for examle
      go get github.com/99designs/gqlgen
     ```

- ### Step-3 : Initialize graph project, generate folder structures 
  this creates the graph folder and internal structures.
    ``` #for examle
      go run github.com/99designs/gqlgen init
     ```


- ### Step-4 : Add the db package and update the resolver
  I prefer to work base on interface so my application doesn't know or care on the implementation of the persistence layer.
  I recommend this way since it's compliant to solid principles, and it's easier to mock the db.
  Here this is implemented on persistance package:
    
    ``` #for examle
          type LibraryDb interface {
        CreateAuthor(ctx context.Context, data model.Author) (model.Author, error)
        UpdateAuthor(ctx context.Context, data model.Author) error
        DeleteAuthor(ctx context.Context, Id uint) error
        GetAllAuthors(ctx context.Context) ([]*model.Author, error)
        GetAuthorById(ctx context.Context, Id uint) (*model.Author, error)
    }
      type libraryDb struct {
        Db *gorm.DB
    }
    
    func NewLibraryDb(connectionString string) (LibraryDb, error){}
     ```
  and on the resolver.go (graph/resolver.go) we update the dependency 
  ``` #for examle
    package graph

    import "github.com/go-related/graphql/persistance"
  
    type Resolver struct {
    DB persistance.LibraryDb
    }

     ```
  

- ### Step-5 : Update the schema for queries and mutation
    The file can be found at graph/schema.graphqls <br>
    After adding out types/query/mutation we run the following command to update the corresponding models
    ``` #for examle
      go run github.com/99designs/gqlgen generate
     ```
  

- ### Step-6 : Run the application
  ``` #for examle
      #cd project root
      go run internal/server.go
     ```
