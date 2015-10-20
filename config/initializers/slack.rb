SLACK = {
  client_id: ENV["SLACK_CLIENT_ID"],
  client_secret: ENV["SLACK_CLIENT_SECRET"],
  authorize_uri: "https://slack.com/oauth/authorize",
  redirect_uri: ENV["SLACK_REDIRECT_URI"],
  token_uri: "https://slack.com/api/oauth.access"
}
