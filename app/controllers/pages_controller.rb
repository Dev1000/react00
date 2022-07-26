class PagesController < ApplicationController
  # The card game War is a simple game played with a deck of standard playing cards (4 suits, 13 cards per suit) between 2 players.
  # The gameplay is as follows:
  #
  # The deck is divided evenly between both players.
  # Each turn, players turn over their top-most card
  # The player with the bigger card takes both cards and puts them in their own scoring pile
  # Card order: Ace > King > Queen > Jack > 10 > ... > 2
  # Suit order: Spades > Hearts > Clubs > Diamonds
  # Repeat until there are no cards left
  # The player with the most number of cards in their scoring pile wins
  # Write a simulation for the game and print the winner.
  # =

  def index
    suits = %w[Spades Hearts Clubs Diamonds]
    deck = []

    suits.each do |suit|
      (1..13).each do |i|
        card = { suit: suit, number: i }
        deck << card
      end
    end

    player_a_deck = []
    player_b_deck = []
    puts "deck.length: #{deck.length}"
    shuffle_card = deck.shuffle
    puts "shuffle_card: #{shuffle_card}"

    shuffle_card.each_with_index do |card, index|
      if index.even?
        player_a_deck << card
      else
        player_b_deck << card
      end
    end

    #puts "player_a_deck.length: #{player_a_deck.length}"
    #puts "player_b_deck.length: #{player_b_deck.length}"
    #puts "player_a_deck: #{player_a_deck}"
    #puts "player_b_deck: #{player_b_deck}"

    pile_a = []
    pile_b = []

    26.times do |turn|
      puts "turn: #{turn}"
      card_player_a = player_a_deck[turn]
      card_player_b = player_b_deck[turn]
      puts card_player_a
      puts card_player_b

      number_a = card_player_a[:number]
      number_b = card_player_b[:number]

      if number_a > number_b
        assign_cards(pile_a, card_player_a, card_player_b)
        puts "A.pile_a: #{pile_a.size}"
        puts "A.pile_b: #{pile_b.size}"
      elsif number_a != number_b
        assign_cards(pile_b, card_player_a, card_player_b)
        puts "B.pile_a: #{pile_a.size}"
        puts "B.pile_b: #{pile_b.size}"
      else
        rev_suits = suits.reverse

        suit_a = rev_suits.find_index(card_player_a[:suit])
        suit_b = rev_suits.find_index(card_player_b[:suit])
        puts "suit_a: #{suit_a}, suit_b: #{suit_b}"
        assign_cards(suit_a > suit_b ? pile_a : pile_b, card_player_a, card_player_b)
      end

      puts "pile_a: #{pile_a.size}"
      puts "pile_b: #{pile_b.size}"
      puts '-------'
    end
    puts "pile_a: #{pile_a.size}"
    puts "pile_b: #{pile_b.size}"

    if pile_a.size > pile_b.size
      puts 'Won A'
    elsif pile_a.size == pile_b.size
      puts 'Draw'
    else
      puts 'Won B'
    end
  end

  def assign_cards(owner, card_a, card_b)
    owner << card_a
    owner << card_b
  end
end
