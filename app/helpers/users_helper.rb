module UsersHelper
  def gravatar_for(user, option = { size: 40 })
  	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  	size = option[:size];
  	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  	image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
