
class BankAccount
  @@interest_rate = 0.06
  @@accounts = []

  def self.create
    x = BankAccount.new
    @@accounts << x
    return x
  end

  def self.total_accounts
    @@accounts
  end

  def self.total_funds
    @@total_funds = 0
    @@accounts.each do |account|
      @@total_funds += account.balance
    end
    return @@total_funds
  end

  def self.interest_time
    @@accounts.each do |account|
       balance = account.balance * @@interest_rate
       account.deposit(balance)
    end
  end

  def initialize
    @balance = 0
  end
# reader
  def balance
    @balance
  end
# writer
  def deposit(value)
    @balance += value
  end


  def withdraw(value)
    @balance -= value
  end
end


tylers = BankAccount.create
your = BankAccount.create

puts BankAccount.total_accounts
tylers.deposit(400)
your.deposit(800)

BankAccount.interest_time

puts BankAccount.total_funds
