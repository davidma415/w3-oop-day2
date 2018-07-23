require './item.rb'

class Cart
  def initialize
    @cart = []
  end

  def add(item)
    @cart << item
  end

  def remove(item)
    @cart.delete(item)
  end

  def items
    return @cart
  end

  def total
    total = 0
    @cart.each do |item|
      if item.tax_class == 'exempt'
        total += (item.quantity * item.price)
      elsif item.tax_class == 'import'
        total += ((item.quantity * item.price)*(1 + item.imported))
      else
        total += ((item.quantity * item.price) * (1+item.standard))
      end
    end
    return total.round(2)
  end
end

lettuce = Product.new('lettuce', 1.65, 'import')
tomato = Product.new('tomato', 1.80, 'import')
cart1 = Cart.new
lettuce.quantity = 3
tomato.quantity = 4
cart1.add(lettuce)
cart1.add(tomato)
p cart1
total2 = cart1.total
p total2
