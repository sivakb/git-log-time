Gem::Specification.new do |s|
  s.name        = 'git-log-time'
  s.version     = '0.0.3'
  s.date        = '2016-10-18'
  s.summary     = 'git log time'
  s.description = 'git log time is used get time from user for each commit'
  s.authors     = ['Siva', 'Suren']
  s.executables = ["git-log-time"]
  s.email       = ['siva.kb@spritle.com', 'surendrans@spritle.com']
  s.files       = Dir["bin/*","lib/**/*", "templates/**/*"]
  s.homepage    ='https://github.com/sivakb/git-log-time'
  s.license     = 'MIT'
  s.add_dependency('dotenv-rails', '>= 1.0.2')
end