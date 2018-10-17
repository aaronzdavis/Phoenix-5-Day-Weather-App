class Weather

  def initialize zipcode=85003, country_code='us'
    @zipcode = zipcode
    @country_code = country_code
  end

  def data
    if @zipcode.blank?
      raise "Zipcode cannot be blank"
    else
      url = 'https://samples.openweathermap.org/data/2.5/forecast'

      query = {
        zip: [@zipcode, @country_code].join(','),
        appid: 'e1e8745a9feec7cd789b6d2c05503d79'
      }

      HTTParty.get url, query: query
    end
  end

  def five_day_forecast
    # Get one list item for each 24 hour peroid
    self.data['list'].each_slice(8).map(&:first)
  end

  def self.kelvin_to_fahrenheit k
    f = (k - 273.15) * (9.0/5.0) + 32.0
    f.round
  end

end