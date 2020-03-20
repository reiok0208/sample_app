class TodolistsController < ApplicationController
  def new #routes.rbのget 'todolists/new'でこのコントローラに移動
  	      #Viewへ渡すためのインスタンス変数(@list)に空のモデルオブジェクト(.new)を生成する。
  	      #@のついているインスタンス変数はビューファイルへ受け渡すことができます。
  	      #インスタンス変数の名前には、先頭に必ず@（アットマーク）を付けます。ここでは、@listという名にします。
        @list = List.new
  end

  def create
        # 脆弱性を防ぐストロングパラメーター(モデル名_params)を使用 privateにて定義
        list = List.new(list_params)
        # DBへ保存する
        list.save
        # トップ画面へリダイレクト
        redirect_to '/top'
  end


  private

  def list_params
        params.require(:list).permit(:title, :body)
        #params.require(:モデル名).permit(:カラム名１, :カラム名２...)
        #ストロングパラメータは、フォームの入力値をコントローラのcreateやupdateに渡す役割があります。
        #requireでデータのオブジェクト名(ここでは:list)を指定し、permitでキー(:title,:body)を指定しています。
        #これにより、list_paramsの中にフォームで入力されたデータが格納されます。
  end

end
