try:
    import os
    import glob
    import sonic_platform.sysfs as sysfs
    from sonic_platform_base.fan_drawer_base import FanDrawerBase
    from sonic_platform_base.fan_base import FanBase
except ImportError as e:
    raise ImportError(str(e) + "- required module not found")


# Fan -> FanBase -> DeviceBase
class Fan(FanBase):
    def __init__(self, parent_id, path, num):
        self.__num = num
        self.__path = path
        self.__parent_id = parent_id
        self.input = sysfs.SysfsEntryInt(os.path.join(path, 'fan%d_input' % num))
        self.pwm = sysfs.SysfsEntryIntLinear(os.path.join(path, 'pwm%d' % num), fromRange=(0, 255), toRange=(0, 100))

    # FanBase interface methods:
    # returns speed in percents
    def get_speed(self):
        if self.pwm.exists():
            return self.pwm.read()
        return None

    def set_speed(self, percent):
        # save last speed
        return self.pwm.write(percent)

    # DeviceBase interface methods:
    def get_name(self):
        return f"fan-{self.__parent_id}-{self.__num}"

    def get_presence(self):
        return True

    def get_position_in_parent(self):
        return self.__num

    def is_replaceable(self):
        return False

    def get_status(self):
        return True


# FanDrawer -> FanDrawerBase -> DeviceBase
class FanDrawer(FanDrawerBase):
    def __init__(self, ext_n, module_path, hwmon_path):
        # For now we return only present fans
        self._module_sysfs_path = module_path
        self._module_sysfs_hwmon = hwmon_path
        self._number_of_fans = len(glob.glob(os.path.join(hwmon_path, "fan*_input")))
        self._fan_list = []
        self._id = ext_n
        for i in range(1, self._number_of_fans + 1):
            self._fan_list.append(Fan(ext_n, hwmon_path, i))

    # DeviceBase interface methods:
    def get_name(self):
        return f'fantray-{self._id}'

    def get_presence(self):
        return True

    def get_status(self):
        return True


def fan_drawer_list_get():
    fan_draw_list = []
    fan_path = '/sys/devices/board/fan/'
    if os.path.exists(fan_path):
        hwmon_path = glob.glob(os.path.join(fan_path, 'i2c-fan*/hwmon/hwmon*/'))[0]
        fan_draw_list.append(FanDrawer(0, 0, hwmon_path))
    else:
        for n in range(2):
            module_path = '/sys/devices/board/ext00%d/' % n
            if os.path.exists(module_path):
                hwmon_path = glob.glob(os.path.join(module_path, 'i2c-fan*/hwmon/hwmon*/'))[0]
                fan_draw_list.append(FanDrawer(n, module_path, hwmon_path))

    return fan_draw_list
