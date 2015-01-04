Sequelize = require "sequelize"
sequelize = require("../../config/db.coffee")["sequelize"]

User = sequelize.define("users",{
	name: Sequelize.STRING,
	email: Sequelize.STRING,
})

exports.User = User
