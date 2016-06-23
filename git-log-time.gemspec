  Gem::Specification.new do |s|
  s.name        = 'git-log-time'
  s.version     = '0.0.1'
  s.date        = '2016-06-18'
  s.summary     = 'git log time'
  s.description = 'git log time is used get time from user for each commit'
  s.authors     = ['Siva', 'Suren']
  s.email       = ['siva.kb@spritle.com', 'surendrans@spritle.com']
  s.files       = Dir["bin/*","lib/**/*", "templates/**/*"]
  s.executables = ["git-log-time"]  
  s.homepage    ='http://rubygems.org/gems/git-log-time'
  s.license     = 'MIT'
  s.add_dependency('dotenv-rails', '>=1.0.2')
end