# vi: ft=ruby
# frozen_string_literal: true

begin
  require 'amazing_print'
  AmazingPrint.pry!
rescue LoadError => _e
  puts 'no amazing_print :('
  begin
    require 'awesome_print'
    AwesomePrint.pry!
  rescue LoadError => _e
    puts 'no awesome_print :('
  end
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Hit Enter to repeat last command
Pry::Commands.command(/^$/, 'repeat last command') do
  pry_instance.run_command Pry.history.to_a.last
end

Pry.config.editor = 'vim'
