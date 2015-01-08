
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


	"/users": ["user","index"],
	"/users/new": ["user","new"],
	

	"/artists/unegi": ["artist","unegi"],

	
	"/control": ["control","index"]
}


exports.routes = routes
