class LRUCache
  def initialize(size)
    @cache = Array.new(size)
  end

  def count
    @cache.count{ |el| !el.nil? }
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    else
      @cache.shift
      @cache.push(el)
    end
  end

  def show
    p @cache
    nil
  end

  private

end
