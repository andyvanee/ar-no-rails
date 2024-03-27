task :default => [:'db:drop', :'db:migrate', :'db:seed']

namespace :db do
    def log_task(description)
        puts "\n>>> #{description}\n"
    end

    task :connect do
        require './db/db'
    end

    desc 'Migrate the database'
    task :migrate => :connect do
        log_task("Migrate the database")
        ActiveRecord::MigrationContext.new(File.join('db', 'migrate'), ActiveRecord::SchemaMigration).migrate
    end

    desc "Drop the database"
    task :drop do
        log_task("Drop the database")
        require 'yaml'
        db_config = YAML::load(File.open('./database.yml'))
        database = db_config["database"]
        if File.file?(database)
            puts "Deleting #{database}"
            File.delete(db_config["database"])
        end
    end

    desc "Seed the database"
    task :seed do
        log_task("Seed the database")
        require './db/seed'
    end
end
