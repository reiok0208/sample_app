Rails.application.routes.draw do
  #routing（ルーティング）では、ユーザが特定のURLにアクセスしたときに、どのコントローラのどのアクションに処理を振り分けるかを定義します。
  #ルーティングは、URLとアクションを結びつける役目をしています。
  #たとえば、「あるURLにアクセスがあったときに、rootコントローラのtopアクションの処理を振り分ける」定義を、ルーティングに記述します。

  #ユーザーがリクエストしたとき一番最初に通る場所
  #HTTPメソッド 'URL' => 'コントローラ#アクション'
  get 'top' => 'homes#top' #GETは、<a>タグで画面遷移する場合に使う
  #topをリクエストされたからhomesコントローラのtopアクションに移動


  get 'todolists/new'
  post 'todolists' => 'todolists#create' #POSTは、<form>タグ等でデータ送信する場合に使う。

  get 'todolists' => 'todolists#index'
  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  #as~ 名前付きルートとは_pathや_urlなどを使ってリンク先のURLを指定するヘルパーです。
  #as~ 'todolists#show'の設定を、todolist(短縮url)として利用できる？？？
  # :idは　.../todolists/1 や .../todolists/3 に該当する

  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  #更新の場合はpatch
end
