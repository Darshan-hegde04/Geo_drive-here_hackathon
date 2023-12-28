# https://rapidapi.com/carbonandmore-carbonandmore-default/api/carbonfootprint1/
import requests
import awsgi
from flask import Flask, request, Response
import json

# Flask
app = Flask(__name__)
endpoint = "https://carbonfootprint1.p.rapidapi.com"


# database_url = os.getenv("DATABASE_URL")
# connection = psycopg2.connect(database_url)

@app.route('/', methods=['GET'])
def Home():
    query_dict = request.args.to_dict(flat=False)
    print(query_dict)
    query = query_dict["query"][0]
    if query == "cartravel":
        url = "https://carbonsutra1.p.rapidapi.com/vehicle_estimate_by_type"

        payload = {
            "vehicle_type": f"{query_dict['type'][0]}",
            "distance_value": f"{query_dict['distance'][0]}",
            "distance_unit": "km"
        }
        headers = {
            "content-type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer fQ98oU704xFvsnXcQLVDbpeCJHPglG1DcxiMLKfpeNEMGumlbzVf1lCI6ZBx",
            "X-RapidAPI-Key": "34c222cedcmshfcdea80a64cb92dp1f97f9jsna1340d732a43",
            "X-RapidAPI-Host": "carbonsutra1.p.rapidapi.com"
        }

        api_response = requests.post(url, data=payload, headers=headers)
        api_response.raise_for_status()
        api_response = api_response.content.decode('utf-8')
        response = f'{api_response}'
        emission_data = json.loads(response)
        emission_value = emission_data["data"]["co2e_kg"]
        response = {"co2e_kg": f"{emission_value}"}
        response = json.dumps(response, indent=4)

        json_string = response
        data = json.loads(json_string)
        json_data = json.dumps(data)
        # return json_data
        return Response(json_data, status=200, mimetype='application/json')

    elif query == "motorbiketravel":
        url = endpoint + "/CarbonFootprintFromMotorBike"
        query_dict = request.args.to_dict(flat=False)
        print(query_dict)

        querystring = {
            "type": f"{query_dict['type'][0]}", "distance": f"{query_dict['distance'][0]}"}
        headers = {
            "X-RapidAPI-Key": "34c222cedcmshfcdea80a64cb92dp1f97f9jsna1340d732a43",
            "X-RapidAPI-Host": "carbonfootprint1.p.rapidapi.com"
        }
        response = requests.get(url, headers=headers, params=querystring)
        response.raise_for_status()

        api_response = response.content.decode('utf-8')
        response = f'{api_response}'
        emission_data = json.loads(response)
        emission_value = emission_data["carbonEquivalent"]
        response = {"co2e_kg": f"{emission_value}"}
        response = json.dumps(response, indent=4)

        json_string = response
        data = json.loads(json_string)
        json_data = json.dumps(data)
        # return json_data
        return Response(json_data, status=200, mimetype='application/json')

    elif query == "publictransist":
        url = endpoint + "/CarbonFootprintFromPublicTransit"
        query_dict = request.args.to_dict(flat=False)
        print(query_dict)

        querystring = {
            "distance": f"{query_dict['distance'][0]}", "type": f"{query_dict['type'][0]}"}
        headers = {
            "X-RapidAPI-Key": "34c222cedcmshfcdea80a64cb92dp1f97f9jsna1340d732a43",
            "X-RapidAPI-Host": "carbonfootprint1.p.rapidapi.com"
        }

        response = requests.get(url, headers=headers, params=querystring)
        response.raise_for_status()

        api_response = response.content.decode('utf-8')
        response = f'{api_response}'
        emission_data = json.loads(response)
        emission_value = emission_data["carbonEquivalent"]
        response = {"co2e_kg": f"{emission_value}"}
        response = json.dumps(response, indent=4)

        json_string = response
        data = json.loads(json_string)
        json_data = json.dumps(data)
        # return json_data
        return Response(json_data, status=200, mimetype='application/json')

    else:
        response = {'error': 'Invalid request. Please check your query.'}
        data = json.loads(response)
        json_data = json.dumps(data)
        return Response(json_data, status=400, mimetype='application/json')


def lambda_handler(event, context):
    return awsgi.response(app, event, context, base64_content_types={"image/png"})

if __name__ == '__main__':
    app.run()
