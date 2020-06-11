import time
import redis
from locust import Locust, events
from locust.core import TaskSet, task


class RedisClient(object):
    def __init__(self, host="redis", port=6379):
        self.rc = redis.StrictRedis(host=host, port=port)

    def query(self, key, command='GET'):
        result = None
        start_time = time.time()
        try:
            result = self.rc.get(key)
            if not result:
                result = ''
        except Exception as e:
            total_time = int((time.time() - start_time) * 1000)
            events.request_failure.fire(request_type=command, name=key, response_time=total_time, exception=e)
        else:
            total_time = int((time.time() - start_time) * 1000)
            length = len(result)
            events.request_success.fire(request_type=command, name=key, response_time=total_time,
                                        response_length=length)
        return result


class RedisLocust(Locust):
    def __init__(self, *args, **kwargs):
        super(RedisLocust, self).__init__(*args, **kwargs)
        self.client = RedisClient()


class RedisLua(RedisLocust):
    min_wait = 0
    max_wait = 0

    class task_set(TaskSet):
        @task(10)
        def get_time(self):
            self.client.query("Boo")

            # @task(5)
            # def get_random_number(self):
            #     self.client.get_random_number(0, 100)
