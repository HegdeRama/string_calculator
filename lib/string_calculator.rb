class StringCalculator
  def self.add(numbers)
    # Return 0 for empty string
    return 0 if numbers.empty?

    # Split numbers based on default delimiters
    num_list = numbers.strip.split(/\n|,/)
    # Convert strings to integers and sum them
    num_list.sum(&:to_i)
  end
end
