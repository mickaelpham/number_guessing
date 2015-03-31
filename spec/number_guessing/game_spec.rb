require_relative '../spec_helper'

describe NumberGuessing::Game do

  SECRET = 50

  let(:game) do
    Random.stub :rand, (SECRET - 1) do
      NumberGuessing::Game.new
    end
  end

  let(:max) { NumberGuessing::Game::MAX_ATTEMPTS }

  describe "::new" do
    it "creates a new game without any attempts" do
      game.attempts.must_equal 0
    end
  end

  describe "#remaining_attempts" do
    it "returns the remaining attempts" do
      game.remaining_attempts.must_equal max
    end

    it "counts down as the player is guessing the secret number" do
      5.times { game.guess(0) }
      game.remaining_attempts.must_equal max - 5
    end
  end

  describe "#guess" do
    it "validates that the parameter is an integer" do
      game.guess("lol").must_equal("Please enter an integer")
      game.guess(false).must_equal("Please enter an integer")
      game.guess(-12.4).must_equal("Please enter an integer")
    end

    it "validates the number of attempts" do
      max.times { game.guess(0).wont_equal("Too mony attempts") }
      game.guess(0).must_equal("Too mony attempts")
    end

    it "indicates that the secret is smaller than the guessed number" do
      game.guess(100).must_match(/Lower.*/)
    end

    it "indicates that the secret is bigger than the guessed number" do
      game.guess(0).must_match(/Higher.*/)
    end

    it "indicates that the player found the secret number" do
      game.guess(SECRET).must_match(/You found the secret number.*/)
    end
  end
end
