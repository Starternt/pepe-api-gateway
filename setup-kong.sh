
###> Services ###
# PEPE-POSTS
KEY="test123"
curl -i -s -X POST http://localhost:8001/services \
  --data name=pepe-posts \
  --data url='http://192.168.246.1:47819'
curl -i -X POST http://localhost:8001/services/pepe-posts/routes \
  --data 'paths[]=/posts' \
  --data name=create_post


# PEPE-USERS
curl -i -s -X POST http://localhost:8001/services \
  --data name=pepe-users \
  --data url='http://192.168.228.1:47096'
curl -i -X POST http://localhost:8001/services/pepe-users/routes \
  --data 'paths[]=/users' \
  --data name=auth


# JWT SETUP
curl -X POST http://localhost:8001/routes/create_post/plugins \
    --data "name=jwt"
curl -d "username=admin&custom_id=admin" http://localhost:8001/consumers/
curl -X POST http://localhost:8001/consumers/admin/jwt \
  -F "algorithm=RS256" \
  -F "key=$KEY" \
  -F "rsa_public_key=@config/jwt/public.pem"

###< Services ###
