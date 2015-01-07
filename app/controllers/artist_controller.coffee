Base = require("./base_controller.coffee")["Base"]

class Artist
	
	@unegi: (req,res)->
		path = "artists/unegi"
		Base.render(res,path,{
			title: "うねぎまり：アーティスト紹介"
		})


exports.Artist = Artist
