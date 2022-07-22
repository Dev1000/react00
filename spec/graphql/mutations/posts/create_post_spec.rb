# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe CreatePost, type: :request do
      describe '.resolve' do
        it 'creates a post' do
          user = create(:user)

          expect do
            post '/graphql', params: { query: query(user_id: user.id) }
          end.to change { Post.count }.by(1)
        end
      end

      def query(user_id:)
        <<~GQL
          mutation {
            createPost(
              userId: #{user_id}
              title: "A test from RSpec"
              body: "Yeah Yeah Yeah!"
            ) {
              id
              title
              body
            }
          }
        GQL
      end
    end
  end
end
