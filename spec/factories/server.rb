Factory.define(:server) do |s|
  s.association(:organization)
  s.association(:entity)
end