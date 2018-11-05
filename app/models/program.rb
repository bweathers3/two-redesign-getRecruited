class Program < ApplicationRecord
  require 'csv'

  #validates :sport, :collegeName, presence: true

  def self.import(file)
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

end


# program_hash = row.to_hash
# program = Program.where(:sport => program_hash['Sport'], :collegeName => program_hash['College-Name'] ).find_or_create_by!(sport: program_hash['Sport'],
#   coach: program_hash['Coach'],
#   email1address: program_hash['Email1address'],
#   coachPhone: program_hash['Coach-Phone'],
#   division: program_hash['Division'],
#   region: program_hash['Region'],
#   athleticWebsite: program_hash['Athletic-Website'],
#   blank: program_hash['blank'],
#   sir: program_hash['Sir'],
#   firstName: program_hash['First Name'],
#   lastName: program_hash['Last Name'],
#   collegeName: program_hash['College-Name'],
#   address: program_hash['Address'],
#   stateAndZip: program_hash['State-and-Zip']
# )

# program.update_attributes(program_hash)
