
def setter(x, board, counter)
        coordinates = reference(x, board)
        while (x > 9 || x < 1 || board[coordinates[0]][coordinates[1]] == "X" ||  board[coordinates[0]][coordinates[1]] == "O") 
            puts "Pick a number between 1-9 that is not taken already"
            board(board)
            x = gets.chomp.to_i
            coordinates = reference(x, board)
        end
            if counter.odd?
                 board[coordinates[0]][coordinates[1]] = "X"
            else
                board[coordinates[0]][coordinates[1]] = "O"
            end      
end

def reference (x, arr)
    if x == 1
        return [0, 0]
    elsif x == 2
        return [0, 1]
    elsif x == 3
        return [0, 2]
    elsif x == 4
        return [1, 0]
    elsif x == 5
        return [1, 1]
    elsif x == 6
        return [1, 2]
    elsif x == 7
        return [2, 0]
    elsif x == 8
        return [2, 1]
    elsif x == 9
        return [2, 2]
    end
end

def check_lines(player, board)
    wins = [
        [board[0][0], board[0][1], board[0][2]], [board[1][0], board[1][1], board[1][2]], [board[2][0], board[2][1], board[2][2]], #horizontal win conditions
        [board[0][0], board[1][0], board[2][0]], [board[0][1], board[1][1], board[2][1]], [board[0][2], board[1][2], board[2][2]], #vertical win conditions
        [board[0][0], board[1][1], board[2][2]], [board[2][0], board[1][1], board[0][2]] #diaginal win conditions
    ]
  if q = wins.any? { |line| line.all? { |arr| arr == player} }
  q
  end
end

def winner (winner, arr)
    board (arr)
    p "#{winner} is the winner!!"
end

def board (arr)
    arr.each { |arr| p arr }
end

def play
    arr = [[1,2,3],[4,5,6],[7,8,9]]
    counter = 1
    board(arr)
    while (counter <= 9) do
        x = gets.chomp.to_i
        setter(x, arr, counter)
        if counter.odd?
            if check_lines("X", arr)
                winner("X",arr)
                break
            end
        else
            if check_lines("O", arr)
                winner("O", arr)
                break
            end
        end
        counter += 1
        board(arr)
        if counter == 10
            p "Draw"
        end
    end
end
play 