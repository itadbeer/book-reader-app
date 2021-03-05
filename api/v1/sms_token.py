import redis
from random import randrange
the_redis = redis.StrictRedis()


class Token:
    def __init__(self, mobile):
        self.mobile = mobile

    def create(self, expire: int = 60):
        self.token = randrange(10000,99999)
        the_redis.set(self.mobile, self.token)
        the_redis.expire(self.mobile, expire)

    def verify(self, token: str) -> bool:
        if the_redis.exists(self.mobile) and the_redis.get(self.mobile) == token:
            return True
        return False
