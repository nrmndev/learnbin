puts "Fixing missing positions on collection_topics"
Collection.find_each do |collection|
  collection.collection_topics.order(:created_at).each.with_index(1) do |ct, idx|
    ct.update_column(:position, idx) if ct.position.nil?
  end
end
