class UsersController < ApplicationController
  def index #ユーザーを一覧表示する画面   HTTPメソッド get
    @users = User.all   #ここでは、allメソッドでUserモデルよりusersテーブルのレコードを全て@usersに格納しています。
  end

  def new #ユーザーを新規登録する画面   HTTPメソッド get
    @user = User.new
  end

  def create #ユーザーをDBに登録する処理   HTTPメソッド post
    @user = User.new(params.require(:user).permit(:title, :startday, :endday, :shuujitu, :memo))   # params.require(:モデル名).permit(:カラム名)で入力した情報を取得をします。 直接的にユーザーから受け取ったparamsにないが、レコード作成時に追加したい値はmergeメソッドで追加します。　params.require(:モデル名).permit(:カラム名1,:2,,,).merge(カラム名: 追加したいデータ値)
    if @user.save
      flash[:notice] = "スケジュールを新規登録しました。"
      redirect_to :users
    else
      render "new"
    end
  end

  def show #ユーザー情報を確認する画面   HTTPメソッド get
    @user = User.find(params[:id])
  end

  def edit #ユーザー情報を編集する画面   HTTPメソッド get
    @user = User.find(params[:id])
  end

  def update #ユーザー情報を更新する処理   HTTPメソッド patch
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :startday, :endday, :shuujitu, :memo))
      flash[:notice] = "ユーザーIDが「#{@user.id}」のスケジュール情報を更新しました"
      redirect_to :users
    else
        render "edit"
    end
  end

  def destroy #ユーザー情報を削除する処理   HTTPメソッド delete
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "スケジュールを削除しました。"
    redirect_to :users
  end
end