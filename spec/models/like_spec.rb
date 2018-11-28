require 'rails_helper'

RSpec.describe Like, type: :model do
 #ensure an like belongs to a post
  it { should belong_to(:post) }

  it { should validate_presence_of(:liked_by) }
end
