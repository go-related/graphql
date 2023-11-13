package persistance

import (
	"context"
	"github.com/go-related/graphql/model"
)

func (l *libraryDb) Subscribe(ctx context.Context, subscriberID uint, listOfBooks []model.Book, listOfAuthors []model.Author) (*model.Subscribe, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) DeleteSubscribe(ctx context.Context, Id uint) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetAllSubscribes(ctx context.Context) ([]*model.Subscribe, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetSubscribeById(ctx context.Context, Id uint) (*model.Subscribe, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetAuthorsSubscribers(ctx context.Context, listOfAuthors []model.Author) ([]*model.Subscriber, error) {
	//TODO implement me
	panic("implement me")
}
