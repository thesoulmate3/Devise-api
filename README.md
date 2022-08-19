## Before starting please do add database.yml file
#### User's registeration
##### Signup => http://127.0.0.1:3000/api/v1/signup
###### Request
```JSON
{
    "user":{
        "email": "rahul@demo.com",
        "password": "password",
        "name": "Rahul R Gupta",
        "phone": "8888888888"
    }
}
```
###### Response
```JSON
{
  "status": 201,
  "user": {
    "id": 4,
    "email": "rahul@demo.com",
    "phone": "8888888888",
    "name": "Rahul R Gupta",
    "created_at": "2022-08-19T18:21:12.508Z",
    "updated_at": "2022-08-19T18:21:12.508Z"
  },
  "message": "User registered successfully"
}
```

#### User Login => http://127.0.0.1:3000/api/v1/login

###### Request
```json
{
  "user": {
    "email": "rahul@demo.com",
    "password": "password"
  }
}
```
###### Response
```json
{
  "user": {
    "id": 5,
    "email": "rahul@demo.com",
    "phone": "8888888888",
    "name": "Rahul R Gupta",
    "created_at": "2022-08-19T18:23:06.651Z",
    "updated_at": "2022-08-19T18:23:06.651Z"
  },
  "status": "created",
  "logged_in": true,
  "message": "Login successful"
}
```

[Postman Collection link ](https://www.getpostman.com/collections/6c36508b5226369fd25d)