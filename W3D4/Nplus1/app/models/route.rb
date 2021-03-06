class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    buses = self.buses.includes(:drivers)

    drivers = Hash.new {|h,k| h[k] = []}

    buses.each do |bus|
      bus.drivers.each do |driver|
        drivers[bus.id] << driver.name
      end
    end

    drivers
  end
end
