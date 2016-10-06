class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create

    github = GithubService.new
    github.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    @access_token = session[:token]
    redirect_to '/'
  end
end

## secret  -   164edef9f97fe23ba7eb95817bf0cff1a854016e
##client -    7b7fcd1ccc5eb1003a85