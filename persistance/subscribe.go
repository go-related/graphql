package persistance

import (
	"context"
	"github.com/go-related/graphql/model"
	"github.com/sirupsen/logrus"
)

func (l *libraryDb) Subscribe(ctx context.Context, subscriberID uint, listOfBooks []model.Book, listOfAuthors []model.Author) (*model.Subscribe, error) {
	data := model.Subscribe{
		SubscriberID: subscriberID,
		Books:        listOfBooks,
		Authors:      listOfAuthors,
	}
	result := l.Db.Model(&model.Subscribe{}).Create(&data)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't create the subscribe")
	}
	return &data, result.Error
}

func (l *libraryDb) DeleteSubscribe(ctx context.Context, Id uint) error {
	currentData, err := l.GetSubscribeById(ctx, Id)
	if err != nil {
		return err
	}
	result := l.Db.Delete(&currentData)
	if result.Error != nil {
		logrus.WithError(result.Error).WithField("id", Id).Error("Error deleting subscribe")
	}
	return nil
}

func (l *libraryDb) GetAllSubscribes(ctx context.Context) ([]*model.Subscribe, error) {
	var outputList []*model.Subscribe
	result := l.Db.Model(&model.Subscribe{}).Find(&outputList)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load subscribes")
	}
	return outputList, result.Error
}

func (l *libraryDb) GetSubscribeById(ctx context.Context, Id uint) (*model.Subscribe, error) {
	var output model.Subscribe
	result := l.Db.Model(&model.Subscribe{}).First(&output, Id)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load subscribe")
	}
	return &output, result.Error
}

func (l *libraryDb) GetAuthorsSubscribers(ctx context.Context, listOfAuthors []model.Author) ([]*model.Subscriber, error) {
	var outputList []*model.Subscriber
	if len(listOfAuthors) == 0 {
		return outputList, nil
	}
	var authors []uint
	for _, author := range listOfAuthors {
		authors = append(authors, author.ID)
	}

	result := l.Db.Model(&model.Subscriber{}).
		Joins(`join subscribes s on s.subscriber_id= subscribers.id`).
		Joins(`join subscribe_author sa ON sa.subscribe_id =s.id `).
		Where(" sa.author_id in ? ", authors).Find(&outputList)
	if result.Error != nil {
		logrus.WithError(result.Error).Error("couldn't load subscribers for the authors")
	}
	return outputList, result.Error
}
