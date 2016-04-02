Gem::Specification.new do |s|
  s.name                    = 'watir-load-tester'
  s.version                 = '0.0.1'
  s.executable              = 'watir-load-tester'
  s.date                    = '2012-10-23'
  s.summary                 = "Watir Load Tester"
  s.description             = "An simple tool to assist in simulating a load test"
  s.authors                 = ["enroxorz"]
  s.email                   = 'enroxorz@gmail.com'
  s.files                   = `git ls-files`.split($/)
  s.homepage                = 'https://github.com/enroxorz/watir-load-tester'
  s.license                 = 'Apache 2.0'
  s.required_ruby_version   = '>= 1.8.7'

  s.files = ["bin/watir-load-tester"]
  s.executables = ["watir-load-tester"]
  s.bindir = "bin"
  s.add_dependency('watir-webdriver')

end
