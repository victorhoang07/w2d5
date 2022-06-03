class Passenger

    def initialize(name)

        @name = name
        @flight_numbers = []

    end

    def name
        @name
    end

    def has_flight?(str)
        if @flight_numbers.include?(str.upcase)
            return true
        else
            return false
        end
    end

    def add_flight(str)
        if !self.has_flight?(str)
            @flight_numbers << str.upcase
        end
    end
end