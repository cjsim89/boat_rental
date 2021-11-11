class Dock
  attr_reader :name,
              :max_rental_time,
              :rentals

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rentals = []
  end

  def rent(boat, renter)
    @rentals << {boat => renter}
  end

  def rental_log
    @rentals
  end

end
