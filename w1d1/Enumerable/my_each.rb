class Array
  def my_each &our_block
    for i in (0...self.length)
      our_block.call(i) #calls the block
    end
    
  end
end

