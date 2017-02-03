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
    else
      @cache.shift
    end
    @cache.push(el)
  end

  def show
    p @cache
    nil
  end

  private

end
