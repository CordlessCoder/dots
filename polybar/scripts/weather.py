#!/bin/python
import requests
from dotenv import dotenv_values


config = dotenv_values("/home/roman/.config/polybar/scripts/.env")


data = requests.get(
    f"https://api.openweathermap.org/data/2.5/weather?lat={config['lat']}&lon={config['lon']}&appid={config['API_KEY']}&units=metric&lang=en",
    timeout=5,
)

data = dict(eval(data.content.decode("utf-8")))
with open("/tmp/.weather", "w") as current:
    current.write(
        "°C ".join(map(str, [data["main"][key] for key in ["temp", "feels_like"]]))
        + "°C"
    )
