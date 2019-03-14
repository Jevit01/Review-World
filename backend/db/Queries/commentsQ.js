const { db } = require("./Connect.js");

const getAllComments = (req, res, next) => {
  db.any("SELECT * FROM comments")
    .then(data => {
      res.status(200).json({
        status: "Success",
        data: data,
        message: "YOU GOT COMMENTS"
      });
    })
    .catch(err => {
      return next(err);
    });
};

const getAllCommentsForOneMovie = (req, res, next) => {
  let comId = parseInt(req.params.id);
  db.one(
    "SELECT movies.id, image, title, array_agg(distinct comments.comment) AS comments FROM comments JOIN movies ON  movies.id = comments.movie_id WHERE movies.id = $1 GROUP BY movies.id, image, title",
    [comId]
  )
    .then(data => {
      res.status(200).json({
        status: "Success",
        data: data,
        message: "COMMENT WHAT!"
      });
    })
    .catch(err => {
      return next(err);
    });
};

const createComment = (req, res, next) => {
  db.none(
    "INSERT INTO comments(comment, movie_id)VALUES(${comment}, ${movie_id})",
    req.body
  )
    .then(() => {
      res.status(200).json({
        status: "Success",
        message: "YOU MADE A COMMENT"
      });
    })
    .catch(err => {
      return next(err);
    });
};

module.exports = {
  getAllComments,
  getAllCommentsForOneMovie,
  createComment
};
