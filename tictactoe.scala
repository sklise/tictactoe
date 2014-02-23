class Board {
  val winners = List(
    List(0,1,2),
    List(0,4,8),
    List(0,3,6),
    List(1,4,7),
    List(2,5,8),
    List(3,4,5),
    List(6,7,8),
    List(6,4,2)
  )

  val clean_board = Array("_","_","_","_","_","_","_","_","_")

  var board = clean_board
  var x_wins = 0
  var o_wins = 0
  val turns = List("x","o")
  var turn = 0

  check_winner()

  def wipe_board {
    turn = 0
    board = clean_board
  }

  def compare_spots(a: String,b: String,c: String) : Boolean = {
    return a == b && b == c && a != "_"
  }

  def get_board {
    println("")
    println(board(0) + " " + board(1) + " " + board(2))
    println(board(3) + " " + board(4) + " " + board(5))
    println(board(6) + " " + board(7) + " " + board(8))
    println("")
  }

  def check_winner () : String = {
    winners.foreach { winning_condition =>
      if (compare_spots(board(winning_condition(0)),
        board(winning_condition(1)),
        board(winning_condition(2)))) {

        if (board(winning_condition(0)) == "x") {
          x_wins += 1
        } else if (board(winning_condition(0)) == "o") {
          o_wins += 1
        }
      }
    }

    if (x_wins == 0 && o_wins == 0) {
      return "no winner"
    } else if (x_wins > o_wins) {
      return "x wins"
    } else if (x_wins < o_wins) {
      return "o wins"
    } else {
      return "tie"
    }
  }

  def whose_turn : String = {
    return turns(turn)
  }

  def take_turn(position: Int) {
    set_position(turns(turn),position)
    turn = (turn+1)%2
    get_board
    println(check_winner)
  }

  def set_position(char: String, pos: Int) {
    if (board(pos) == "_") {
      board(pos) = char
    } else {
      println("That spot is taken")
    }
  }
}

val board = new Board()

println(board.check_winner)

board.take_turn(1)
board.take_turn(2)
board.take_turn(3)

board.get_board