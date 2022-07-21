# frozen_string_literal: true

class Finity < ApplicationRecord
  belongs_to :post
  belongs_to :tag
end
