import json
import fortune_cookie


def handler(event, context):

    message = fortune_cookie.fortune()

    return json.dumps({"Status": 200, "Data": message})
