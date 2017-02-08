class Event < ApplicationRecord

  def self.get_month(year, month)
    self.where('
      extract(year from start_date) = ? and extract(month from start_date) = ?
      ', year, month)
  end
end
