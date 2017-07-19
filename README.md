# Caltrain

This is an application which helps users to easily lookup train schedules between stations.

Heroku Link: https://belle-vin-42587.herokuapp.com/

## Technologies used:
- Rails version 5.1.2
- Ruby version 2.4.0
- Clearance gem for managing User sessions
- Postgresql as the database
- Materialize for styling and CSS

## Existing Features:
- Users can view schedules for upcoming Caltrains by selecting the "From" and "To" dropdowns and providing the departure time.
- Once signed up a user can
    - Add a particular route(between two stations) to his favorites
    - Delete routes from his favorites
    - Set "from" and "to" dropdowns by clicking on stations on a map

## Planned Features:
- Integrate BART and Muni data as well


## Screenshot of the app
![screenshot #1](/public/assets/Bayrails_splash.png?raw=true "Bayrails")

![screenshot #2](/public/assets/Bayrails_maps.png?raw=true "Bayrails-maps")

![screenshot #3](/public/assets/Map_view.png?raw=true "Bayrails-map-view")

![screenshot #4](/public/assets/Trip_details.png?raw=true "Bayrails-trip-details")



## Endpoints:
- get '/', to: 'stations#index', as: 'stations'
- get "/sign_in" => "clearance/sessions#new", as: "sign_in"
- delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
- get "/sign_up" => "clearance/users#new", as: "sign_up"
- get '/stops', to: 'stops#index', as: 'stops'
- post '/stations', to: 'stops#index'
- get '/stops/:id', to: 'stops#show', as:'stops_details'
- get '/favorites', to: 'favorites#index'
- post '/favorites', to: 'favorites#create', as:'create_favorite'
- delete '/favorites/:id', to: 'favorites#destroy', as: 'delete_favorite'
