const { db } = require("./Connect.js");

const getOneMovie = (req, res, next) => {
  let movieId = parseInt(req.params.id);
  db.one("SELECT * FROM movies WHERE id=$1", [movieId])
    .then(data => {
      res.status(200).json({
        status: "Success",
        data: data,
        message: "YOU GOT A MOVIE!"
      });
    })
    .catch(err => {
      return next(err);
    });
};

const getAllMovies = (req, res, next) => {
  db.any("SELECT * FROM movies")
    .then(data => {
      res.status(200).json({
        status: "Success",
        data: data,
        message: "YOU GOT MOVIES"
      });
    })
    .catch(err => {
      return next(err);
    });
};

const getAllMovieInfo = (req, res, next) => {
  db.any(
    "SELECT movies.id, image, title, name AS genre_name, genres.id AS genre_id, AVG(ratings.stars) AS Average_Rating FROM movies JOIN genres ON movies.genre_id = genres.id JOIN ratings ON movies.id = ratings.id GROUP BY movies.id, image, title, name, genres.id"
  )
    .then(data => {
      res.status(200).json({
        status: "Success",
        data: data,
        message: "SHOW ME THE INFO"
      });
    })
    .catch(err => {
      return next(err);
    });
};

const getAllMoviesWithRatings = (req, res, next) => {
  db.any(
    "SELECT movies.id, image, title, AVG(ratings.stars) AS Average_Rating FROM movies JOIN ratings ON movies.id = ratings.id GROUP BY movies.id, image, title"
  )
    .then(data => {
      res.status(200).json({
        status: "Success",
        data: data,
        message: "SHOW ME THE RATING"
      });
    })
    .catch(err => {
      return next(err);
    });
};

const getMovieByGenre = (req, res, next) => {
  let genId = parseInt(req.params.id);
  db.any(
    "SELECT movies.id, image, name, titles FROM movies JOIN genres ON  movies.genre_id = genres.id WHERE genres.id = $1 GROUP BY movies.id, image, name",
    [genId]
  )
    .then(data => {
      res.status(200).json({
        status: "Success",
        data: data,
        message: "THE GENRE IS!"
      });
    })
    .catch(err => {
      return next(err);
    });
};

module.exports = {
  getOneMovie,
  getAllMovies,
  getAllMovieInfo,
  getAllMoviesWithRatings,
  getMovieByGenre
};
