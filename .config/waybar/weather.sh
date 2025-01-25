
#!/bin/sh
# Function to determine weather icon based on condition

get_icon() {
    case $1 in
        01d) icon="" ;;  # Clear sky (day)
        01n) icon="" ;;  # Clear sky (night)
        02d) icon="" ;;  # Few clouds (day)
        02n) icon="" ;;  # Few clouds (night)
        03*) icon="" ;;  # Scattered clouds
        04*) icon="" ;;  # Broken clouds
        09*) icon="" ;;  # Shower rain
        10d) icon="" ;;  # Rain (day)
        10n) icon="" ;;  # Rain (night)
        11*) icon="" ;;  # Thunderstorm
        13*) icon="" ;;  # Snow
        50*) icon="" ;;  # Mist
        *)    icon="" ;;  # Default or unknown
    esac
    echo "$icon"
}
get_icon() {
    case $1 in
        01d) icon="" ;;  # Clear sky (day)
        01n) icon="" ;;  # Clear sky (night)
        02d) icon="" ;;  # Few clouds (day)
        02n) icon="" ;;  # Few clouds (night)
        03*) icon="" ;;  # Scattered clouds
        04*) icon="" ;;  # Broken clouds
        09*) icon="" ;;  # Shower rain
        10d) icon="" ;;  # Rain (day)
        10n) icon="" ;;  # Rain (night)
        11*) icon="" ;;  # Thunderstorm
        13*) icon="" ;;  # Snow
        50*) icon="" ;;  # Mist
        *)    icon="" ;;  # Unknown or default
    esac
    echo "$icon"
}

# Your API key
KEY="e434b5435a979de6e155570590bee89b"

# City name
#CITY="Dhaka"

# Units for temperature (metric = Celsius, imperial = Fahrenheit)
UNITS="metric"

# Temperature symbol
SYMBOL="°"

# OpenWeatherMap API endpoint
API="https://api.openweathermap.org/data/2.5"

# Fetching weather data based on city or location
# Check if the CITY variable is set (for city-based weather fetching)
if [ -n "$CITY" ]; then
    # Use "q" for city name or "id" for city ID in the API query
    CITY_PARAM="q=$CITY"
    
    # Fetch weather data for the specified city
    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    #location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)
    location=$(curl -sf http://ip-api.com/json)

    if [ -n "$location" ]; then
        # for mozilla location
        #location_lat="$(echo "$location" | jq '.location.lat')"
        #location_lon="$(echo "$location" | jq '.location.lng')"
        # for ip-api location
        location_lat="$(echo "$location" | jq '.lat')"
        location_lon="$(echo "$location" | jq '.lon')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

# Check if weather data was successfully fetched
if [ -n "$weather" ]; then
    # Extract temperature and weather condition icon code
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    # Display the weather icon and temperature
    echo "$(get_icon "$weather_icon") $weather_temp$SYMBOL"
else
    echo "Unable to fetch weather data."
fi
