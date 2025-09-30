norman = User.find_by(email: 'nrmndev@gmail.com')
collection = Collection.find_by(title:"Ruby on Rails")
category = Category.find_by(title: 'Programming', slug: 'programming')
pp 'Creating Ruby on Rails topic'
# Add topics to it
topic = Topic.new(title: 'Quick brown fox jumps over the', user: norman, visibility: 0)
topic.user_id = norman.id
topic.save!

topic_2 = Topic.new(title: 'Best Practices', user: norman, visibility: 0)
topic_2.user_id = norman.id
topic_2.save!

# Associate topic to collection_topic
CollectionTopic.create!(
  collection_id: collection.id,
  topic_id: topic.id,
  position: 1
)

CollectionTopic.create!(
  collection_id: collection.id,
  topic_id: topic_2.id,
  position: 2
)

pp "Creating 'installation' article for Ruby on rails"
############# POST AND PARTS FOR TOPIC 1
post = Post.new(title: 'Installation & Setup', slug: 'installation', visibility: 0)
# post.topic_id = topic.id
post.user_id = topic.user_id
post.save!

TopicPost.create!(
  topic_id: topic.id,
  post_id: post.id,
  position: 1
)

part = Part.new(title: 'Prerequisites', description: '<ul>
        <li>Install a compatible version of Ruby (check `ruby -v`).</li>
        <li>Install a database (e.g. PostgreSQL, SQLite, MySQL) and its client library.</li>
        <li>Install bundler (`gem install bundler`) and ensure you have a working gem environment.</li>
        <li>Set up version manager (rbenv, rvm, chruby) so you can manage Ruby versions cleanly.</li>
      </ul>', visibility: 0)
part.post_id = post.id
part.user_id = topic.user_id
part.save!


part2 = Part.new(title: 'Create the Rails Application', description: '<ul>
        <li>Run `rails new my_app` (optionally with flags: `--database=postgresql`, `--css=tailwind`, `--skip-javascript`, etc.).</li>
        <li>Change directory into the app and inspect the generated folder structure.</li>
        <li>Run `bin/rails db:create` (or `rails db:create`) to create the database.</li>
        <li>Run `bin/rails server` and visit `http://localhost:3000` to confirm the app boots.</li>
      </ul>', visibility: 0)
part2.post_id = post.id
part2.user_id = topic.user_id
part2.save!

part3 = Part.new(title: 'Configure JavaScript / Assets', description: '<ul>
        <li>Choose your JS approach (importmap, Webpacker, esbuild, or a bundler) depending on Rails version.</li>
        <li>Install and configure needed JS dependencies (e.g. pinning via importmap or installing via npm/yarn).</li>
        <li>Ensure CSS / asset pipeline (Sass, PostCSS, Tailwind, etc.) is set up correctly.</li>
        <li>Confirm that the default layout loads CSS/JS in browser dev tools.</li>
      </ul>', visibility: 0)
part3.post_id = post.id
part3.user_id = topic.user_id
part3.save!

part4 = Part.new(title: 'Initial Configuration & Secrets', description: '<ul>
        <li>Set up `config/database.yml` for your environment (development, test, production).</li>
        <li>Set environment variables / credentials (via `rails credentials:edit` or `.env` for secrets).</li>
        <li>Configure basic middleware / CORS / host settings (e.g. in `config/environments/development.rb`).</li>
        <li>Commit the initial app scaffold to version control (e.g. git).</li>
      </ul>', visibility: 0)
part4.post_id = post.id
part4.user_id = topic.user_id
part4.save!


################ POST AND PARTS FOR TOPIC 2
post2 = Post.new(title: 'Important Gems / Libraries', slug: 'important-gems', visibility: 0)
post2.user_id = topic.user_id
post2.save!

TopicPost.create!(
  topic_id: topic.id,
  post_id: post2.id,
  position: 1
)

part1_2 = Part.new(title: 'Authentication / Authorization', description: '<ul>
        <li>Devise for user authentication (login, registration, password recovery).</li>
        <li>Pundit or CanCanCan for authorization / permissions control.</li>
        <li>OmniAuth (and provider gems) for social login (e.g. Google, GitHub).</li>
        <li>JWT / devise-jwt if you need token-based APIs / stateless auth.</li>
      </ul>', visibility: 0)
part1_2.post_id = post2.id
part1_2.user_id = topic.user_id
part1_2.save!

part2_2 = Part.new(title: 'Utilities & Productivity Enhancers', description: '<ul>
        <li>pry / pry‑rails for improved REPL / debugging experience.</li>
        <li>faker for generating fake data (in seeds / tests).</li>
        <li>kaminari or will_paginate for pagination.</li>
        <li>sidekiq (with redis) or delayed_job for background jobs / async processing.</li>
      </ul>', visibility: 0)
part2_2.post_id = post2.id
part2_2.user_id = topic.user_id
part2_2.save!


part3_2 = Part.new(title: 'Front-end / View Helpers', description: '<ul>
        <li>turbo-rails to enable Turbo (Drive, Streams, Frames) in Rails. </li>
        <li>stimulus-rails to integrate Stimulus JS controllers.</li>
        <li>view_component or cells for componentized view logic.</li>
        <li>image_processing / mini_magick / vips for handling image manipulations. </li>
      </ul>', visibility: 0)
part3_2.post_id = post2.id
part3_2.user_id = topic.user_id
part3_2.save!

part4_2 = Part.new(title: 'Testing, Debugging & Tooling', description: '<ul>
        <li>rspec-rails or minitest for writing tests.</li>
        <li>factory_bot for factories instead of fixtures.</li>
        <li>simplecov for test coverage metrics.</li>
        <li>bullet gem to detect N+1 queries / performance issues.</li>
      </ul>', visibility: 0)
part4_2.post_id = post2.id
part4_2.user_id = topic.user_id
part4_2.save!

################ POST AND PARTS FOR TOPIC 3
post3 = Post.new(title: 'Controllers & Routing', slug: 'controllers-routing', visibility: 0)
post3.user_id = topic.user_id
post3.save!

TopicPost.create!(
  topic_id: topic.id,
  post_id: post3.id,
  position: 1
)

part1_3 = Part.new(title: 'Controller Basics', description: '<ul>
        <li>Generate controller: `rails generate controller Posts index show new create`.</li>
        <li>Define actions (methods) inside controllers and render views or redirect.</li>
        <li>Use `before_action` / `after_action` / filters to share logic.</li>
        <li>Strong parameters (`params.require(:model).permit(...)`) to whitelist allowed fields.</li>
      </ul>', visibility: 0)
part1_3.post_id = post3.id
part1_3.user_id = topic.user_id
part1_3.save!

part2_3 = Part.new(title: 'RESTful Routing', description: '<ul>
        <li>Define `resources :posts` (and possibly nested resources) in `config/routes.rb`.</li>
        <li>Use route helpers (e.g. `posts_path`, `new_post_path`, `edit_post_path`).</li>
        <li>Custom member / collection routes (e.g. `member do`, `collection do`).</li>
        <li>Use constraints, scopes, or namespaces if organizing controllers (e.g. `/admin`).</li>
      </ul>', visibility: 0)
part2_3.post_id = post3.id
part2_3.user_id = topic.user_id
part2_3.save!


part3_3 = Part.new(title: 'Rendering & Layouts', description: ' <ul>
        <li>By default, controllers use `application.html.erb` unless overridden.</li>
        <li>Use `layout "other_layout"` or `layout false` to customize per controller.</li>
        <li>Render partials via `render partial: "form", locals: { … }` or `render @posts`.</li>
        <li>Respond to different formats (`html`, `json`, `turbo_stream`) using `respond_to` / `format.` blocks.</li>
      </ul>', visibility: 0)
part3_3.post_id = post3.id
part3_3.user_id = topic.user_id
part3_3.save!

part4_3 = Part.new(title: 'Error Handling, Concerns & Callbacks', description: '<ul>
        <li>Use `rescue_from` in controllers (or `ApplicationController`) to catch exceptions.</li>
        <li>Extract shared logic into controller concerns / modules.</li>
        <li>Use service objects / query objects for complex controller logic to keep controllers thin.</li>
        <li>Be careful with recursion / infinite loops in before/after actions causing hangs.</li>
      </ul>', visibility: 0)
part4_3.post_id = post3.id
part4_3.user_id = topic.user_id
part4_3.save!



################ POST AND PARTS FOR TOPIC 3
post4 = Post.new(title: 'Turbo (Hotwire: Frames, Streams, Drive)', slug: 'turbo-hotwire', visibility: 0)
post4.user_id = topic.user_id
post4.save!

TopicPost.create!(
  topic_id: topic.id,
  post_id: post4.id,
  position: 1
)

part1_4 = Part.new(title: 'Install & Setup Turbo', description: '<ul>
        <li>Add `gem "turbo-rails"` and run `bundle install`. </li>
        <li>Run `rails turbo:install` (for Rails 6 apps) or ensure import/pinning setup for JS.</li>
        <li>Verify that Turbo is enabled (especially Drive) — e.g. in Rails 7 its included by default unless skipped. :content</li>
        <li>Ensure Turbos JS is loaded in application layout / packs.</li>
      </ul>', visibility: 0)
part1_4.post_id = post4.id
part1_4.user_id = topic.user_id
part1_4.save!

part2_4 = Part.new(title: 'Using Turbo Drive & Frames', description: '<ul>
        <li>Treat normal `<a>` and `<form>` tags as drive-enabled (partial page navigation).</li>
        <li>Wrap sections of HTML in `turbo_frame_tag` so updates target only those frames.</li>
        <li>Link or form with `data: { turbo_frame: "frame_id" }` to target specific frames.</li>
        <li>Use `data-turbo="false"` to disable drive behavior where needed.</li>
      </ul>', visibility: 0)
part2_4.post_id = post4.id
part2_4.user_id = topic.user_id
part2_4.save!


part3_4 = Part.new(title: 'Turbo Streams / Real-time Updates', description: '<ul>
        <li>Use `broadcasts_to` / `has_many :through` + `after_create_commit` to broadcast model changes.</li>
        <li>Render `.turbo_stream.erb` templates for create/update/destroy actions.</li>
        <li>Use `turbo_stream.update`, `turbo_stream.append`, `turbo_stream.remove` helpers in templates. </li>
        <li>Use `turbo_stream_from` in views to subscribe to a broadcast channel. </li>
      </ul>', visibility: 0)
part3_4.post_id = post4.id
part3_4.user_id = topic.user_id
part3_4.save!

part4_4 = Part.new(title: 'Troubleshooting & Best Practices', description: '<ul>
        <li>Ensure matching `id` / `dom_id` for targets when streaming updates.</li>
        <li>Mind multiple subscribers / channels in development (Action Cable adapter). </li>
        <li>Test with `format.turbo_stream` in controllers in addition to `html` fallback. </li>
        <li>Avoid mixing heavy JS — let Turbo handle what’s possible to reduce complexity. </li>
      </ul>', visibility: 0)
part4_4.post_id = post4.id
part4_4.user_id = topic.user_id
part4_4.save!

################ POST AND PARTS FOR TOPIC 3
post5 = Post.new(title: 'Database Seeding & Test Data', slug: 'database', visibility: 0)
post5.user_id = topic.user_id
post5.save!

TopicPost.create!(
  topic_id: topic.id,
  post_id: post5.id,
  position: 1
)

part1_5 = Part.new(title: 'Seeding Basics', description: '<ul>
        <li>Use `db/seeds.rb` to write code that populates initial data.</li>
        <li>Use ActiveRecord models to create records (e.g. `User.create!`) in the seed file.</li>
        <li>Run `rails db:seed` after migrations to load seed data.</li>
        <li>Use conditional or idempotent code (e.g. check `Model.exists?`) to avoid duplicates on re-run.</li>
      </ul>', visibility: 0)
part1_5.post_id = post5.id
part1_5.user_id = topic.user_id
part1_5.save!

part2_5 = Part.new(title: 'Using Faker / Factories in Seeds', description: '<ul>
        <li>Use `faker` gem to generate random names, emails, content, etc.</li>
        <li>Combine with loops: `10.times { Post.create!( title: Faker::Book.title, … ) }`.</li>
        <li>Use associations (e.g. `user.posts.create!`) to link seeded records.</li>
        <li>Optionally separate seed files (e.g. `seeds/users.rb`, `seeds/posts.rb`) and load them in `seeds.rb` for structure.</li>
      </ul>', visibility: 0)
part2_5.post_id = post5.id
part2_5.user_id = topic.user_id
part2_5.save!


part3_5 = Part.new(title: 'Seeding for Development vs Production', description: '<ul>
        <li>Use environment guards: `if Rails.env.development?` to avoid seeding large test data in production.</li>
        <li>Use `rails db:setup` which runs `db:create`, `db:migrate`, and `db:seed` in one command.</li>
        <li>Clear or reset data (e.g. `Model.delete_all`) before reseeding if needed.</li>
        <li>Version control seed data (if small / essential) so team members share consistent defaults.</li>
      </ul>', visibility: 0)
part3_5.post_id = post5.id
part3_5.user_id = topic.user_id
part3_5.save!

part4_5 = Part.new(title: 'Testing with Seeded / Test Data', description: ' <ul>
        <li>Use factories (factory_bot) in test / spec environments rather than relying on seeds.</li>
        <li>Optionally load seed data in test setup if needed for integration tests.</li>
        <li>Write assertions validating presence / structure of seeded records.</li>
        <li>Keep seeds simple and fast — not too many heavy operations so tests / CI don’t slow down.</li>
      </ul>', visibility: 0)
part4_5.post_id = post5.id
part4_5.user_id = topic.user_id
part4_5.save!
