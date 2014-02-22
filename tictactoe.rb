class Board
  @@winners = [
    [0,1,2],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [3,4,5],
    [6,7,8],
    [6,4,2]
  ]

  def initialize(board_list=Array.new(9))
    return Error if board_list.class != Array || board_list.length != 9

    @board = board_list
    @x_wins = 0
    @o_wins = 0
    @turns = ["x","o"]
    @turn = 0

    check_winner
  end

  def match(a,b,c)
    a == b && b == c && a != nil
  end

  def check_winner
    @@winners.each do |winning_condition|
      if match @board[winning_condition[0]], @board[winning_condition[1]], @board[winning_condition[2]]

        match @board[winning_condition[0]], @board[winning_condition[1]], @board[winning_condition[2]]

        if @board[winning_condition[0]] == "x"
          @x_wins += 1
        else
          @o_wins += 1
        end
      end
    end

    if @x_wins == 0 && @o_wins == 0
      "no winner"
    elsif @x_wins > @o_wins
      "x wins"
    elsif @x_wins < @o_wins
      "o wins"
    else
      "tie"
    end
  end

  def wipe_board!
    @turn = 0
    @board = Array.new(9)
  end

  def get_board
    puts "#{@board[0] || '_'} #{@board[1] || '_'} #{@board[2] || '_'}"
    puts "#{@board[3] || '_'} #{@board[4] || '_'} #{@board[5] || '_'}"
    puts "#{@board[6] || '_'} #{@board[7] || '_'} #{@board[8] || '_'}"
    self.check_winner
  end

  def set_position char, pos
    raise "You must provide either an 'x' or an 'o'" if !['x','o'].include?(char)

    if @board[pos] == nil
      @board[pos] = char
    else
      raise "That spot is taken!"
    end
  end

  def whose_turn?
    @turns[@turn]
  end

  def take_turn(position)
    self.set_position(@turns[@turn],position)
    @turn = (@turn+1)%2
    get_board
  end
end