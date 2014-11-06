class Array
  def my_uniq
    new_array = []
    self.each do |i|
      new_array << i unless new_array.include?(i)
    end
    new_array
  end
end
