module ApplicationHelper
  def embed(youtube_url)
    content_tag(:iframe, nil, src: youtube_url, class: ["w-100", "h-100"])
  end
end
