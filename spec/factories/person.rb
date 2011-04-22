Factory.define(:person) do |person|
  person.sequence(:email) { |n| "davidballard#{n}@hotmail.com"}
  person.first_name("Britt")
  person.last_name("Ballard")
  person.association(:entity)
  person.association(:organization)
end