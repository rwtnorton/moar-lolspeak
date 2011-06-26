# Shamelessly lifted from:
# http://cpansearch.perl.org/src/KCOWGILL/Acme-LOLCAT-0.0.5/lib/Acme/LOLCAT.pm

module Moar
  module Lolspeak
    LOL_REPLACEMENTS = {
      /what/       => %w{wut whut},
      /you\b/      => %w{yu yous yoo u},
      /cture/      => 'kshur',
      /unless/     => 'unles',
      /the\b/      => 'teh',
      /more/       => 'moar',
      /my/         => %w{muh mah},
      /are/        => %w{r is ar},
      /eese/       => 'eez',
      /ph/         => 'f',
      /as\b/       => 'az',
      /seriously/  => 'srsly',
      /er\b/       => 'r',
      /sion/       => 'shun',
      /just/       => 'jus',
      /ose\b/      => 'oze',
      /eady/       => 'eddy',
      /ome?\b/     => 'um',
      /of\b/       => %w{of ov of},
      /uestion/    => 'wesjun',
      /want/       => 'wants',
      /ead\b/      => 'edd',
      /ucke/       => %w{ukki ukke},
      /sion/       => 'shun',
      /eak/        => 'ekk',
      /age/        => 'uj',
      /like/       => %w{likes liek},
      /love/       => %w{loves lub lubs luv},
      /\bis\b/     => ['ar teh','ar'],
      /nd\b/       => 'n',
      /who/        => 'hoo',
      /'/          => %q{},
      /ese\b/      => 'eez',
      /outh/       => 'owf',
      /scio/       => 'shu',
      /esque/      => 'esk',
      /ture/       => 'chur',
      /\btoo?\b/   => %w{to t 2 to t},
      /tious/      => 'shus',
      /sure\b/     => 'shur',
      /tty\b/      => 'tteh',
      /were/       => 'was',
      /ok\b/       => %w{'k kay},
      /\ba\b/      => %q{},
      /ym/         => 'im',
      /thy\b/      => 'fee',
      /\wly\w/     => 'li',
      /que\w/      => 'kwe',
      /oth/        => 'udd',
      /ease/       => 'eez',
      /ing\b/      => %w{in ins ng ing},
      /have/       => ['has', 'hav', 'haz a'],
      /your/       => %w{yur ur yore yoar},
      /ove\b/      => %w{oov ove uuv uv oove},
      /for/        => %w{for 4 fr fur for foar},
      /thank/      => %w{fank tank thx thnx},
      /good/       => %w{gud goed guud gude gewd},
      /really/     => %w{rly rily rilly rilley},
      /world/      => %w{wurrld whirld wurld wrld},
      /i'?m\b/     => 'im',
      /(?!e)ight/  => 'ite',
      /(?!ues)tion/      => 'shun',
      /you'?re/          => %w{yore yr},
      /\boh\b(?!.*hai)/  => %w{o ohs},
      /can\si\s(?:ple(?:a|e)(?:s|z)e?)?\s?have\sa/ => 'i can has',
      /(?:hello|\bhi\b|\bhey\b|howdy|\byo\b),?/    => 'oh hai,',
      /(?:god|allah|buddah?|diety)/                => 'ceiling cat',
    }

    def self.translate(phrase)
      phrase.downcase!

      LOL_REPLACEMENTS.each_pair do |english_snippet, lol_snippet|
        phrase.gsub!(english_snippet) do |match|
          lol_snippet.is_a?(Array) ? lol_snippet.sample : lol_snippet
        end
      end

      phrase.gsub!(/\s{2,}/, ' ')
      phrase.gsub!(/teh teh/, 'teh') # meh, it happens sometimes.
      phrase << '.  kthxbye!' if rand(10) == 2
      phrase << '.  kthx.'    if rand(10) == 1
      phrase.gsub!(/(\?|!|,|\.)\./, '\1')

      phrase.upcase
    end
  end
end

class String
  unless method_defined?(:to_lolspeak)
    def to_lolspeak
      Moar::Lolspeak.translate(self)
    end
  end
end
