module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map do |type, message|
      bootstrap_class = case type.to_sym
                        when :notice then 'alert alert-success'
                        when :alert then 'alert alert-danger'
                        when :error then 'alert alert-danger'
                        when :warning then 'alert alert-warning'
                        else 'alert alert-info'
                        end
      content_tag(:div, message, class: bootstrap_class)
    end.join.html_safe
  end
end
