from flask import Flask, request, jsonify, Response
import requests
import json

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

        rev_geocode_url = f"https://revgeocode.search.hereapi.com/v1/revgeocode?at={latitude},{longitude}&apiKey={API_KEY}"
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
        address = query_dict.get('address', [None])[0]
        geocode_url = f"https://geocode.search.hereapi.com/v1/geocode?q={address}&apiKey={API_KEY}"
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

    elif req == "sos":
        latitude = query_dict['latitude'][0]
        longitude = query_dict['longitude'][0]
        query = query_dict['query'][0]
        limit = query_dict['limit'][0]

        dis_url = f"https://discover.search.hereapi.com/v1/discover?at={latitude},{longitude}&limit={limit}&q={query}&apiKey={API_KEY}"
        response_dis = requests.get(dis_url)
        data_disco = response_dis.json()

        if response_dis.status_code == 200:
            response_list = []

            for item in data_disco['items']:
                title = item['title']
                address = item['address']['label']
                comma_index = address.find(",")
                address = address[comma_index + 1:]
                address = address.replace(",", "\n")
                latitude = item['position']['lat']
                longitude = item['position']['lng']

                contacts = item.get('contacts', [])
                contact_numbers = [phone['value'] for contact in contacts for phone in contact.get('mobile', [])]

                try:
                    websites = [contact["www"][0]['value'] for contact in contacts]
                except:
                    websites = item.get('www', [])

                if not websites or len(websites[0]) == 0:
                    websites = ["Not available"]

                response = {
                    "Title": title,
                    "Address": address,
                    "Latitude": latitude,
                    "Longitude": longitude,
                    "Contact Numbers": ', '.join(contact_numbers) if contact_numbers else "Not available",
                    "Websites": websites[0]
                }

                response_list.append(response)

            return Response(json.dumps(response_list, indent=4), status=200, mimetype='application/json')

        else:
            return Response(json.dumps({"Error": f"{response_dis.status_code}"}), status=400,
                            mimetype='application/json')


if __name__ == '__main__':
    app.run(debug=True)
