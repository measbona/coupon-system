json.extract! campaign, :id, :name, :prefix, :suffix, :code_length, :code_count, :charset, :started_at, :ended_at, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
