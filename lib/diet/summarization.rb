module BrighterPlanet
  module Diet
    module Summarization
      def self.included(base)
        base.summarize do |has|
          has.adjective lambda { |diet| "#{diet.size}-calorie" }, :if => :size
          has.adjective 'local', :if => :local?
          has.adjective 'organic', :if => :organic?
          has.adjective [:diet_class, :name], :if => :diet_class
          has.identity
          has.verb :have
        end
      end
    end
  end
end
