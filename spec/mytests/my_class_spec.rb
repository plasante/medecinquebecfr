require 'spec_helper'
require 'module_test'

describe "MyTest" do
  it "should respond to hello" do
    my_class = ModuleTest::MyClass.new
    my_class.should respond_to(:hello)
  end
  
  it "hello class should return 'Hello World!'" do
    my_class = ModuleTest::MyClass.new
    my_class.hello.should == 'Hello World!'
  end
end
