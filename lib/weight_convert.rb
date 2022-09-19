class WeightConvert
  UNIT = %w[gram kilogram]

	def self.call(args = {})
		new(args).call
	end

  # options =  { to: '', from: '', unit: ''}
	def initialize(options = {})
		@from = options[:from]
    @to = options[:to]
    @unit = options[:unit]
	end

	def call
		send("#{@from}_to_#{@to}") * @unit
	end

  private

  def gram_to_kilogram
    0.001
  end

  def kilogram_to_gram
    1000
  end

end