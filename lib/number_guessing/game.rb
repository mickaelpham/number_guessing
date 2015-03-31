module NumberGuessing
  class Game
    attr_reader :attempts

    MAX_ATTEMPTS = 7

    def initialize
      @secret   = Random.rand(100) + 1
      @attempts = 0
    end

    def guess(n)
      return "Please enter an integer" unless n.is_a? Integer
      return "Too mony attempts"       unless valid_attempt?

      @attempts += 1

      if n > @secret
        "Lower. #{print_remaining_attempts}"
      elsif n < @secret
        "Higher. #{print_remaining_attempts}"
      else
        "You found the secret number! It was #{@secret}"
      end
    end

    def remaining_attempts
      MAX_ATTEMPTS - @attempts
    end

    private

    def valid_attempt?
      @attempts < MAX_ATTEMPTS
    end

    def print_remaining_attempts
      "Remaining: #{MAX_ATTEMPTS - @attempts} attempts."
    end
  end
end
