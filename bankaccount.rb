class BankAccount
  @@interest_rate = 0.015
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def balance=(int)
    @balance = int
  end

  def deposit(int)
    @balance += int
  end

  def withdraw(int)
    @balance -= int
  end



end
