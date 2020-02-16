require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson", 
        :number => 0, 
        :shoe => 16, 
        :points => 22, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 1 
    },
       {:player_name => "Reggie Evans", 
        :number => 30, 
        :shoe => 14, 
        :points => 12, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 12, 
        :blocks => 12, 
        :slam_dunks => 7
    },
       {:player_name => "Brook Lopez", 
        :number => 11, 
        :shoe => 17, 
        :points => 17, 
        :rebounds => 19, 
        :assists => 10, 
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 15
    },
       {:player_name => "Mason Plumlee", 
        :number => 1, 
        :shoe => 19, 
        :points => 26, 
        :rebounds => 11, 
        :assists => 6, 
        :steals => 3, 
        :blocks => 8, 
        :slam_dunks => 5
    },
       {:player_name => "Jason Terry", 
        :number => 31, 
        :shoe => 15, 
        :points => 19, 
        :rebounds => 2, 
        :assists => 2, 
        :steals => 4, 
        :blocks => 11, 
        :slam_dunks => 1}
    ]
  },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien", 
        :number => 4, 
        :shoe => 18, 
        :points => 10, 
        :rebounds => 1, 
        :assists => 1, 
        :steals => 2, 
        :blocks => 7, 
        :slam_dunks => 2
    },
       {:player_name => "Bismack Biyombo", 
        :number => 0, 
        :shoe => 16, 
        :points => 12, 
        :rebounds => 4, 
        :assists => 7, 
        :steals => 22, 
        :blocks => 15, 
        :slam_dunks => 10
    },
       {:player_name => "DeSagna Diop", 
        :number => 2, 
        :shoe => 14, 
        :points => 24, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 4, 
        :blocks => 5, 
        :slam_dunks => 5 
    },
       {:player_name => "Ben Gordon", 
        :number => 8, 
        :shoe => 15, 
        :points => 33, 
        :rebounds => 3, 
        :assists => 2, 
        :steals => 1, 
        :blocks => 1, 
        :slam_dunks => 0
    },
       {:player_name => "Kemba Walker", 
        :number => 33, 
        :shoe => 15, 
        :points => 6, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 7, 
        :blocks => 5, 
        :slam_dunks => 12}
    ]
  }
}
end

def num_points_scored(player_name)
  players = get_all_players(game_hash)
  find_player(players, player_name)[:points]
end 

def get_all_players(game_hash)
  game_hash.values.map do |team|
    team[:players]
  end.flatten
end 
  
def find_player(players, player_name)
  players.each do |player|
    if player[:player_name] == player_name
        return player 
    end
  end 
end 
  
def shoe_size(player_name)
   players = get_all_players(game_hash)
  find_player(players, player_name)[:shoe]
end   
  
def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end 

def team_names
  new_array = []
  game_hash.each do |location, team|
    new_array << team[:team_name]
  end 
  new_array
end 

def player_numbers(team_name)
  new_array = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |player_data, value|
        if player_data == :players
          value.each do |player|
          new_array.push(player[:number])
        end 
      end
    end
  end
end
  new_array
  end 
 
def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stat|
      if player_stat[:player_name] == player_name
        new_hash = { number: player_stat[:number],
                           shoe: player_stat[:shoe],
                           points: player_stat[:points],
                           rebounds: player_stat[:rebounds],
                           assists: player_stat[:assists],
                           steals: player_stat[:steals],
                           blocks: player_stat[:blocks],
                           slam_dunks: player_stat[:slam_dunks]
                         }
                         return new_hash
                         end
                       end
                     end
                   end
 
def big_shoe_rebounds
  big_shoe = 0 
  rebounds = 0 
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end 
    end 
  end 
  return rebounds 
end 

def most_points_scored
  most_points = 0
  most_points_player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      if player_stats[:points] > most_points
        most_points = player_stats[:points]
        most_points_player = player_stats[:player_name]
      end 
    end 
  end 
  return most_points_player
end

def winning_team
  max_points = 0
  winning_team = ""
  game_hash.each do |location, team_data|
    team_total = 0

    team_data[:players].each do |player_stats|
      team_total += player_stats[:points]
    end
    if team_total > max_points
      max_points = team_total
      winning_team = team_data[:team_name]
    end 
  end 
  return winning_team
end

def player_with_longest_name
  longest_name_length = 0
  longest_name_player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      if player_stats[:player_name].length > longest_name_length
        longest_name_length = player_stats[:player_name].length
        longest_name_player = player_stats[:player_name]
      end
    end 
  end 
  return longest_name_player
end

def most_steals_player
  most_steals = 0
  most_steals_player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      if player_stats[:steals] > most_steals
        most_steals = player_stats[:steals]
        most_steals_player = player_stats[:player_name]
      end 
    end 
  end 
  return most_steals_player
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals = most_steals_player
 
  if longest_name == most_steals 
    return true 
  else 
    return false 
  end
end

