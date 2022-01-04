import time


def main():

    print("In special cases, tensorflow will take too much time to import. "
          "This script will test whether the import time of tensorflow is normal and "
          "whether the GPU device is recognized")

    with Timer("Try import tensorflow", fail_second=5):
        import tensorflow as tf
        print("tensorflow: ", tf.__version__)

    # print("tf.config.list_physical_devices('GPU')`: ", tf.config.list_physical_devices())

    with Timer("Finding visible devices, CPU and GPU", fail_second=20):
        try:
            visible_devices = tf.config.get_visible_devices()
        except Exception:
            try:
                visible_devices = tf.config.experimental.list_physical_devices()
            except Exception:
                from tensorflow.python.client import device_lib
                visible_devices =  [x.name for x in device_lib.list_local_devices()]
        for devices in visible_devices:
            print(devices)

    print(f"{bcolors.OKCYAN}Please manually confirm whether the device recognized by tensorflow is correct.{bcolors.ENDC}")


class Timer:
    """ sample time counter """

    def __init__(self, name: str, fail_second=5):
        self.name = name
        self.fail_second = fail_second

    def __enter__(self):
        print(f"{bcolors.OKCYAN}{self.name}{bcolors.ENDC}")
        print(f"{bcolors.OKBLUE}If the running time exceeds {self.fail_second} seconds, it will fail{bcolors.ENDC}")
        self.start = time.time()
        return self

    def __exit__(self, *args):
        elapsed = (time.time() - self.start) + 1e-9
        if elapsed < self.fail_second:
            print(f'{bcolors.OKGREEN}{self.name} finished in {elapsed:.4f} sec{bcolors.ENDC}')
            print(f"{bcolors.OKGREEN}Success{bcolors.ENDC}")
        else:
            print(f'{bcolors.FAIL}{self.name} finished in {elapsed:.4f} sec{bcolors.ENDC}')
            print(f"{bcolors.FAIL}Fail{bcolors.ENDC}")


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


if __name__ == '__main__':
    main()
