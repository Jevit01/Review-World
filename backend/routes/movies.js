var express = require("express");
var router = express.Router();
const {
  getOneMovie,
  getAllMovies,
  getAllMovieInfo,
  getAllMoviesWithRatings,
  getMovieByGenre
} = require("../db/Queries/moviesQ.js");

router.get("/", getAllMovies);
router.get("/info", getAllMovieInfo);
router.get("/ratings", getAllMoviesWithRatings);
router.get("/genre/:id", getMovieByGenre);
router.get("/:id", getOneMovie);

module.exports = router;
