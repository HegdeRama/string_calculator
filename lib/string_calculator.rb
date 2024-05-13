class StringCalculator
  def self.add(numbers)
    # Return 0 for empty string
    return 0 if numbers.empty?

    # Split numbers based on default delimiters
    num_list = get_numbers(numbers)
    # Convert strings to integers and sum them
    num_list.sum(&:to_i)
  end

  private
    def self.get_numbers(nums)
      if nums.start_with?('//')
        new_del = nums.split(/\/\/|\n/)[1]
        delimiter = "\n|#{new_del}"
        final_arr = nums.split(Regexp.new(delimiter))[2..-1]
      else
        delimiter = "\n|,"
        final_arr = nums.split(Regexp.new(delimiter))
        raise ArgumentError, "Invalid input" if invalid_num?(final_arr[-1])
        final_arr
      end
    end

    def self.invalid_num?(num)
      num != "0" && num !~ /\A\d+\z/
    end
end