package graph

import (
	"github.com/go-related/graphql/graph/model"
	dbmodel "github.com/go-related/graphql/model"
)

func convertGenreToDbModel(genre model.UpdateGenre) *dbmodel.Genre {
	item := dbmodel.Genre{
		Name: genre.Name,
	}
	item.ID = uint(genre.ID)
	return &item
}

func convertNewGenreToDbModel(genre model.NewGenre) *dbmodel.Genre {
	return &dbmodel.Genre{
		Name: genre.Name,
	}
}
func convertGenreToGraphQLModel(genre dbmodel.Genre) *model.Genre {
	return &model.Genre{
		Name: genre.Name,
		ID:   int(genre.ID),
	}
}
func convertDeleteToGraphQLModel(err error) *model.DeleteResult {
	result := model.DeleteResult{
		IsSuccessful: true,
	}
	if err != nil {
		result.IsSuccessful = false
		result.Error = err.Error()
	}
	return &result
}
