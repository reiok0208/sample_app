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

end
