require "rspec"
require_relative "prefix_evaluator"

RSpec.describe "evaluate given expression" do
  # Given test cases
  input_1 = "9"                 # => 9
  input_2 = "+ 1 2"             # => 3 (1 + 2)
  input_3 = "+ + 1 2 30"        # => 33 ((1+2)+30)
  input_4 = "+ + 12 16 * 10 4"  # => 68 ((12+16)+(10*4))

  # Custom test cases:
  subtraction = "- 10 5"                    # => (10-5 = 5)
  multiplication = "* 6 7"                  # => (6*7 = 42)
  division = "/ 15 3"                       # => (15/3 = 5)
  mixed_operation_1 = "* + 2 3 4"           # => (2+3)*4 = 20
  mixed_operation_2 = "- * 5 6 + 2 1"       # => (5*6)-(2+1) = 27
  mixed_operation_3 = "+ * 3 4 / 10 2"      # => (3*4)+(10/2) = 17

  # Validation test cases
  zero_number = "+ 0 5"
  negative_number = "- 10 -5"
  non_number = "+ a 5"
  invalid_operator_1 = "% 10 2"
  invalid_operator_2 = "^ 2 3"
  invalid_operator_3 = "+ * 3 4 & 10 2"

  context "when valid expression" do
    it "returns evaluated result from given test cases"  do
      expect(evaluate_prefix(input_1)).to eql(9)
      expect(evaluate_prefix(input_2)).to eql(3)
      expect(evaluate_prefix(input_3)).to eql(33)
      expect(evaluate_prefix(input_4)).to eql(68)
      expect(evaluate_prefix(input_4)).not_to eql(69)
    end

    it "returns evaluated result of custom test cases" do
      expect(evaluate_prefix(subtraction)).to eql(5)
      expect(evaluate_prefix(multiplication)).to eql(42)
      expect(evaluate_prefix(division)).to eql(5)
      expect(evaluate_prefix(mixed_operation_1)).to eql(20)
      expect(evaluate_prefix(mixed_operation_2)).to eql(27)
      expect(evaluate_prefix(mixed_operation_3)).to eql(17)
    end
  end

  context "when invalid expression" do
    it "return 'nil' if there is non positive or non-number exists" do
      expect(evaluate_prefix(negative_number)).to eql(nil)
      expect(evaluate_prefix(zero_number)).to eql(nil)
      expect(evaluate_prefix(non_number)).to eql(nil)
    end

    it "returns 'nil' if there is invalid operator exists" do
      expect(evaluate_prefix(invalid_operator_1)).to eql(nil)
      expect(evaluate_prefix(invalid_operator_2)).to eql(nil)
      expect(evaluate_prefix(invalid_operator_3)).to eql(nil)
    end
  end
end
