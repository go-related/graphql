package graph

import (
	"github.com/go-related/graphql/internal/persistance"
)

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

type Resolver struct {
	DB persistance.LibraryDb
}
