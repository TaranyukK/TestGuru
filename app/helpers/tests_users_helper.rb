module TestsUsersHelper
  def gist_url(url)
    link_to t('helpers.tests_users.link'), url, target: '_blank', style: 'text-decoration:underline'
  end
end
