require 'opal'
require 'therubyracer'

class OpalRacer
  VERSION = '0.2.0'

  def self.opal_build
    @opal_build ||= Opal::Builder.new.build('opal').to_s
  end

  def initialize
    @builder = Opal::Builder.new
    @v8 = V8::Context.new
    @v8['console'] = self
    @v8.eval self.class.opal_build
  end

  def log(*str)
    puts(*str)
  end

  def eval_ruby(ruby, file: nil)
    file ||= __FILE__
    @v8.eval Opal::Builder.new.build_str(ruby, file)
  end
end
