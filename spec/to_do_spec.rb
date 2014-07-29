require 'rspec'
require 'task'
require 'list'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('Buy Dog')
    test_task.should be_an_instance_of Task
  end
  it 'lets you read the description out' do
    test_task = Task.new('Buy Dog')
    test_task.description.should eq 'Buy Dog'
  end
end
describe List do
  it "creates and empty list of tasks" do
    test_list = List.new("home")
    test_list.tasks.should eq []
end

it "adds tasks" do
  test_list = List.new("Home")
  test_task = Task.new("Buy Dog")
  test_list.add_task(test_task)
  test_list.tasks.should eq [test_task]
  end
end
