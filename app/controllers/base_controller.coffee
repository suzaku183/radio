
#すべてのクラスが継承するべきコントローラー
class Base
	
	#CSRF対策用のメソッド
	#ランダムな文字列を生成して他のブラウザからの怪しい攻撃かどうかを見極める
	@createHash:->
		return "guivgbyo84bt5rwi782yw9dugbc478otwevxfywbowqv"
	
	@set_token: (res) ->
		res.setHeader("Set-Cookie",@create_hash())

exports.Base = Base
