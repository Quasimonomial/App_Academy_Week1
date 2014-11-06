class MyHashSet
  
  def initialize
    @store = Hash.new
  end
  
  def insert el
    @store[el] = true
  end
  
  def include? el
    @store.has_key? el
  end
  
  def delete el
    value = self.include? el
    @store.delete el if value
    value
  end
  
  def to_a
    @store.keys
  end
  
  def union set2
    @store.keys + set2.to_a
  end
  
  def intersect set2
    @store.keys & set2.to_a
  end
  
  def minus set2
    @store.keys - set2.to_a
  end
  
  def prints
    print self.to_a
  end
  
end






