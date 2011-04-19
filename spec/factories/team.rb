Factory.define(:team) do |t|
  t.name('The Team')
  t.description('Top dawgs.')
  t.association(:entity)
end