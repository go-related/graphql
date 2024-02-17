package persistance

import (
	"context"
	"github.com/go-related/graphql/internal/model"
	"github.com/sirupsen/logrus"
)

func (l *libraryDb) CreateSubscriber(ctx context.Context, data model.Subscriber) (model.Subscriber, error) {
	result := l.Db.Model(&model.Subscriber{}).Create(&data)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't create the subscriber")
	}
	return data, result.Error
}

func (l *libraryDb) UpdateSubscriber(ctx context.Context, data model.Subscriber) error {
	currentData, err := l.GetSubscriberById(ctx, data.ID)
	if err != nil {
		return err
	}
	currentData.FullName = data.FullName
	currentData.Email = data.Email
	result := l.Db.Save(currentData)
	if result.Error != nil {
		logrus.WithError(result.Error).WithField("id", data.ID).Error("Error updating subscriber")
	}
	return result.Error
}

func (l *libraryDb) DeleteSubscriber(ctx context.Context, Id uint) error {
	currentData, err := l.GetSubscriberById(ctx, Id)
	if err != nil {
		return err
	}
	result := l.Db.Delete(&currentData)
	if result.Error != nil {
		logrus.WithError(result.Error).WithField("id", Id).Error("Error deleting subscriber")
	}
	return nil
}

func (l *libraryDb) GetAllSubscribers(ctx context.Context) ([]*model.Subscriber, error) {
	var outputList []*model.Subscriber
	result := l.Db.Model(&model.Subscriber{}).Find(&outputList)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load subscribers")
	}
	return outputList, result.Error
}

func (l *libraryDb) GetSubscriberById(ctx context.Context, Id uint) (*model.Subscriber, error) {
	var output model.Subscriber
	result := l.Db.Model(&model.Subscriber{}).First(&output, Id)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load subscriber")
	}
	return &output, result.Error
}
