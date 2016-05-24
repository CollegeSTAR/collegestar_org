require 'date'

namespace :collegestar do
  desc "Use pg_dump to backup collegestar database"
  task backup_db: :environment do
    sh "PGPASSWORD=\"#{ENV['DB_PASS']}\" pg_dump -h localhost -U #{ENV['DB_USER']} #{ENV['DATABASE']} > #{Time.now.strftime("%Y%m%d%H%M")}_#{ENV['DATABASE']}.sql"
  end
end
