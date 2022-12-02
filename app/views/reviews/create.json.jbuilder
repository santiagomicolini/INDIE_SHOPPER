if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {shop: @shop, review: Review.new})
  json.inserted_item render(partial: "shops/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {shop: @shop, review: @review})
end
