# Evaluate a prefix in Ruby
A Ruby program that evaluates prefix notation expressions

## Task description

Write a program to evaluate a prefix notation string.
Input operators `+ * - /`.
Numbers are all positive integers only.
For any such a string the program should return one number which is the result of the calculation.

Example:

```
"9" => 9
"+ 1 2" => 3 (1 + 2)
"+ + 1 2 30" => 33 ((1+2)+30)
"+ + 12 16 * 10 4" => 68 ((12+16)+(10*4))
```

The program needs to terminate and yield the result for valid input only, so you can omit any error handling.
The formula in parenthesis is just an explanation how the result has been calculated and is not part of the result the program has to provide.

## Usage

- Clone the repository
- Run `bundle install`
- Uncomment test cases in the `prefix_evaluator.rb` file
- Run `ruby prefix_evaluator.rb` on your terminal

## Test

```bash
rspec prefix_evaluator_spec.rb
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
