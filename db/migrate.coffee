Sequelize = require('sequelize')
sequelize = require("../config/db.coffee")["sequelize"]

User = sequelize.define("user",{
	name: Sequelize.STRING,
	email: {
		type: Sequelize.STRING,
		unique: true
	}
})
Admin = sequelize.define("admin",{
	name: Sequelize.STRING,
	email: {
		type: Sequelize.STRING,
		unique: true
	},
	password: Sequelize.STRING
})





sequelize.sync()

