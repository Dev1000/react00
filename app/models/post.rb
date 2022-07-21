# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :finities
  has_many :tags, through: :finities
end
