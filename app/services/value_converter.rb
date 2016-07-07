class ValueConverter

  def self.price_to_cents value
    return nil if value.nil?
    return nil if self.not_a_pricey_thing?(value)
    floaty_value = self.format_as_decimal(value)
    return (floaty_value * 100).round
  end

  private

  def self.format_as_decimal value
    value.to_s.gsub(/[^0-9\.]/,"").to_f
  end

  def self.not_a_pricey_thing? value
    value.to_s.match(/[^$0-9\.,]+/)
  end
end
