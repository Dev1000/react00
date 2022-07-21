# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :finities
  has_many :posts, through: :finities
end
