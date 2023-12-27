from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

# Define your HERE API key (place it here securely or use environment variables)
API_KEY = "Eva5ydwsdS6Py141TMa5UwT0c74q9UuIhSDF31AQNi8"  # Replace with your actual HERE API key


@app.route('/', methods=['GET'])
def get_results():
    query_dict = request.args.to_dict(flat=False)
    req = query_dict.get('requesting', [None])[0]

    if req == "address":
        latitude = query_dict.get('latitude', [None])[0]
        longitude = query_dict.get('longitude', [None])[0]

        # Construct the reverse geocoding URL
        rev_geocode_url = f"https://revgeocode.search.hereapi.com/v1/revgeocode?at={latitude},{longitude}&apiKey={API_KEY}"

        # Make a GET request to the HERE API for reverse geocoding
        response = requests.get(rev_geocode_url)

        if response.status_code == 200:
            data = response.json()
            try:
                address = data['items'][0]['address']['label']
                return jsonify({"Address": address}), 200
            except KeyError:
                return jsonify({"Error": "Address details not found for the provided coordinates."}), 400

        else:
            return jsonify({"Error": f"Error fetching data. Status Code: {response.status_code}"}), 400

    elif req == "location":
        address = query_dict.get('address', [None])[0]  # Get address from query parameters

        # Construct the geocoding URL
        geocode_url = f"https://geocode.search.hereapi.com/v1/geocode?q={address}&apiKey={API_KEY}"

        # Make a GET request to the HERE Maps API to get geocode data
        response = requests.get(geocode_url)

        if response.status_code == 200:
            data = response.json()
            try:
                latitude = data["items"][0]["position"]["lat"]
                longitude = data["items"][0]["position"]["lng"]
                return jsonify({"latitude": latitude, "longitude": longitude}), 200
            except (IndexError, KeyError):
                return jsonify({"error": "Could not find latitude and longitude for the provided address."}), 400
        else:
            return jsonify({"error": f"Failed to fetch data. Status Code: {response.status_code}"}), 400


if __name__ == '__main__':
    app.run(debug=True)
