require 'opal'
require 'therubyracer'

class OpalRacer
  VERSION = '0.1.0'

  def initialize
    @builder = Opal::Builder.new

    @v8 = V8::Context.new
    @v8['console'] = self
    @v8.eval Opal::Builder.new.build('opal').to_s
  end

  def log(*str)
    puts(*str)
  end

  def eval_ruby(str)
    code = Opal::Builder.new.build_str(str, '(irb)', :irb => true, :const_missing => true)
    code.processed[0...-1].each{ |c| @v8.eval(c.to_s) }
    @v8.eval "var $_result = #{code.processed.last.to_s} ($_result == null ? 'nil' : $_result.$inspect());"
  rescue => e
    puts "#{e.message}\n\t#{e.backtrace.join("\n\t")}"
  end
end
