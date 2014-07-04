require 'spec_helper'

describe App do
  include Rack::Test::Methods
  def app
    App
  end

  Capybara.app = App

  let(:url) { "http://goatse.cx" }
  let(:link) { Link.create(url: url) }

  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
  end

  it 'shortens link' do
    expect {
      post '/shorten', url: url
    }.to change(Link, :count).by(1)
  end

  it 'shortens links only once' do
    expect {
      post '/shorten', url: url
      post '/shorten', url: url
    }.to change(Link, :count).by(1)
  end

  it 'shows new link' do
    post '/shorten', url: url

    expect(last_response.body).to match("http://#{App::BASE_URL}/r\/#{Link.last.id}")
  end

  it 'redirects to URL' do
    get "/r/#{link.id}"

    expect(last_response.status).to eq(302)
    expect(last_response.header['Location']).to eq(url)
  end
end