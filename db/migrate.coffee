Sequelize = require('sequelize')
sequelize = require("../config/db.coffee")["sequelize"]

User = sequelize.define("user",{
	name: Sequelize.STRING,
	email: Sequelize.STRING
})
Admin = sequelize.define("admin",{
	name: Sequelize.STRING,
	email: Sequelize.STRING,
	password: Sequelize.STRING
})





sequelize.sync()

