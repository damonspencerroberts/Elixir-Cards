defmodule CardTest do
  use ExUnit.Case
  doctest Card

  test "create cards generates 52 cards" do
    deck = Card.create_cards()
    assert length(deck) == 52
  end

  test "create cards with jokers generates 54 cards" do
    deck = Card.create_cards_with_jokers()
    assert length(deck) == 54
  end

  test "test shuffling functionality" do
    shuffled_cards =
      Card.create_cards()
      |> Card.shuffle()

    assert length(shuffled_cards) == 52
    assert shuffled_cards != Card.create_cards()
  end

  test "opening correct filename cards returns the correct length" do
    opened_cards = Card.open('my_cards')
    assert length(opened_cards) == 52
  end

  test "opening wrong filename cards return error" do
    opened_cards = Card.open('my_cardsss')
    assert opened_cards == "There is no file that exists with my_cardsss"
  end

  test "draw cards works correctly" do
    cards = Card.draw(true)
    assert length(cards) == 5
  end
end
