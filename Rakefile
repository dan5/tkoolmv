require 'rake/clean'

COFFEES = FileList["js/**/*.coffee"]
JSS = COFFEES.ext('js')

CLEAN.include(JSS)

desc "Run rake build"
task default: :build

desc "Build coffee scripts"
multitask build: JSS

rule '.js' => '.coffee' do |t|
  sh "coffee -c #{t.source}"
end
