FactoryGirl.define do
  factory :organization do
    name('britton\'s organization')
    address_line_one('3800 Commerce')
    address_line_two('203')
    city('Dallas')
    state('Texas')
    postal_code('75226')
  end
end