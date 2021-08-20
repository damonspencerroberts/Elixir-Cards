defmodule Card do
  def create_cards do
    cards = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Hearts", "Clubs", "Spades", "Diamonds"]

    for suit <- suits, card <- cards do
      "#{card} of #{suit}"
    end
  end

  def shuffle(cards) do
    Enum.shuffle(cards)
  end

  def deal(cards, amt) do
    Enum.split(cards, amt)
  end
end
