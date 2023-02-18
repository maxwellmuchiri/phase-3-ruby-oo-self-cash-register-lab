class CashRegister
    attr_accessor :total, :discount, :last_transaction

    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @last_transaction = price * quantity
        if @items
          @items << [title, quantity]
        else
          @items = [[title, quantity]]
        end
      end



      def apply_discount
        if @discount == 0
          "There is no discount to apply."
        else
          @total = (@total * (100 - @discount) / 100.0).to_i
          "After the discount, the total comes to $#{@total}."
        end
      end

      def items
        @items.map { |item, quantity| [item] * quantity }.flatten
      end


      def void_last_transaction
        if @last_transaction == 0
          return @total = 0.0
        end
        @total -= @last_transaction
        @last_transaction = 0
      end


  end
