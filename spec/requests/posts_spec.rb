require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10, user_id: user.id) }
  let(:post_id) { posts.first.id }
  let(:user_id) { user.id}
  let(:headers) { valid_headers }

  describe 'GET /users/:user_id/posts' do

    before { get "/users/#{user_id}/posts", params: {}, headers: headers }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET /users/:user_id/posts/:id' do
    before { get "/users/#{user_id}/posts/#{post_id}", params: {}, headers: headers }

    context 'when the post exists' do
      it 'returns the post' do
        expect(json).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end


    describe 'POST /users/:user_id/posts' do
     let(:valid_attributes) do
      # send json payload
      { photo: 'charlie.png', created_by: user.id.to_s }.to_json
    end

    context 'when request is valid' do
      before { post '/users/:user_id/posts', params: valid_attributes, headers: headers }

      it 'creates a post' do
        expect(json['photo']).to eq('charlie.png')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/users/:user_id/posts', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Photo can't be blank/)
      end
    end
  end


  describe 'PUT /users/:user_id/posts/:id' do
    let(:valid_attributes) { { photo: 'Lucy.png' }.to_json }

    context 'when the record exists' do
      before { put "/users/#{user_id}/posts/#{post_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /users/:user_id/posts/:id' do
    before { delete "/users/#{user_id}/posts/#{post_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
