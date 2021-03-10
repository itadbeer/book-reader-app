from kavenegar import *
from typing import List, Any
from config import *


class SMS:
    @staticmethod
    def send_token(token: str, receptor: str, template: str = "verify") -> List:
        try:
            api = KavenegarAPI(SMS_API_KEY)
            params = {
                'receptor': receptor,
                'token': token,
                'template': template
            }
            return api.verify_lookup(params)
        except APIException as error:
            return []
        except HTTPException as error:
            return []
