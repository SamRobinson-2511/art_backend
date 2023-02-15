fields = %w[id title artist_display date_display is_on_view ]
art_response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?#{fields}page=2&limit=10"))

query = 
art_search = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?#{fields}#{query}page=2&limit=10"))

