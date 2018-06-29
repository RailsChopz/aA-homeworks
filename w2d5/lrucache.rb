class LRUCache
  attr_reader :cache

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    cache.count
  end

  def add(el)
    if cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    elsif count >= @size
      @cache.shift
      @cache.push(el)
    else
      @cache.push(el)
    end
  end

  def show
    p @cache
    nil
  end
end
