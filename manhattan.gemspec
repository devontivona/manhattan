Gem::Specification.new do |s|
  s.name        = 'manhattan'
  s.version     = '0.0.2'
  s.date        = '2013-04-23'
  s.summary     = "Manhattan"
  s.description = "A SASS framework for building awesome websites"
  s.authors     = ["Devon Tivona"]
  s.email       = 'devon@monospacecollective.com'
  s.files       = ["lib/manhattan.rb"]
  s.homepage    = 'http://manhattan.tivona.me'
  s.add_dependency('sass', '>= 3.2')
  s.add_dependency('bourbon', '>= 2.1')
  s.add_dependency('neat', '>= 1.4')
end