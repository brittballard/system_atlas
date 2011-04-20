Factory.define(:application_server) do |as|
  as.name('test server')
  as.description('my favorite server')
  as.association(:entity)
end