class LRUCache
  def initialize(n)
    @size = n
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principl
    if @cache.include?(el)
      @cache.delete(el)
    elsif count == @size
      @cache.shift
    end

    @cache.push(el)
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache.dup
  end

  private
  # helper methods go here!

end
