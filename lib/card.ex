defmodule Card do
  @moduledoc """
    This Projects is a card simulator.
    It can generate a deck of cards with or without jokers and
    produce certain functionality to those cards such as shuffle the cards,
    find out if the deck contains a certain card, deal the cards,
    shuffle and draw the cards, and finally save the cards to file and
    open a file containing rows of cards.
  """

  @doc """
    This Function Generates an ordered deck of cards

  ## Function
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
          "\#{card} of \#{suit}"
        end
      end
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

  @doc """
    This function generates an ordered list of cards with 2 jokers

  ## Function
      def create_cards_with_jokers do
        Card.create_cards() ++ ["Joker", "Joker"]
      end
  """

  @spec create_cards_with_jokers :: [...]
  def create_cards_with_jokers do
    Card.create_cards() ++ ["Joker", "Joker"]
  end

  @doc """
    This functions takes a deck as an argument and returns a shuffle list of cards

  ## Function
      def shuffle(cards) do
        Enum.shuffle(cards)
      end
  """

  @spec shuffle(any) :: list
  def shuffle(cards) do
    Enum.shuffle(cards)
  end

  @doc """
    This function creates a tuple with a hand and the rest of the deck.

  ## Function
      def deal(cards, amt) do
        Enum.split(cards, amt)
      end

  ## Examples

      iex> deck = Card.create_cards
      iex> Card.deal(deck, 5)
      {["Ace of Hearts", "Two of Hearts", "Three of Hearts", "Four of Hearts",
      "Five of Hearts"],
      ["Six of Hearts", "Seven of Hearts", "Eight of Hearts", "Nine of Hearts",
      "Ten of Hearts", "Jack of Hearts", "Queen of Hearts", "King of Hearts",
      "Ace of Clubs", "Two of Clubs", "Three of Clubs", "Four of Clubs",
      "Five of Clubs", "Six of Clubs", "Seven of Clubs", "Eight of Clubs",
      "Nine of Clubs", "Ten of Clubs", "Jack of Clubs", "Queen of Clubs",
      "King of Clubs", "Ace of Spades", "Two of Spades", "Three of Spades",
      "Four of Spades", "Five of Spades", "Six of Spades", "Seven of Spades",
      "Eight of Spades", "Nine of Spades", "Ten of Spades", "Jack of Spades",
      "Queen of Spades", "King of Spades", "Ace of Diamonds", "Two of Diamonds",
      "Three of Diamonds", "Four of Diamonds", "Five of Diamonds",
      "Six of Diamonds", "Seven of Diamonds", "Eight of Diamonds",
      "Nine of Diamonds", "Ten of Diamonds", "Jack of Diamonds",
      "Queen of Diamonds", "King of Diamonds"]}
  """

  @spec deal(any, integer) :: {list, list}
  def deal(cards, amt) do
    Enum.split(cards, amt)
  end

  @doc """
    This function takes a deck of cards and any card you want to check as an argument
    and verifies that the deck contains the card you are checking.

  ## Function
      def contains?(cards, card) do
        Enum.member?(cards, card)
      end

  ## Examples

      iex> deck = Card.create_cards
      iex> Card.contains?(deck, "Queen of Hearts")
      true
  """

  @spec contains?(any, any) :: boolean
  def contains?(cards, card) do
    Enum.member?(cards, card)
  end

  @doc """
    This function saves takes a deck of cards and file name as arguments
    and saves the cards to a file in the root of your project.

  ## Function
      def save(cards, filename) do
        binary = :erlang.term_to_binary(cards)
        File.write(filename, binary)
      end
  """

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

  @doc """
    This function takes a file name as an argument and opens the file and returns the deck of cards
    if formatted correctly, otherwise returns an error message if the file does not exist.

  ## Function
      def open(filename) do
        case File.read(filename) do
          {:ok, binary} -> :erlang.binary_to_term(binary)
          {:error, _report} -> "There is no file that exists with \#{filename}"
        end
      end
  """

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

  @doc """
    This function:
    - Takes a boolean argument whether the user wants the deck with jokers or not
    - Creates the deck
    - Shuffles the deck
    - Deals out 5 cards

  ## Function
      def draw(withJokers) do
        {cards, _rest} =
          case withJokers do
            true -> Card.create_cards_with_jokers()
            false -> Card.create_cards()
          end
          |> Card.shuffle()
          |> Card.deal(5)

        cards
      end
  """

  @spec draw(boolean) :: list
  def draw(withJokers) do
    {cards, _rest} =
      case withJokers do
        true -> Card.create_cards_with_jokers()
        false -> Card.create_cards()
      end
      |> Card.shuffle()
      |> Card.deal(5)

    cards
  end
end
