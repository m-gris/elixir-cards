defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    :world
  end

  
  def create_deck do
    suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
    values = ["Ace", "Two", "Three", "Four", "Five"]

    for suit <- suits, value <- values do 
      "#{value} of #{suit}"
      end
  end
  
  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  def deal(deck, n_cards) do
    Enum.split(deck, n_cards)
  end


  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do 
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

end
