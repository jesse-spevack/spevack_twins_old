class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  def self.unique_months
    Photo.all.map { |photo| photo.date.strftime('%m %Y') }.uniq
  end

  def self.month_year(month, year)
    Photo.where('extract(year from date) = ? and extract(month from date) = ?',
                year, month)
  end
end
