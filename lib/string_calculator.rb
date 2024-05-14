class StringCalculator
  def self.add(numbers)
    # Return 0 for empty string
    return 0 if numbers.empty?

    num_list = get_numbers(numbers)
    sum = 0
    negative_numbers = []

    num_list.each do |n|
      number = n.to_i  # Convert n to integer

      if number < 0
        negative_numbers << number
      else
        sum += number
      end
    end

    raise ArgumentError, "Negatives not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    sum
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