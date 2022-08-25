require "csv"
class Release < ApplicationRecord
  has_one_attached :str
  def to_csv
    if str.attached?
      CSV.foreach((ActiveStorage::Blob.service.path_for(str.key)), headers: true, col_sep: ",")
    end
  end
end
