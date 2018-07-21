class Book
  @@on_shelf = []
  @@on_loan = []

  def due_date
    @due_date
  end

  def due_date=(date)
    @due_date = date
  end

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def lent_out?
    return @@on_loan.include?(self)
  end

  def borrow
    if self.lent_out? == true
      return false
    else
      self.due_date = Book.current_due_date
      @@on_shelf.delete(self)
      @@on_loan << self
      return true
    end
  end

  def return_to_library
    if self.lent_out? == false
      return false
    else
      self.due_date = nil
      @@on_loan.delete(self)
      @@on_shelf << self
      return true
    end
  end

  def self.create(title, author, isbn)
    new_book = self.new(title, author, isbn)
    @@on_shelf.push(new_book)
    return new_book
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end

  def self.browse
    return @@on_shelf.sample
  end

  def self.current_due_date
    due_date=(Time.now + (3*24*3600)) #24*3600 is 24 hrs, multiplied by 3 is 3 days
  end

  def self.overdue
    overdue_items = []
    @@on_loan.each do |book|
      if Time.now > book.due_date
        overdue_items << book
      end
      return overdue_items
    end
  end
end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect
puts Book.browse.inspect
puts Book.browse.inspect
puts Book.available.inspect
puts Book.borrowed.inspect
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.due_date
puts Book.available.inspect
puts Book.borrowed.inspect
puts Book.overdue.inspect
puts sister_outsider.return_to_library
puts sister_outsider.lent_out?
puts Book.available.inspect
puts Book.borrowed.inspect
