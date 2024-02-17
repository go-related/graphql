package persistance

import (
	"context"
	"github.com/go-related/graphql/internal/model"
	"github.com/sirupsen/logrus"
)

func (l *libraryDb) CreateAuthor(ctx context.Context, data model.Author) (model.Author, error) {
	result := l.Db.Model(&model.Author{}).Create(&data)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't create the author")
	}
	return data, result.Error
}

func (l *libraryDb) UpdateAuthor(ctx context.Context, data model.Author) error {
	currentData, err := l.GetAuthorById(ctx, data.ID)
	if err != nil {
		// we dont log here since will be logged on getbyID
		return err
	}
	currentData.PublicName = data.PublicName
	result := l.Db.Save(currentData)
	if result.Error != nil {
		logrus.WithError(result.Error).WithField("id", data.ID).Error("Error updating author")
	}
	return result.Error
}

func (l *libraryDb) DeleteAuthor(ctx context.Context, Id uint) error {
	currentData, err := l.GetAuthorById(ctx, Id)
	if err != nil {
		// we dont log here since will be logged on getbyID
		return err
	}
	result := l.Db.Delete(&currentData)
	if result.Error != nil {
		logrus.WithError(result.Error).WithField("id", Id).Error("Error deleting author")
	}
	return nil
}

func (l *libraryDb) GetAllAuthors(ctx context.Context) ([]*model.Author, error) {
	var outputList []*model.Author
	result := l.Db.Model(&model.Author{}).Find(&outputList)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load authors")
	}
	return outputList, result.Error
}

func (l *libraryDb) GetAuthorById(ctx context.Context, Id uint) (*model.Author, error) {
	var output model.Author
	result := l.Db.Model(&model.Author{}).First(&output, Id)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load author")
	}
	return &output, result.Error
}
