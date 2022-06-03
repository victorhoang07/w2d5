require "date"

class Item

    def self.valid_date?(date_string)
        # arr = date_string.split("-")

        # arr.each.with_index do |part, i|
        #     if i == 0 && part.length != 4
        #         return false
        #     elsif i == 1 && part.length != 2 && part.to_i > 12
        #         return false
        #     elsif i == 2 && part.length != 2 && part.to_i > 31
        #         return false
        #     end
        # end
        # return true
    # end
        date_format = '%Y-%m-%d'
        DateTime.strptime(date_string, date_format)
        true
        rescue ArgumentError
        false
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description

        if !Item.valid_date?(deadline)
            raise "not a valid date"
        end
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise "not a valid date"
        else
        @deadline = new_deadline
        end
    end

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end

end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date



