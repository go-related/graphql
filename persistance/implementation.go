package persistance

import (
	"context"
	"github.com/go-related/graphql/model"
)

func (l *libraryDb) CreateBook(ctx context.Context, data model.Book) (model.Book, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) UpdateBook(ctx context.Context, data model.Book) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) DeleteBook(ctx context.Context, Id uint) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetAllBooks(ctx context.Context) ([]*model.Book, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetBookById(ctx context.Context, Id uint) (*model.Book, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) CreateSubscriber(ctx context.Context, data model.Subscriber) (model.Subscriber, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) UpdateSubscriber(ctx context.Context, data model.Subscriber) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) DeleteSubscriber(ctx context.Context, Id uint) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetAllSubscribers(ctx context.Context) ([]*model.Subscriber, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetSubscriberById(ctx context.Context, Id uint) (*model.Subscriber, error) {
	//TODO implement me
	panic("implement me")
}

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
