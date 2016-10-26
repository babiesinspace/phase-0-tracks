require_relative 'game'

describe NoHangMan do 
  let(:secret_phrase) {"hello world"}
  let(:game) { NoHangMan.new("hello world") }

  it "changes phrase to blanks" do
    expect(game.given_phrase).to eq "***** *****"
  end 

  it "determines number of allowed misses" do
    expect(game.wrong_guesses).to eq 3
  end 

  it "determines if your guess is valid" do 
    game.guess_valid("a")
    expect(game.valid_input).to eq true
    expect(game.guess_valid("a")).to eq "a"
  end 

  it "determines if your guess is in the phrase" do
    game.guess_valid("l")
    game.user_guess("l")
    expect(game.win_phrase.include?("l")).to eq true
    expect(game.available_guesses).to eq 3
    expect(game.given_phrase).to eq "**ll* ***l*"
  end 

end 