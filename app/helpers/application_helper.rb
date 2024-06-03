module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map do |type, message|
      alert_class = case type.to_sym
                        when :notice then 'success'
                        when :alert then 'danger'
                        when :error then 'danger'
                        when :warning then 'warning'
                        else 'info'
                        end
      content_tag(:div, message, class: "alert alert-#{alert_class}")
    end.join.html_safe
  end
end
