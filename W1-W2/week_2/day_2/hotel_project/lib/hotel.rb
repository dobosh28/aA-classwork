require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}

        rooms.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name 
        @name.split(" ").map { |part| part.capitalize }.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)   
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        else  
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end


    def has_vacancy?
        @rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
        @rooms.each { |room_name, room| puts room_name + " " + room.available_space.to_s }
    end
end
