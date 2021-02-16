require 'pry'
class BankAccount
    attr_accessor  :account_number, :balance, :status
    attr_reader :name

    def initialize(name, balance = 1000, status = 'open')
        @name = name
        @balance = balance
        @status = status
    end
    
    def deposit(money)
        @balance = @balance + money
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        @status == 'open' && @balance > 0
    end

    def close_account
        @status = 'closed'
    end
end
