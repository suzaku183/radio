
class User
	@index: ->
		console.log "Called User index"
		return {
			path: "users/index.jade",
			data: {
				page_title: "This is user page!:"
			}
		}
	@new: ->
		console.log "Called User new"
		return {
			path: "users/new.jade"
		}

exports.User =  User
