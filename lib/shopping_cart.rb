


#
# pry(main)> cart.sorted_products_by_quantity
# #=> [#<Product:0x00007fccd2985f53...>, #<Product:0x00007fccd2985f51...>, #<Product:0x00007fccd2985f48...>, #<Product:0x00007fccd29b5720...>]
#
# pry(main)> cart.product_breakdown
# #=> {:meat=>[#<Product:0x00007fccd2985f48...>], :paper=> [#<Product:0x00007fccd29b5720...>, #<Product:0x00007fccd2985f51...>], :produce=> [#<Product:0x00007fccd2985f53...>]}
# ```


class ShoppingCart
  attr_accessor :name, :capacity, :products, :quantity
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @quantity = 0
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    @products.each do |product|
      @quantity += product.quantity.to_i
    end
    @quantity
  end

  def is_full?
    if total_number_of_products < @capacity
      false
    else
      true
    end
  end

  def products_by_category(specified_category)
    one_category = []
    @products.each do |product|
      if product.category == specified_category
        one_category << product
      end
    end
    one_category
  end

  def percentage_occupied
    ((total_number_of_products.to_f/@capacity.to_f)*100).round(2)
  end

  def sorted_products_by_quantity
    by_quantity_low_to_high = []
    sorted = []
    @products.each do |product|
      #require "pry"; binding.pry
      product.quantity.to_i
      #require "pry"; binding.pry
      by_quantity_low_to_high << product.quantity
    end
    by_quantity_low_to_high.sort.each do |quantity|
      @products.each do |product|
        if product.quantity.to_i == quantity
          sorted << product
        end
      end
    end
    sorted.uniq
  end

  def product_breakdown

    @products.each_with_object({}) do |(category, type), category|
      #require "pry"; binding.pry
      (category[type[:meat]] ||= []) << product
      (category[type[:paper]] ||= []) << product
      (category[type[:produce]] ||= []) << product
    end
  end
end
