package persistance

import (
	"context"
	model2 "github.com/go-related/graphql/internal/model"
	"github.com/sirupsen/logrus"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type LibraryDb interface {
	CreateAuthor(ctx context.Context, data model2.Author) (model2.Author, error)
	UpdateAuthor(ctx context.Context, data model2.Author) error
	DeleteAuthor(ctx context.Context, Id uint) error
	GetAllAuthors(ctx context.Context) ([]*model2.Author, error)
	GetAuthorById(ctx context.Context, Id uint) (*model2.Author, error)

	CreateGenre(ctx context.Context, data model2.Genre) (model2.Genre, error)
	UpdateGenre(ctx context.Context, data model2.Genre) error
	DeleteGenre(ctx context.Context, Id uint) error
	GetAllGenres(ctx context.Context) ([]*model2.Genre, error)
	GetGenresById(ctx context.Context, Id uint) (*model2.Genre, error)

	CreateBook(ctx context.Context, data model2.Book) (model2.Book, error)
	UpdateBook(ctx context.Context, data model2.Book) error
	DeleteBook(ctx context.Context, Id uint) error
	GetAllBooks(ctx context.Context) ([]*model2.Book, error)
	GetBookById(ctx context.Context, Id uint) (*model2.Book, error)

	CreateSubscriber(ctx context.Context, data model2.Subscriber) (model2.Subscriber, error)
	UpdateSubscriber(ctx context.Context, data model2.Subscriber) error
	DeleteSubscriber(ctx context.Context, Id uint) error
	GetAllSubscribers(ctx context.Context) ([]*model2.Subscriber, error)
	GetSubscriberById(ctx context.Context, Id uint) (*model2.Subscriber, error)

	Subscribe(ctx context.Context, subscriberID uint, listOfBooks []model2.Book, listOfAuthors []model2.Author) (*model2.Subscribe, error)
	DeleteSubscribe(ctx context.Context, Id uint) error
	GetAllSubscribes(ctx context.Context) ([]*model2.Subscribe, error)
	GetSubscribeById(ctx context.Context, Id uint) (*model2.Subscribe, error)
	GetAuthorsSubscribers(ctx context.Context, listOfAuthors []model2.Author) ([]*model2.Subscriber, error)
}

type libraryDb struct {
	Db *gorm.DB
}

func NewLibraryDb(connectionString string) (*libraryDb, error) {
	result := libraryDb{}
	db, err := gorm.Open(postgres.Open(connectionString), &gorm.Config{})
	if err != nil {
		logrus.WithError(err).Error("error connecting to db")
		return &result, err
	}
	err = db.AutoMigrate(&model2.Author{}, &model2.Genre{}, &model2.Subscriber{}, &model2.Book{}, &model2.Subscribe{})
	if err != nil {
		logrus.WithError(err).Error("couldn't migrate the db")
		return &result, err
	}
	result.Db = db
	return &result, nil
}
