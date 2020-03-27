module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i+=1
    end
    self
  end

  def my_each_with_index
    i = 0 
    while i < self.size
      yield(self[i], i)
      i+=1
    end
    self
  end

  def my_select
    i = 0
    cleanArr = []
    while i < self.size
      if (yield(self[i]))
        cleanArr << self[i]
      end
      i+=1
    end
    cleanArr
  end

  def my_all?
    i = 0
    while i < self.size
      if yield(self[i]) == false
        return false
      end
      i+=1
    end
    return true
  end

  def my_any?
    i = 0
    while i < self.size
      if yield(self[i])
        return true
      end
      i+=1
    end
    return false
  end

  def my_none?
    i = 0
    while i < self.size
      if yield(self[i])
        return false
      end
      i+=1
    end
    return true
  end

  def my_count
    i = 0 
    counter = 0 
    while i < self.size
      if yield(self[i])
        counter+=1
      end
      i += 1
    end
    return counter
  end

  def my_map(proc=nil)
    newArr = []
    i = 0 
    if proc
      while i < self.size
        newArr[i] = proc.call(self[i])
        i+=1
      end
    else
      while i < self.size
        newArr[i] = yield(self[i])
        i+=1
      end
    end
    newArr
  end

  def my_inject(go = 0)
    acum = go
    i = 0 
    while i < self.size
      acum = yield(acum, self[i])
      i+=1
    end
    acum
  end

  def multiply_els
    self.my_inject(1) do |k, x|
      k *= x
    end
  end
end