# empty as yet
module Refinery
  module Portfolio
    class Version
      MAJOR = 0
      MINOR = 9
      TINY = 6
      BUILD = nil
      
      STRING = [MAJOR, MINOR, TINY, BUILD].compact.join('.')
    end
  end      
end