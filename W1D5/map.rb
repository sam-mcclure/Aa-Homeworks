class Map

  def initialize
    @mvar = []
  end

  def set(key, value)
    if @mvar.any? {|pair| pair[0] == key}
      @mvar.each do |pair|
        if pair[0] == key
          pair[1] = value
        end
      end

    else
      @mvar << [key, value]
    end
  end

  def get(key)
    if @mvar.any? {|pair| pair[0] == key}
      @mvar.each do |pair|
        if pair[0] == key
          return pair[1]
        end
      end

    else
      nil
    end
  end

  def delete(key)
    if @mvar.any? {|pair| pair[0] == key}
      @mvar.each_with_index do |pair, idx|
        if pair[0] == key
          @mvar = @mvar.take(idx) + @mvar.drop(idx + 1)
          return @mvar
        end
      end

    else
      nil
    end
  end

  def show
    @mvar
  end

end
