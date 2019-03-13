class BankAccount
  def initialize(owner, balance)
    @owner = owner
    @balance = balance
  end

  def owner
    @owner
  end

  def owner=(new_owner)
    @owner = new_owner
  end

  def set_opened(date)
    @created = date
  end

  def owners_equal?(other_account)
    if self.owner == other_account.owner
      true
    else
      false
    end
  end
end

def my_account
  puts "yep, you called the method"
end

bank_variable = 123
