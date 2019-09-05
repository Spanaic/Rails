class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create

    list = List.new(list_params)
    # Listモデルから新規作成のメソッドが実行される→dbに入力内容が追加されたレコードを作成
    # 作成されたカラムはストロングパラメータのみ
    list.save
    redirect_to todolist_path(list.id)

  end
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  # 保存ボタンが押された段階で、
  # 1.dbからidを見つける。
  # 2. dbをストロングパラメータの範囲内で上書き処理。
  # 3.showアクションへとリダイレクト。各idのtodolist_path(routeで指定されたshowへの名前付きルート)

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end
  
  private

  def list_params
      params.require(:list).permit(:title, :body, :image)
  end
  
end
