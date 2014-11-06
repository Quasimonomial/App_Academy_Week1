class Array
  def two_sum
    result = []
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        result << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    result
  end
end

print [-1, 0, 2, -2, 1].two_sum
puts ''
print [-1, 1, -2, 2].two_sum

      