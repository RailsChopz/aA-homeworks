class Person < ApplicationRecord
  validates :name, presence: true
  validates :house_id, presence: true

  belongs_to(
    :house,
    class_name: :House,
    foreign_key: :house_id,
    primary_key: :id
  )

  def self.how_long_to_find_joonho_in_ms
    start = Time.now
    Person.where(name: 'Joonho').to_a
    (Time.now - start) * 1000
  end
end