
# Cut pattern matching. Contains a parslet.
# If the parslet fails, whole parsing fails.
class Parslet::Atoms::Cut < Parslet::Atoms::Base
  attr_reader :child
  def initialize(child)
    super()

    @child = child
  end

  def try(source, context, consume_all)
    success, _value = result = child.apply(source, context, consume_all)
    context.cut! unless success
    result
  end

  def to_s_inner(prec)
    "! #{child.to_s(prec)}"
  end
end
