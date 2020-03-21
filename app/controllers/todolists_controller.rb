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
        redirect_to todolist_path(list.id) # 詳細画面へリダイレクト
  end

  def index
  	    #データベース内のすべてのデータを取り出すには、Listモデルに対して.allメソッドを使います。
  	    @lists = List.all
  	    #このインスタンス変数には、すべてのデータが取り出されて格納されるため、インスタンス変数名を複数形にしています。
  end

  def show
  	    @list = List.find(params[:id])
  	    #たとえば、URLが/todolist/1の場合、params[:id] と記述すると、id==1を取り出せます。
  	    #id==1のデータをfindメソッドを利用してデータベースから取得し、@listへ格納します。
  	    #インスタンス変数を経由することでControllerからViewへ変数を渡すことができます。
  	    #paramsとはRailsで送られてきた値を受け取るためのメソッドです。
  	    #送られてくる情報(リクエストパラメータ)は主に、getのクエリパラメータとPostでformを使って送信されるデータの2つです。
  end

  def edit
  	    @list = List.find(params[:id])
  end

  def update
  	    list = List.find(params[:id])
        list.update(list_params)
        redirect_to todolist_path(list.id)
  end


  private

  def list_params
        params.require(:list).permit(:title, :body, :image)
        #params.require(:モデル名).permit(:カラム名１, :カラム名２...)
        #ストロングパラメータは、フォームの入力値をコントローラのcreateやupdateに渡す役割があります。
        #requireでデータのオブジェクト名(ここでは:list)を指定し、permitでキー(:title,:body)を指定しています。
        #これにより、list_paramsの中にフォームで入力されたデータが格納されます。
  end

end
