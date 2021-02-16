require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == 'pending' && self.valid? && @sender.balance > self.amount 
    @sender.balance = @sender.balance - self.amount
    @receiver.balance = @receiver.balance + self.amount
    @status = 'complete' 
    return @status
    else 
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
      
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance = @sender.balance + self.amount
      @receiver.balance = @receiver.balance - self.amount
      @status = 'reversed'
    end
  end

  
end
