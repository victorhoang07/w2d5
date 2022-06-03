require_relative "item.rb"

class List

    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description='')

        return false if !Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            true
    
    end

    def size
        @items.length
    end

    def valid_index?(index)
        # if index < 0 || index > @items.length - 1
        #     return false
        # else
        #     return true 
        # end

        0 <= index && index < self.size

    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
            
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true

    end

    def[](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "------------------------------------------------"
        puts @label
        puts "------------------------------------------------"
        puts "Index".ljust(6) + "| " + "Item".ljust(20) + "| " + "deadline".ljust(15)
        puts "------------------------------------------------"
        @items.each.with_index do |task, i|
            puts i.to_s.ljust(6) + "| " + task.title.ljust(20) + "| " + task.deadline.ljust(15)
        end
        puts "------------------------------------------------"
    end

end

my_list = List.new('Groceries')
my_list.add_item('toothpaste', '2019-10-25')
my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
my_list.print 