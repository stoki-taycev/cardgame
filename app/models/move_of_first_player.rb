require "move_of_second_player"
require "game_state"

class MoveOfFirstPlayer < GameState

  def initialize _game
    super _game
  end
  def get_card_from_player _card, _player_id
    if @game.mover.to_i == _player_id.to_i

      if @game.do_get_card_from_player _card, _player_id
        @game.players[0].delete_card _card
        @game.set_game_state(MoveOfSecondPlayer.new @game)
        @game.mover = @game.players[1].id
      end
    else
      puts "Fatal ERROR"
    end
  end

  def end_turn _player_id
    puts "////////////////////END OF TURN in state"
    if @game.mover.to_i == _player_id.to_i
      if(_player_id.to_i == @game.attacker.to_i && @game.table.cards_count > 0) #END from attacker
        puts "////////////////////ATTACKER END OF TURN in state"
        @game.set_game_state(MoveOfSecondPlayer.new @game)
        @game.do_end_turn
      elsif (_player_id.to_i == @game.defender.to_i) #END from defender
        puts "////////////////////DEFENDER END OF TURN in state"
        @game.do_break_turn 0
      end
    end
  end
end
