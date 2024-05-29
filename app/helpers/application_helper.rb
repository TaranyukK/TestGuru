module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map do |type, message|
      content_tag(:p, message, class: "flash #{type}")
    end.join.html_safe
  end
end
