package persistance

import (
	"context"
	"github.com/go-related/graphql/model"
	"github.com/sirupsen/logrus"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type LibraryDb interface {
	CreateAuthor(ctx context.Context, data model.Author) (model.Author, error)
	UpdateAuthor(ctx context.Context, data model.Author) error
	DeleteAuthor(ctx context.Context, Id uint) error
	GetAllAuthors(ctx context.Context) ([]*model.Author, error)
	GetAuthorById(ctx context.Context, Id uint) (*model.Author, error)

	CreateGenre(ctx context.Context, data model.Genre) (model.Genre, error)
	UpdateGenre(ctx context.Context, data model.Genre) error
	DeleteGenre(ctx context.Context, Id uint) error
	GetAllGenres(ctx context.Context) ([]*model.Genre, error)
	GetGenresById(ctx context.Context, Id uint) (*model.Genre, error)

	CreateBook(ctx context.Context, data model.Book) (model.Book, error)
	UpdateBook(ctx context.Context, data model.Book) error
	DeleteBook(ctx context.Context, Id uint) error
	GetAllBooks(ctx context.Context) ([]*model.Book, error)
	GetBookById(ctx context.Context, Id uint) (*model.Book, error)

	CreateSubscriber(ctx context.Context, data model.Subscriber) (model.Subscriber, error)
	UpdateSubscriber(ctx context.Context, data model.Subscriber) error
	DeleteSubscriber(ctx context.Context, Id uint) error
	GetAllSubscribers(ctx context.Context) ([]*model.Subscriber, error)
	GetSubscriberById(ctx context.Context, Id uint) (*model.Subscriber, error)

	Subscribe(ctx context.Context, subscriberID uint, listOfBooks []model.Book, listOfAuthors []model.Author) (*model.Subscribe, error)
	DeleteSubscribe(ctx context.Context, Id uint) error
	GetAllSubscribes(ctx context.Context) ([]*model.Subscribe, error)
	GetSubscribeById(ctx context.Context, Id uint) (*model.Subscribe, error)
	GetAuthorsSubscribers(ctx context.Context, listOfAuthors []model.Author) ([]*model.Subscriber, error)
}

type libraryDb struct {
	Db *gorm.DB
}

func NewLibraryDb(connectionString string) (LibraryDb, error) {
	result := libraryDb{}
	db, err := gorm.Open(postgres.Open(connectionString), &gorm.Config{})
	if err != nil {
		logrus.WithError(err).Error("error connecting to db")
		return &result, err
	}
	err = db.AutoMigrate(&model.Author{}, &model.Genre{}, &model.Subscriber{}, &model.Book{}, &model.Subscribe{})
	if err != nil {
		logrus.WithError(err).Error("couldn't migrate the db")
		return &result, err
	}
	result.Db = db
	return &result, nil
}
