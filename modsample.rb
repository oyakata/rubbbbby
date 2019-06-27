class Hello
  def hello
    puts 'Hello, world.'
  end
end

class Foo < Hello
  def initialize(id, name, age)
    @id = id
    @name = name
    @age = age
  end

  def hello_world
    hello
    puts "[Foo] #{@id}, #{@name}, #{@age}"
  end
end

module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Loggable::Foo < Hello
  include Loggable # こんな紛らわしいことするのか・・？

  def initialize(id, name, age)
    @id = id
    @name = name
    @age = age + 20
  end

  def hello_world
    hello
    log('call hello_world')
    puts "[Loggable::Foo] #{@id} -> #{@name} -> #{@age}"
  end
end

foo = Foo.new(10, 'Horatio Nelson', 47)
foo.hello_world
# Hello, world.
# [Foo] 10, Horatio Nelson, 47

f2 = Loggable::Foo.new(22, 'Isac Newton', 84)
f2.hello_world
# Hello, world.
# [LOG] call hello_world
# [Loggable::Foo] 22 -> Isac Newton -> 104
