class Program < ApplicationRecord
  require 'csv'

  validates :sport, :collegeName, presence: true

  has_many :myprograms
  has_many :sports, through: :myprograms
  accepts_nested_attributes_for :myprograms
  accepts_nested_attributes_for :sports

#import when selecting file from local files
  def self.import2(file)
    CSV.foreach(file.path, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      data = {
        sport: row[0],
        coach: row[1],
        email1address: row[2],
        coachPhone: row[3],
        division: row[4],
        region: row[5],
        athleticWebsite: row[6],
        blank: row[7],
        sir: row[8],
        firstName: row[9],
        lastName: row[10],
        collegeName: row[11],
        address: row[12],
        stateAndZip: row[13]
      }

      Program.where( sport: row[0], collegeName: row[11] ).first_or_create(data).update(data)
    end
  end

  def self.import(file)
    CSV.foreach(file, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      data = {
        sport: row[0],
        coach: row[1],
        email1address: row[2],
        coachPhone: row[3],
        division: row[4],
        region: row[5],
        athleticWebsite: row[6],
        blank: row[7],
        sir: row[8],
        firstName: row[9],
        lastName: row[10],
        collegeName: row[11],
        address: row[12],
        stateAndZip: row[13]
      }

      Program.where( sport: row[0], collegeName: row[11] ).first_or_create(data).update(data)
    end
  end

end
