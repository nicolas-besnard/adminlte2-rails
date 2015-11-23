`curl https://raw.githubusercontent.com/almasaeed2010/AdminLTE/master/dist/js/app.min.js --create-dirs -o assets/js/AdminLTE2/app.min.js`
`curl https://raw.githubusercontent.com/almasaeed2010/AdminLTE/master/dist/css/AdminLTE.min.css --create-dirs -o assets/css/AdminLTE2/app.min.js`

require 'net/http'
require 'json'

api_uri = URI("https://api.github.com/repos/almasaeed2010/AdminLTE/contents/dist/css/skins")

response = Net::HTTP.get_response(api_uri)
response = JSON.parse(response.body)

response.each do |file|
  file_name = file['name']
  
  if file_name =~ /min.css/i
    file_url = file['download_url']
    `curl #{file_url} --create-dirs -o assets/css/AdminLTE2/skins/#{file_name}`
  end
end
