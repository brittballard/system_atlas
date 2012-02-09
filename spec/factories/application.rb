Factory.define(:application) do |app|
  app.name('test server')
  app.description('my favorite server')
  app.association(:entity)  
end