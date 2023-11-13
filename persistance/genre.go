package persistance

import (
	"context"
	"github.com/go-related/graphql/model"
	"github.com/sirupsen/logrus"
)

func (l *libraryDb) CreateGenre(ctx context.Context, data model.Genre) (model.Genre, error) {
	result := l.Db.Model(&model.Genre{}).Create(&data)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't create the genre")
	}
	return data, result.Error
}

func (l *libraryDb) UpdateGenre(ctx context.Context, data model.Genre) error {
	currentData, err := l.GetGenresById(ctx, data.ID)
	if err != nil {
		return err
	}
	currentData.Name = data.Name
	result := l.Db.Save(currentData)
	if result.Error != nil {
		logrus.WithError(result.Error).WithField("id", data.ID).Error("Error updating genre")
	}
	return result.Error
}

func (l *libraryDb) DeleteGenre(ctx context.Context, Id uint) error {
	currentData, err := l.GetGenresById(ctx, Id)
	if err != nil {
		return err
	}
	result := l.Db.Delete(&currentData)
	if result.Error != nil {
		logrus.WithError(result.Error).WithField("id", Id).Error("Error deleting genre")
	}
	return nil
}

func (l *libraryDb) GetAllGenres(ctx context.Context) ([]*model.Genre, error) {
	var outputList []*model.Genre
	result := l.Db.Model(&model.Genre{}).Find(&outputList)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load genres")
	}
	return outputList, result.Error
}

func (l *libraryDb) GetGenresById(ctx context.Context, Id uint) (*model.Genre, error) {
	var output model.Genre
	result := l.Db.Model(&model.Genre{}).First(&output, Id)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load genre")
	}
	return &output, result.Error
}
