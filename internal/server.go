package main

import (
	"github.com/go-related/graphql/internal/configuration"
	"github.com/go-related/graphql/internal/persistance"
	"github.com/sirupsen/logrus"
	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/go-related/graphql/graph"
)

const defaultPort = "8080"

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
	}
	db, err := persistance.NewLibraryDb(configuration.ApplicationConfiguration.DbConnectionString)
	if err != nil {
		logrus.WithError(err).Fatal("couldn't connect to db")
	}
	srv := handler.NewDefaultServer(graph.NewExecutableSchema(graph.Config{Resolvers: &graph.Resolver{
		DB: db,
	}}))

	http.Handle("/", playground.Handler("GraphQL playground", "/query"))
	http.Handle("/query", srv)

	logrus.Printf("connect to http://localhost:%s/ for GraphQL playground", port)
	logrus.Fatal(http.ListenAndServe(":"+port, nil))
}
