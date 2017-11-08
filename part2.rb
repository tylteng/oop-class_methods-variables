class Book
  @@on_shelf = []
  @@on_loan = []
  @@due_date = Time.now
  @due_date = nil
  @isbn = 1

  def self.create(x, y, z = nil)
    book = Book.new(x, y, @isbn)
    @@on_shelf << book
    @isbn += 1
    return book
  end

  def self.current_due_date
    @@due_date = Time.now
    @@due_date += (2592000)
    return @@due_date
  end

  def self.overdue_books
    overdue_books = []
    @@on_loan.each do |x|
      if @due_date < Time.now
        overdue_books << x
      end
    end
    return overdue_books
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  def initialize(x, y, z)
    @book_title = x
    @book_author = y
    @isbn = z
  end

  def due_date
    if @due_date == nil
    p "The book is not borrowed!"
    elsif Time.now > @due_date
      p "Your book is overdue!"
    else
      p @due_date
    end
  end

  def borrow
    if lent_out? == false
      @@on_shelf.delete(self)
      @@on_loan << self
      @due_date = Book.current_due_date
      "You just borrowed the book!"
      return true
    else lent_out? == true
      "Sorry the book is unavailable."
      return false
    end
  end

  def return_to_library

  end

  def lent_out?
    if @@on_loan.include?(self)
      "The book is unavailable"
      return true
    else
      return false
    end
  end
end

lolita = Book.create("Lolita", "Vladimir Nbokuv")
harrypotter = Book.create("Harry Potter", "J. K. Rowling")
catcher = Book.create("Catcher and the Rye", "J. D. Salinger")
bigcity = Book.create("Bright Lights, Big City", "Jay McInernery")

p lolita.lent_out?
lolita.borrow
p lolita.due_date

Book.overdue_books
