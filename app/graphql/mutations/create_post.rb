# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    argument :user_id, ID, required: true
    argument :title, String, required: true
    argument :body, String, required: false

    type Types::PostType

    def resolve(user_id: nil, title: nil, body: nil)
      Post.create!(user_id: user_id, title: title, body: body)
    end
  end
end
