defmodule Card do
  def create_cards do
    cards = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

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

  def contains?(cards, card) do
    Enum.member?(cards, card)
  end

  def save(cards, filename) do
    binary = :erlang.term_to_binary(cards)
    File.write(filename, binary)
  end

  def open(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _report} -> "There is no file that exists with #{filename}"
    end
  end

  def draw do
    {cards, _rest} =
      Card.create_cards()
      |> Card.shuffle()
      |> Card.deal(5)

    cards
  end
end
