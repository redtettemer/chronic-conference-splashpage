namespace :import do
  desc "Import CSV emails"


  task :csv => :environment do
    require 'csv'
    csv_text = File.read("#{Rails.root}/public/Nov-2017.csv")
    csv = CSV.parse(csv_text, :headers => false)
    csv.each do |row|
      if row[0].present?
        if row[0].include?(',')
          first = row[0].split(',')[0]
          last = row[0].split(',')[1]
        else
          first = row[0].split(' ')[0]
          last = row[0].split(' ')[1]
        end

        Guest.create!({
                          :first_name => first,
                          :last_name => last,
                          :email => row[1],
                          :company_name => row[2]
                      })
      end
      end


  end

  desc "Import XLS emails"
  task :xls => :environment do
    require 'roo'

    xlsx = Roo::Spreadsheet.open("#{Rails.root}/public/boston.xlsx", extension: :xlsx)
    num = xlsx.count

    for i in 1..num
      row = xlsx.row(i)
      name = row[0].split(' ')
      first = name[0]
      last = name[1]
      company_name = row[1]
      email = row[2]
      broker = row[3]
      c21_company = row[4]
      rank = row[5]
      if email.present?
        Guest.create(:first_name => first, :last_name => last, :email => email, :rank => rank, :company_name => company_name,
                     :c21_company => c21_company, :broker => broker)
      end
    end

    xlsx = Roo::Spreadsheet.open("#{Rails.root}/public/boston3.xlsx", extension: :xlsx)
    num = xlsx.count

    for i in 1..num
      row = xlsx.row(i)
      first = row[0]
      last = row[1]
      company_name = row[2]
      email = row[3]
      rank = row[4]
      if email.present?
        Guest.create(:first_name => first, :last_name => last, :email => email, :rank => rank, :company_name => company_name)
      end
    end
  end

  task :grouped_csv => :environment do
    require 'roo'

    xlsx = Roo::Spreadsheet.open("#{Rails.root}/public/BostonInvites.xlsx", extension: :xlsx)
    num = xlsx.count

    for i in 2..num
      row = xlsx.row(i)
      puts row

      name = row[0].split(' ')
      first = name[0]
      last = name[1]
      company_name = row[1]
      email = row[2].downcase.strip
      broker = row[3]
      c21_company = row[4]
      rank = row[5]
      if email.present?
        Guest.create(:first_name => first, :last_name => last, :email => email, :rank => rank, :company_name => company_name,
                     :c21_company => c21_company, :broker => broker)
      end
    end

  end

end
