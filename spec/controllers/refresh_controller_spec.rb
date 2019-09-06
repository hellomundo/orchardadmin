require 'rails_helper'

RSpec.describe RefreshController, type: :controller do
    let(:access_cookie) { @tokens[:access] }
    let(:csrf_token) { @tokens[:csrf] }

    describe "Post #create" do 
        let(:user) { create(:user) } #factory_bot

        context 'success' do
            before do
                #set expiration time to 0 to create expired token
                JWTSessions.access_exp_time = 0
                payload = { user_id: user.id }
                session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
                @tokens = session.login
                JWTSessions.access_exp_time = 3600
            end

            it do
                request.cookies[JWTSessions.access_cookie] = access_cookie
                request.headers[JWTSessions.csrf_header] = csrf_token
                post :create
                expect(response).to be_successful
                expect(parse_json(response.body).keys.sort).to eq ['csrf']
                expect(response.cookies[JWTSessions.access_cookie]).to be_present
            end
        end

        context 'failure' do
            before do
                payload = { user_id: user.id }
                session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
                @tokens = session.login
            end

            it do
                request.cookies[JWTSessions.access_cookie] = access_cookie
                request.headers[JWTSessions.csrf_header] = csrf_token
                post :create
                expect(response).to have_http_status(401)
            end
        end
    end

end
