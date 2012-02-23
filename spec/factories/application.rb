Factory.define(:application) do |app|
  app.name('test server')
  app.description('my favorite server')
  app.association(:entity)
  app.organization_id(1000)
end