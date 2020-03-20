class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end

#モデル作成はrails g model (モデル名)で必ず先頭は大文字で単数形にする
#t.データ型名 :カラム名
#カラム記入後rails db:migrateを実行することによってテーブルが作成される