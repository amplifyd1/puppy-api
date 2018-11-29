require 'rails_helper'

RSpec.describe 'Likes API' do
  # Initialize the test data
  let!(:post) { create(:post) }
  let!(:likes) { create_list(:like, 20, post_id: post.id) }
  let(:post_id) { post.id }
  let(:id) { likes.first.id }

  # Test suite for GET Like
  describe 'GET /posts/:post_id/likes' do
    before { get "/posts/#{post_id}/likes" }

    context 'when posts exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all post likes' do
        expect(json.size).to eq(20)
      end
    end

    context 'when post does not exist' do
      let(:post_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end


  # Test for DELETE Like
  describe 'DELETE /posts/:id' do
    before { delete "/posts/#{post_id}/likes/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
