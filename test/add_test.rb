require 'pad_utils'

puts
name = PadUtils.question_menu("How do you want to name your test?")
name = PadUtils.sanitize name

underscored = PadUtils.underscore name
camel = PadUtils.camel_case underscored
file_name = "units/#{underscored}_test.rb"

PadUtils.copy_file("template/template.rb", file_name)
PadUtils.replace_in_file(file_name, /CLASS_TEST_NAME/, "#{camel}Test")
PadUtils.replace_in_file(file_name, /TEST_NAME/, camel)

puts
