class IO
  def read
    raise NotImplementedError, "#{self.class} has not implemented #{__method__}"
  end

  def write
    raise NotImplementedError, "#{self.class} has not implemented #{__method__}"
  end
end
