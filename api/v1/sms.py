from kavenegar import *

from config import *


class SMS:
    @staticmethod
    def send_token(token: str, receptor: str):
        try:
            api = KavenegarAPI(SMS_API_KEY)
            params = {
                'receptor': receptor,
                'token': token,
                'template': 'verify'
            }
            return api.verify_lookup(params)
        except APIException as e:
            print(str(e))
        except HTTPException as e:
            print(str(e))
