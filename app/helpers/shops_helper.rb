module ShopsHelper
	def gravatar_for(shop)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: shop.name, class: "gravatar")
  end
end
