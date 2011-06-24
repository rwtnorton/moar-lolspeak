require 'moar-lolspeak'

describe Moar::Lolspeak do
  it "can has cheezburger" do
    Moar::Lolspeak.translate(
      'Hello, can I please have a cheeseburger?').should =~
      /\AOH HAI, CAN I PLEEZ HA[SZV] (?:A )?CHEEZBURGR\?/
  end
end
