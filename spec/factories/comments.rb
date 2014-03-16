FactoryGirl.define do
  factory :comment do
   sequence :commenter do |n|
     "commenter #{n}"
   end
   sequence :body do |n|
     "This is the comment number #{n}"
   end
   post
  end
end
