class Product
  @@tax_exempt = 0
  @@tax_standard = 0.13
  @@tax_import = 0.21

  def initialize(name, price, tax_class='standard', quantity=1)
    @name = name
    @price = price
    @tax_class = tax_class
    @quantity = quantity
  end

  def name
    @name
  end

  def price
    @price
  end

  def tax_class
    @tax_class
  end

  def quantity
    @quantity
  end

  def quantity=(int)
    @quantity = int
  end

  def exempt
    return @@tax_exempt
  end

  def standard
    return @@tax_standard
  end

  def imported
    return @@tax_import
  end

end
