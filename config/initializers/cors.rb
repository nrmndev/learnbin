Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # You can replace '*' with 'http://localhost:5173' for security
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
