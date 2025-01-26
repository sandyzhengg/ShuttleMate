from flask import Flask, jsonify
import passiogo
from datetime import datetime

app = Flask(__name__)

system = passiogo.getSystemFromID(1068)

@app.route('/routes', methods=['GET'])
def get_routes():
    routes = system.getRoutes()
    route_list = []
    for route in routes:
        route_details = {
            "id": route.id,
            "name": route.name,
            "short_name": route.shortName,
            "color": route.groupColor,
            "latitude": route.latitude,
            "longitude": route.longitude,
            "service_time": route.serviceTime or "No schedule available"
        }
        route_list.append(route_details)
    return jsonify(route_list)

@app.route('/stops/<route_id>', methods=['GET'])
def get_stops(route_id):
    route = None
    for r in system.getRoutes():
        if r.id == str(route_id):
            route = r
            break
    if not route:
        return jsonify({"error": "Route not found"}), 404
    
    stops = route.getStops()
    stop_list = []
    for stop in stops:
        stop_details = {
            "id": stop.id,
            "name": stop.name,
            "latitude": stop.latitude,
            "longitude": stop.longitude
        }
        stop_list.append(stop_details)
    return jsonify(stop_list)

@app.route('/alerts', methods=['GET'])
def get_alerts():
    alerts = system.getSystemAlerts()
    alert_list = []
    for alert in alerts:
        alert_details = {
            "id": alert.id,
            "name": alert.name,
            "description": alert.html,
            "valid_from": alert.dateTimeFrom,
            "valid_to": alert.dateTimeTo
        }
        alert_list.append(alert_details)
    return jsonify(alert_list)

@app.route('/route_time/<route_id>', methods=['GET'])
def get_route_time(route_id):
    route = None
    for r in system.getRoutes():
        if r.id == str(route_id):
            route = r
            break
    if not route:
        return jsonify({"error": "Route not found"}), 404

    stops = route.getStops()
    if len(stops) < 2:
        return jsonify({"error": "Not enough stops to calculate travel time"}), 400

    departure_stop = stops[0]
    arrival_stop = stops[-1]

    if not hasattr(departure_stop, 'serviceTime') or not hasattr(arrival_stop, 'serviceTime'):
        return jsonify({
            "error": "Time data not available for the selected route",
            "route_id": route.id,
            "route_name": route.name,
            "departure_stop": departure_stop.name,
            "arrival_stop": arrival_stop.name
        }), 400

    departure_time = datetime.strptime(departure_stop.serviceTime, "%I:%M %p")
    arrival_time = datetime.strptime(arrival_stop.serviceTime, "%I:%M %p")
    total_time = arrival_time - departure_time

    travel_time_details = {
        "route_id": route.id,
        "route_name": route.name,
        "departure_stop": departure_stop.name,
        "arrival_stop": arrival_stop.name,
        "departure_time": departure_time.strftime("%I:%M %p"),
        "arrival_time": arrival_time.strftime("%I:%M %p"),
        "total_time": str(total_time)
    }
    return jsonify(travel_time_details)

if __name__ == '__main__':
    app.run(debug=True)

