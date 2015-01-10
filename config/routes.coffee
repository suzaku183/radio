
#ルーティングを記載する
#ルーティングはハッシュで記述します。
#キーにはルーティングをそのまま記述します。
#バリューは配列で第一にコントローラ、第二にメソッド名を記載します。

routes = {
	"/": ["home","index"],


	"/foundation": ["company","index"],
	"/privacy": ["company","privacy"],


	"/channels": ["channel","index"],

	"/listen": ["listen","index"],
	"/listen/unegi": ["listen","unegi"],


	"/users": ["users","index"],
	"/users/new": ["users","new"],
	"/users/create": ["users","create"],
	"/users/login": ["users","login"],
	"/users/sign_in": ["users","sign_in"],

	"/artists/unegi": ["artists","unegi"],

	
	"/control": ["control","index"]
}


exports.routes = routes
