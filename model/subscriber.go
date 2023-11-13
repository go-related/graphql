package model

import "gorm.io/gorm"

type Subscriber struct {
	gorm.Model
	Email    string
	FullName string
}
