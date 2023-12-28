from flask import Flask, render_template_string, request
import awsgi

# create a flask application
app = Flask(__name__)

@app.route("/")
def home():
    """Create a map object using Leaflet with navigation routes"""
    query_dict = request.args.to_dict(flat=False)
    start_lat = f"{query_dict['start_lat'][0]}"
    start_lon = f"{query_dict['start_lon'][0]}"
    end_lat = f"{query_dict['end_lat'][0]}"
    end_lon = f"{query_dict['start_lon'][0]}"
    return render_template_string(
        """
        <!DOCTYPE html>
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
                <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.css" />
                <style>
                    #map {
                        height: 100vh;
                        width: 100%;
                        max-width: 3000px;
                        margin: 0 auto;
                    }

                    .leaflet-tooltip-pane, .leaflet-popup-pane {
                        font-size: 16px !important;
                    }

                    .leaflet-marker-icon {
                        width: 30px !important;
                        height: 30px !important;
                    }

                    body {
                        margin: 0;
                        padding: 0;
                    }

                    #routing-container {
                        position: absolute;
                        top: 10px;
                        left: 10px;
                        z-index: 1000;
                        background-color: white;
                        padding: 10px;
                        border-radius: 5px;
                    }

                    #toggle-routing {
                        position: absolute;
                        top: 10px;
                        left: 10px;
                        z-index: 1001;
                        background-color: white;
                        padding: 5px;
                        border-radius: 5px;
                        cursor: pointer;
                    }
                </style>
            </head>
            <body>

                <div id="map"></div>
                <div id="routing-container">
                    <div id="routing-control"></div>
                </div>
                <div id="toggle-routing" onclick="toggleRouting()">Toggle Routing</div>

                <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
                <script src="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.js"></script>
                <script>
                     var map = L.map('map').setView([{{start_lat}}, {{start_lon}}], 12);

                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '© OpenStreetMap contributors'
                    }).addTo(map);

                    var control = L.Routing.control({
                        waypoints: [
                            L.latLng({{start_lat}}, {{start_lon}}), // Start point
                            L.latLng({{end_lat}}, {{end_lon}})   // End point
                        ],
                        routeWhileDragging: true
                    }).addTo(map);

                    function toggleRouting() {
                        var routingContainer = document.getElementById("routing-container");
                        routingContainer.style.display = (routingContainer.style.display === "none" || routingContainer.style.display === "") ? "block" : "none";
                    }
                </script>
            </body>
        </html>
        """, start_lat=start_lat, start_lon=start_lon, end_lat=end_lat, end_lon=end_lon
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=50100, debug=True)
