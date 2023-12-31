// Code generated by github.com/99designs/gqlgen, DO NOT EDIT.

package model

type DeleteResult struct {
	IsSuccessful bool   `json:"is_successful"`
	Error        string `json:"error"`
}

type Genre struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type NewGenre struct {
	Name string `json:"name"`
}

type UpdateGenre struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}
