defmodule Card do
  @defmodule """
    This Projects is a card simulator. It can generate a deck of cards and
    produce certain functionality to those cards such as shuffle, deal, draw, save and
    open a file with cards.
  """
  
  @spec create_cards :: list
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

  @spec create_cards_with_jokers :: [...]
  def create_cards_with_jokers do
    Card.create_cards ++ ["Joker", "Joker"]
  end

  @spec shuffle(any) :: list
  def shuffle(cards) do
    Enum.shuffle(cards)
  end

  @spec deal(any, integer) :: {list, list}
  def deal(cards, amt) do
    Enum.split(cards, amt)
  end

  @spec contains?(any, any) :: boolean
  def contains?(cards, card) do
    Enum.member?(cards, card)
  end

  @spec save(
          any,
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ) :: :ok | {:error, atom}
  def save(cards, filename) do
    binary = :erlang.term_to_binary(cards)
    File.write(filename, binary)
  end

  @spec open(
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ) :: any
  def open(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _report} -> "There is no file that exists with #{filename}"
    end
  end

  @spec draw :: list
  def draw do
    {cards, _rest} =
      Card.create_cards()
      |> Card.shuffle()
      |> Card.deal(5)

    cards
  end
end
