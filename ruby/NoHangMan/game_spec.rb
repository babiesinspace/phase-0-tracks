require_relative 'game'

describe NoHangMan do 

  it "determines number of allowed misses" do
    game = NoHangMan.new("hello world") 
    expect(game.allowed_guesses).to eq 3
  end 

  it "determines if your guess is valid" do 
    game = NoHangMan.new("hello world")
    expect(game.guess_valid(String)).to eq ([*'a'...'z'])
  end 

  it "determines if your guess is in the phrase" do
    game = NoHangMan.new("hello world")
    expect(user_guess('a')).to eq @given_phrase
  end 

end 