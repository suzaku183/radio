conf = require("config")

Sequelize = require "sequelize"
exports.sequelize = new Sequelize(conf.mysql.db_name, conf.mysql.user,conf.mysql.password)
