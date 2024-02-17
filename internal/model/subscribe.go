package model

import "gorm.io/gorm"

type Subscribe struct {
	gorm.Model
	SubscriberID uint
	Books        []Book   `gorm:"many2many:subscribe_book;"`
	Authors      []Author `gorm:"many2many:subscribe_author;"`
}
