class House < ApplicationRecord
  has_many :gardeners,
    class_name: 'Gardener',
    foreign_key: :house_id,
    primary_key: :id

  has_many :plants,
    through: :gardeners,
    source: :plants

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    plants = self.plants.includes(:seeds)
    seeds = []

    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  
    # plants = self
    #   .plants
    #   .select('plants.*, COUNT(*) AS seed_count')
    #   .joins(:seeds)
    #   .group('plants.id')
    #
    #   plant_counts = {}
    #   plants.each do |plant|
    #     plant_counts[plant.species] = plant.seed_count
    #   end
    #
    #   plant_counts
  end
end
