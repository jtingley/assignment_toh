def Tower_of_Hanoi

  def render(towers)
    puts "Here is how the game board looks right now:"
    towers.each { |tower_number, tower| puts "Tower #{tower_number}: #{tower}" }
  end

  def move(towers)
    puts "Please select what tower you want to chose from:"
    select = gets.chomp.to_i
    puts "Please select what tower you want to place disc:"
    destination = gets.chomp.to_i

    if !towers.include?(select) || !towers.include?(destination)
      puts "No such tower!\n"
    elsif select == destination
      puts "You can't put the same disc where you got it from!\n"
    end

    select, destination = towers[select], towers[destination]

    if destination.none? || select.last < destination.last
      destination << select.pop
    else
      puts "Invalid move. You can't place a bigger tile on top of a smaller one."
      puts "Try again!\n"
    end
  end

  def winning?(towers)
    if towers[2] == @final || towers[3] == @final
      puts "You win the game!"
      @win == true
      exit
    end
  end

  def play(towers)
    until @win == true
      move(towers)
      render(towers)
      winning?(towers)
    end  
  end

  @win == false
  towers = { 1 => [], 2 => [], 3 => [] }
  puts "How many disks would you like to start with?"
  disks = gets.chomp.to_i

  towers[1] = (1..disks).to_a.reverse
  @final = towers[1].dup

  render(towers)

  play(towers)
end

Tower_of_Hanoi()