class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  def self.unique_month_years
    Photo.all.map { |photo| photo.date.strftime('%m %Y') }.uniq
  end

  def self.month_year(month, year)
    Photo.where('extract(year from date) = ? and extract(month from date) = ?',
                year, month)
  end

  def self.get_first_photo_of_each_month
    unique_month_years.map { |d| Photo.month_year(year(d), month(d)).first }
  end

  private

    def self.year(month_year)
      month_year.split(" ").first
    end

    def self.month(month_year)
      month_year.split(" ").last
    end
end
