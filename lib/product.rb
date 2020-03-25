`
class Product
  attr_accessor :category, :name, :unit_price, :quantity
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
  end

  def total_price
    @unit_price * @quantity
  end

  def is_hoarded?
    if @quantity < 100
      false
    else
      true
    end
  end

  def hoard
   @quantity += 100
  end
end
