var express = require("express");
var router = express.Router();
const { getAllCommentsForOneMovie } = require("../db/Queries/commentsQ.js");

router.get("/:id", getAllCommentsForOneMovie);

module.exports = router;
