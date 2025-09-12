namespace :db do
  desc "Drop, create, migrate, seed, then start server"
  task r_s: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
    # exec "rails server"
  end
end
