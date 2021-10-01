require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /new' do
    it 'レスポンスステータス200が取得されること' do
      get root_path
      expect(response).to have_http_status :ok
    end

    it 'new(ログイン画面)テンプレートが表示されること' do
      get root_path
      expect(response).to render_template :new
    end
  end
end
