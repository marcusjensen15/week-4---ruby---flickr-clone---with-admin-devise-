FactoryBot.define do

  factory(:user) do
    email {'steve@steve.steven'}
    password {'password'}
  end

end
# 
# describe User do
#   it 'steve is steve' do
#     user = FactoryBot.create(:user)
#     user.email.should eq 'steve@steve.steven'
#   end
# end
