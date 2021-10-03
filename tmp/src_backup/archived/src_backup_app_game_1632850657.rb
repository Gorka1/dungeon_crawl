class GameObj
    attr_accessor :main_player
    
    def initialize
        main_player = PlayerObj.new
    end
end
