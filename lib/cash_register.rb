# CashRegister
#   ::new
#     sets an instance variable @total on initialization to zero
#     optionally takes an employee discount on initialization
#   #total
#     returns the current total

class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    #items
    # returns an array containing all items that have been added
    @items = []
  end


  # accepts a title and a price and increases the total
  # also accepts an optional quantity
  # doesn't forget about the previous total

  def add_item(title, amount, quantity=1)
    self.total += amount * quantity
    quantity.times do
      items << title
    end
    self.last_transaction = amount * quantity
  end

  # #apply_discount
  #   the cash register was initialized with an employee discount
  #     applies the discount to the total price
  #     returns success message with updated total
  #     reduces the total
  # the cash register was not initialized with an employee discount
  # returns a string error message that there is no discount to apply

  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end


  #void_last_transaction
  # subtracts the last transaction from the total
  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
