defmodule Cards do
  
  @moduledoc """
    
    A card games related module
    
  """

  @doc """ 
    Returns a list of strings that represent a deck of cards
  """
  def create_deck do
    suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
    values = ["Ace", "Two", "Three", "Four", "Five"]

    for suit <- suits, value <- values do 
      "#{value} of #{suit}"
      end
  end
  
 
  @doc """ 
    Takes a `deck` (a list of strings) and returns a randomly shuffled copy of it.
  """
  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  
  @doc """ 
    Deals a hand from a `deck` (a list of strings) and `n_cards` (an int) 
    Returns the new `deck` (with `n_cards` less) and the hand (`n_cards` long) 
  """
  def deal(deck, n_cards) do
    Enum.split(deck, n_cards)
  end

  
  @doc """ 
    Determines whether a `deck` contains a `card` or not. 

  
  ## Examples 

    iex> hand = ["Ace of Spades", "Queen of Hearts"]
    iex> Cards.contains?(hand, "Ace of Spades")
    true
    iex> Cards.contains?(hand, "Ace of Hearts")
    false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do 
    binary = :erlang.term_to_binary(deck)
  @doc """
    Allows to save `cards` to disk. Takes the `cards` and the `filename` as args.   
  """
  def save(cards, filename) do 
    binary = :erlang.term_to_binary(cards)
    File.write(filename, binary)
  end

  
  @doc """
    Allows to load cards from disk. 
    Takes the `filename` as arg and return the cards. 
  """
  def load(cards_path) do
    case File.read(cards_path) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File `#{cards_path}` does not exists"
    end
  end

  @doc """
    A utility function that, given a number of cards, will:
      - create a deck 
      - shuffle it 
      - and deal a hand

  ## Examples 
      
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def create_hand(n_cards) do 
    Cards.create_deck()
    |> Cards.shuffle 
    |> Cards.deal(n_cards)
  end
end
