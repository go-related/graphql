package model

import "gorm.io/gorm"

type Book struct {
	gorm.Model
	Title   string
	Authors []Author `gorm:"many2many:book_authors;"`
	Genres  []Genre  `gorm:"many2many:book_genres;"`
}
