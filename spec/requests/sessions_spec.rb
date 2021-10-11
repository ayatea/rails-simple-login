require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  include AuthenticationHelpers

  describe 'GET /login' do
    describe 'ログイン済みの場合' do
      let(:user) { create(:user) }

      it 'レスポンスステータス302が取得されること' do
        login(user, 'password')
        get login_path
        expect(response).to have_http_status :found
      end

      it 'トップ画面へリダイレクトされること' do
        login(user, 'password')
        get login_path
        expect(response).to redirect_to :root
      end
    end

    describe '未ログインの場合' do
      it 'レスポンスステータス200が取得されること' do
        get login_path
        expect(response).to have_http_status :ok
      end

      it 'ログイン画面テンプレートが表示されること' do
        get login_path
        expect(response).to render_template :new
      end
    end
  end

  describe 'POST /session' do
    describe 'ログイン情報が正しい場合' do
      let!(:user) { create(:user) }
      let(:params) { { login_form: { login_id: user.login_id, password: 'password' } } }

      it 'レスポンスステータス302が取得されること' do
        post '/session', params: params
        expect(response).to have_http_status :found
      end

      it 'トップ画面へリダイレクトされること' do
        post '/session', params: params
        expect(response).to redirect_to :root
      end
    end

    describe 'ログイン情報に誤りがある場合' do
      let!(:user) { create(:user) }
      let(:params) { { login_form: { login_id: user.login_id, password: 'hogehoge' } } }

      it 'レスポンスステータス302が取得されること' do
        post '/session', params: params
        expect(response).to have_http_status :found
      end

      it 'ログイン画面へリダイレクトされること' do
        post '/session', params: params
        expect(response).to redirect_to :login
      end

      it 'エラーメッセージがフラッシュに表示されること' do
        post '/session', params: params
        expect(flash[:danger]).to eq 'ユーザーの認証に失敗しました。'
      end
    end
  end
end
