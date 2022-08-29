class Base
  def list
    raise NotImplementedError, "#{self.class} has not implemented #{__method__}"
  end

  def create
    raise NotImplementedError, "#{self.class} has not implemented #{__method__}"
  end
end
