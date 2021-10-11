require 'rails_helper'

RSpec.describe 'Top', type: :request do
  include AuthenticationHelpers

  let(:user) { create(:user) }

  describe 'GET /index' do
    describe 'ログイン済みの場合' do
      it 'レスポンスステータス200が取得されること' do
        login(user, 'password')
        get root_path
        expect(response).to have_http_status :ok
      end

      it 'index(トップ画面)テンプレートが表示されること' do
        login(user, 'password')
        get root_path
        expect(response).to render_template :index
      end
    end

    describe '未ログインの場合' do
      it 'レスポンスステータス302が取得されること' do
        get root_path
        expect(response).to have_http_status :found
      end

      it 'ログイン画面へリダイレクトされること' do
        get root_path
        expect(response).to redirect_to :login
      end
    end
  end
end
