require 'rails_helper'

RSpec.describe 'Top', type: :request do
  describe 'GET /index' do
    it 'レスポンスステータス200が取得されること' do
      get root_path
      expect(response).to have_http_status :ok
    end

    it 'index(Welcome画面)テンプレートが表示されること' do
      pending
      get root_path
      expect(response).to render_template :index
    end
  end
end
