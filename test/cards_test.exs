defmodule CardsTest do
  use ExUnit.Case

  doctest Cards # will find doctest in the documentation !!!

  test "shuffled deck is different" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end

  test "another way... shuffled deck is different" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck) 
  end

end
