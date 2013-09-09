json.array!(@products) do |product|
  json.extract! product, :[prod_name, :string, :cat_id, :string, :user_id, :integer]
  json.url product_url(product, format: :json)
end
