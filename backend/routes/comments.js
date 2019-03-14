var express = require("express");
var router = express.Router();
const {
  getAllComments,
  getAllCommentsForOneMovie,
  createComment
} = require("../db/Queries/commentsQ.js");

router.get("/", getAllComments);
router.post("/", createComment);
router.get("/:id", getAllCommentsForOneMovie);

module.exports = router;
