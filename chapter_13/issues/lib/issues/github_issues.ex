defmodule Issues.GithubIssues do

  require Logger

  @github_url Application.get_env(:issues, :github_url)
  @user_agent [ { "User-agent", "Elixir dave@pragprog.com" } ]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    Logger.info "Successful response"
    Logger.debug fn -> inspect(body) end
    { :ok, :jsx.decode(body) }
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: status, body: body}}) do
    Logger.error "Error #{status} returned"
    { :error, :jsx.decode(body) }
  end
end
