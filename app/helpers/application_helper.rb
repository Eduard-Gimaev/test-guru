module ApplicationHelper
  def current_year
    " - #{Time.now.year.to_i} - "
  end

  def github_url(author, repo)
    url = "https://github.com/#{author}/#{repo}"
    # link_to repo.capitalize, url, target: "_blank", rel: "nofollow noopener", class: "nav-link px-2"
  end
end


