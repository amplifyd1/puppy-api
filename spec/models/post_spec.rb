require 'rails_helper'

#Test for Post model
RSpec.describe Post, type: :model do
#ensure Post has 1:m with Like Model
  it { should have_many(:likes).dependent(:destroy) }
#ensure columns are present before saving post
  it { should validate_presence_of(:photo) }
  it { should validate_presence_of(:created_by) }
end
