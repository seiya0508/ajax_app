class ApplicationController < ActionController::Base
  # Basic認証によるログインの要求は、すべてのコントローラーで行いたい。private以下にメソッドとして定義し、before_actionで呼び出しましょう。
  before_action :basic_auth

  private
  # 'admin'というユーザー名と、'password'というパスワードでBasic認証できるように設定
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == 'admin' && password == '2222'このままだどセキュリティー上ヤバイので↓
      # 環境変数を読み込む記述に変更:BASIC_AUTH_USERとBASIC_AUTH_PASSWORDという名前で、それぞれユーザー名とパスワードを定義
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]        
    end
  end
end
