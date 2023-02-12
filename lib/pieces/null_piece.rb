require 'singleton'

class NullPiece
  # instead of calling new on NullPiece
  # use NullPiece.instance to safe memory usage
  include Singleton

  def to_s
    "\u25A1" + ' '
  end

  def color
    nil
  end
end