package persistance

import (
	"context"
	"github.com/go-related/graphql/model"
)

func (l *libraryDb) CreateAuthor(ctx context.Context, data model.Author) (model.Author, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) UpdateAuthor(ctx context.Context, data model.Author) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) DeleteAuthor(ctx context.Context, Id uint) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetAllAuthors(ctx context.Context) ([]*model.Author, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetAuthorById(ctx context.Context, Id uint) (*model.Author, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) CreateGenre(ctx context.Context, data model.Genre) (model.Genre, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) UpdateGenre(ctx context.Context, data model.Genre) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) DeleteGenre(ctx context.Context, Id uint) error {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetAllGenres(ctx context.Context) ([]*model.Genre, error) {
	//TODO implement me
	panic("implement me")
}

func (l *libraryDb) GetGenresById(ctx context.Context, Id uint) (*model.Genre, error) {
	//TODO implement me
	panic("implement me")
}

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
