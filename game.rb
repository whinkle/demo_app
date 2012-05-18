class Game

  def initialize(start)
    @quips = [
      "Lily throws a fit and bites your leg... you die", "Lily tosses her head and escapes from her collar...You chase after and get hit by a car... You die", "Suddenly another Dog appears, Lily Barks, the other Dog Barks back then bites you","You shouldn't own a dog... you are dead"
    ]
    @start = start
    puts "in init @start = " + @start.inspect
  end
  
  def prompt()
    print "> "
  end
  
  def play()
    puts "@start => " + @start.inspect
    next_room = @start
    
    while true
      puts "\n--------"
      room = method(next_room)
      next_room = room.call()
    end
  end
  
  def death()
    puts @quips[rand(@quips.length())]
    Process.exit(1)
  end
  
  def home()
    puts "You have spent the past hour playing stick and trying to entertain"
    puts "Lily.  Despite your best efforts she has not been pacified"
    puts "Your productivity has slipped, and only a return to sleeping Lily"
    puts "Can salvage the day.  As She comes sprinting around the corner"
    puts "With the ever-present sock in her mouth you decide that its time"
    puts "To TAKE LILY FOR A WALK.  But first you have to get that damn"
    puts "Sock from her mouth.  What should you do?!"
    
    prompt()
    action = gets.chomp()
    
    if action == "Chase Lily"
      puts "You chase after Lily in circles around the house"
      puts "this isn't working, but you just keep chasing"
      puts "the rage builds and suddenly..."
      return :death
    
    elsif action == "Give Lily a Treat"
      puts "You get a chunk of butter from the fridge and wave it infront"
      puts "of Lily... she drops the sock and comes over for the treat"
      puts "as soon as you set down the butter, she grabs it, turns, and "
      puts "beats you back to the sock leaving you..."
      return :home

    elsif action == "Calmly grab the leash"
      puts "Lily drops the sock and walks over to you so you can put her leash on"
      return :walk_to_the_park
      
    else
      puts "DOES NOT COMPUTE!"
      return :home
    end
  end
  
  def walk_to_the_park()
    puts "You quickly walk down the driveway and turn left toward your"
    puts "Elusive destination.  The sun in shining and you can feel that"
    puts "Bounce in your step.  But just a couple blocks away you see another dog."
    puts "This dog is huge, with a choke chain and is looking for trouble"
    puts "Just when you think things might be ok, you notice the Dog "
    puts "Dive after a squirrel almost ripping off his walkers arm."
    puts "You decide you must cross the street, but just as you make that" 
    puts "Decision the other dog walker spots you and seems to have the same"
    puts "Plan.  To get past him you must pick the opposite side of the road as him"
    puts "2 times in a row.  You can either walk on the north side or the south side."

    
    opp_side = 0
    dog_side = ["north","south"]
    dog_choice = rand(dog_side.length())
    print "What Side Will You Walk On?"
    guess = gets.chomp
    
    while opp_side < 2
      if guess == dog_choice
        opp_side = 0
      else
        opp_side += 1
        if opp_side == 2
          puts "you did it!"
          return :park
        else
          puts "What Side Will you Walk On Next?"
          guess = gets.chomp()
        end
      end
    end
  end

  def park()
    puts "It is a glorious day at the park and you notice the slight rainbow that"
    puts "The sun makes reflecting off the fountains and lake.  Children play"
    puts "At the playground while the occasional runner makes their way"
    puts "Around the magnificent spectacle that is the Old Fourth Ward Park."
    puts "You break away from the sidewalks and emerge on the eastern end"
    puts "Of the park."
    puts "You are moving at a brisk pace when you hear the distinctive buzz"
    puts "of Lilys sworn enemy in the distance. with not enough time to make" 
    puts "It back to the shelter of the streets.  You must decide quickly how"
    puts "To avoid catastrophe.  "
    puts "You turn your head to the south to see how long you have..."
    puts "20 seconds at the most before the SKATEBOARDER is on top of you"
    puts "and Lily is losing her mind.  What should you do?"
    
    
    prompt()
    action = gets.chomp()
    
    if action == "Run"
      puts "Without thinking you turn and run in panic"
      return :death
    
    elsif action == "Distract Lily"
      puts "You attempt to distract Lily with a song"
      puts "she tilts her head and quickly ignores you"
      return :death
    
    elsif action == "Hold on tight"
      puts "you hold onto the leash tighter, and put one hand on her collar"
      puts "her body relaxes and the skateboarder passes without incident"
      return :walk_home
    
    else
      puts "DOES NOT COMPUTE!"
      return :park
    end
  end
  
  def walk_home()
    puts "Finally you turn east to head home.  The sun is high and the humidity "
    puts "Has been increasing for months. Luckily the trees provide ample shade"
    puts "And you stroll happily along.  However, Lily also appreciates the cooling"
    puts "Embrace of a trees overhang and she flops on her stomach unwilling"
    puts "To lift a paw.  You tug slightly and say, "
    puts "Lily lets go"
    puts "all to no avail."
    puts "A few minutes pass and you wonder if Lily will ever want to leave"
    puts "What should you do?"
    
    prompt()
    action = gets.chomp()
    
    if action == "sit down"
      puts "You relax for a few minutes side by side with your dog.  A great moment"
      puts "indeed.  Before long Lily stands up and starts to walk you home!"
      return :back_home
    
    else
      puts "DOES NOT COMPUTE!"
      return :walk_home
    end
  end
  
  def back_home()
    puts "You made it! Time to get to work!"
    Process.exit
  end
end

a_game = Game.new(:home)
a_game.play()
    


    
    
