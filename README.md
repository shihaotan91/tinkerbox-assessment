## TO DO LIST ORGANISER

This is a simple shell application that allows user to store and maintain a TODO LIST. After choosing their input and output files(.csv), users can view, add, delete and tag actions to their TODOLIST through a command line interface.

This application is an assessment during my internship at Tinkerbox.
The requirements of the assessment can be found [HERE](https://gist.github.com/gohdaniel15/192bc903d590faaefa08fff4e92899b6)

## Getting started

Go to the directory of your choice, clone the project, run `cd tinkerbox-assessment` then `ruby main.rb` to start the program.

```
git clone git@github.com:shihaotan91/tinkerbox-assessment.git
cd tinkerbox-assessment
ruby main.rb
```

## Branch Policy

* `feature/<branch_name>` for substantial new feature or function
* `maintenance/<branch_name>` for refactoring and maintaining an existing feature
* `bugfix/<branch_name>` for bug fixes and touch ups

## User Flow Diagram

User Flow Diagram of the assessment can be found [HERE](http://i.imgur.com/JbNbtWB.jpg)

## Technical implementation explanations

### USING MODULES

As the project grew larger, I decided to use `MODULES` to manage the methods in a meaningful way. For example, the methods `find_files`, `show_input_file` and `show_selection` in `./modules/find_files` all pertains to locating or displaying the contents of the CSV file. Similarly, the methods in `./modules/actions` all pertains to editing a CSV row once you've selected it.

### WHY NOT CLASS

I used `MODULES` instead of `CLASS` because...
* There are no unique singleton methods used that requires it's parent to be instantiated
* Most of the methods are params-less and doesn't need to inherit anything from it's parent
* Because of 1 and 2 there is no need to create an object and keep track of it's state

Another reason why I avoided using class is because to pass down an instance variable from a module to a class, it requires the class to be initialized(I think...). This could be bypassed by making the methods of a class class methods and then passing the module's instance variable directly to it as a param. However, due to frequent recursive calls that happens in the app, this is not ideal.  

### RECURSIVE CALLS

A recursive call happens whenever the user keys in an invalid command at any stage of the app. Because of this, I avoided passing in params into most of the methods to prevent the code from looking clunky.

For example, if the methods in the `commands.rb` file needed params, the file could look like this.

```
def add_item(params1, params2)
  ...
  perform_command(params1, params2)
end

def perform_command(params1, params2)
  ...
  elsif (command == 'add')
    add_item(params1, params2)
  else
    puts "You entered an invalid command"
    perform_command(params1, params2)
  end
end
```
### BREAKING DOWN METHODS

I tried my best to break down methods while keeping their names explicit to what it does. There are still a handful of functions that can be combined or optimized, however I feel that would only obscure it's role in the app.

For example, I considered changing the `find_files` method in `./modules/find_files` to look like

```
def find_files(file_type)
  ...
  if (File.file?(file_name) && file_type =='input')
    @input = file_name
    find_files('output')
  elsif (File.file?(file_name) && file_type =='output')
    @output = file_name
    return
  ...  
end
```

So that it only needs to be called once instead of twice with different params in `main.rb`. However, I decided against it because it obscures the function.

### SCOPING VARIABLES

Variables are named and scoped correctly for its intended uses.

For example, in `./modules/actions.rb`

* The variables in @@actions_array are all in CAPS because they are constant variables that are not meant to be changed.
* @@actions_array and @@action_number are both class variables because they need not be used outside the module.
* @input and @selection_number are the only two instance variable in the whole app because they are used in many places.
* There are no global variables in the app.

### CASE VS IF/ELSE

With many conditions/cases, case has better performance than if/else statements since if your condition is queued at the end of the if/else chain, it requires every prior condition to be evaluated before hitting it.

However, given that my longest if/else statement only has 4 conditions, the difference in performance is negligible. In the end I choose to use what I'm more familiar with.

### SED VS AWK

This is my time manipulating CSV/Text files through command line. After doing some research, I found out that the two most common ways to do so is `sed` and `awk`.

Given the time constraint, I went with `sed` because its syntax is easier to understand.  
