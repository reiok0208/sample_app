class List < ApplicationRecord
	attachment :image
	#attachment（アタッチメント）メソッドとは、refileが指定のカラムにアクセスするために必要です。
	#これによりDBに存在する画像を取得したりアップロードが可能となります。
    #カラム名はimage_idですが、ここでは_idをつけません。
end
