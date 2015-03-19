# OpalRacer

## Usage

Create a new execution context and insert some ruby:

```ruby
# test.rb
ctx = OpalRacer.new
ctx.eval_ruby('class Foo; end; puts "HELL YES"')
puts Foo
```

Now run the script:

```bash
$ ruby test.rb
HELL YES
test.rb:4:in `<main>': uninitialized constant Foo (NameError)
```

## How it Works

There's no subprocess tomfoolery going on here. And since typical Ruby
runtimes permit only one execution context, and since I've defined a
global constant 'Foo', it must be defined globally. But it isn't.

That's because OpalRuby uses [Opal](https://github.com/opal/opal) to
transpile your Ruby into JavaScript. Isolating and executing JavaScript
code within the the Ruby interpreter is easy thanks to
[therubyracer](therubyracer) and [V8](https://code.google.com/p/v8/).

Check out Opal and be amazed at how well it does at running Ruby.

## Buy WHY??!

A fair question.

When you're a responsible human, you can create code that plays well
with the rest of the world. You can avoid defining lots of globals. You
can avoid reaching into external objects and altering them. And you can
carefully manage your own dependencies. Ruby can give you no guarantees
that your code will not be affected by a rogue gem or library. Sometimes
you really just need some isolation.

OpalRacer is admittedly a silly hack, but it does allow you to make
certain guarantees about how various worlds of Ruby can interact.
