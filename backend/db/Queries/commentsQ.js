const { db } = require("./Connect.js");

const getAllCommentsForOneMovie = (req, res, next) => {
  let comId = parseInt(req.params.id);
  db.one(
    "SELECT image, title, comment FROM movies JOIN comments ON movies.id = comments.movie_id WHERE movie_id = $1",
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

module.exports = {
  getAllCommentsForOneMovie
};
