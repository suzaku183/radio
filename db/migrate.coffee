Sequelize = require('sequelize')
sequelize = require("../config/db.coffee")["sequelize"]

User = sequelize.define("user",{
	name: Sequelize.STRING,
	email: {
		type: Sequelize.STRING,
		unique: true
	},
	password: {
		type: Sequelize.STRING,
		allowNull: false
	}
})

Admin = sequelize.define("admin",{
	name: Sequelize.STRING,
	email: {
		type: Sequelize.STRING,
		unique: true
	},
	password: {
		type: Sequelize.STRING,
		allowNull: false
	}
})





sequelize.sync({
	force: true
})

