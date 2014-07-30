require './lib/task'
require './lib/list'

@list = []

def main_menu
  puts "'q' Create a List \n'z' Show Lists \n'a' Add a Task \n'l' Show Tasks \n'x' Exit."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  if main_choice == 'q'
    add_list
  elsif main_choice == 'z'
    list_lists
  elsif main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'x'
    puts "Goodbye"
    exit
  else
  puts "Sorry, that wasn't a valid option."
  end
  main_menu
end

def add_list
  puts 'Create a List.'
  user_list = gets.chomp
  @list << List.new(user_list)
  puts "Created a List"
  puts "\n\n"
  main_menu
end

def list_lists
  @list.each_with_index do |item, index|
    puts item.name
  end
  main_menu
end

def add_task
  @list.each do |item|
    puts item.name
  end
  puts "What list would you like to add a task to?"
  selected_list = gets.chomp
  @list.each_with_index do |item, index|
    if selected_list == item.name
      puts 'Enter a description of the new task.'
      user_description = gets.chomp
      puts 'Enter a priority for the new task (1 - 5)'
      user_priority = gets.chomp.to_i
      item.tasks << Task.new(user_description, user_priority)
    puts "Task added."
    puts "\n\n"
    else
    puts ".."
    end
    end
  main_menu
end

def list_tasks
  @list.each_with_index do |item, index|
    puts item.name
  end
  puts "What list would you like to see tasks for?"
    selected_list = gets.chomp

    @list.each_with_index do |item, index|
    if selected_list == item.name
      item.tasks.sort_by {|i| i.priority }#Doesn't work, does not sort
      item.tasks.each_with_index do |item2, index2|
        puts "#{item2.description} (#{item2.priority})"
      end
    else
    puts "That is not a valid list name."
    end
  end
puts "\n\n"
main_menu
end

main_menu
