Factory.define(:database_server) do |ds|
  ds.name('The Database Server')
  ds.description('My db server!')
  ds.association(:entity)
end