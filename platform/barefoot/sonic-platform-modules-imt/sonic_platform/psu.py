#!/usr/bin/env python

try:
    import os
    import sys
    import glob

    sys.path.append(os.path.dirname(__file__))

    import sonic_platform.sysfs as sysfs
    from sonic_platform_base.psu_base import PsuBase
    import sonic_platform.sensors as sensors
    import sonic_platform.fan_drawer as fan
except ImportError as e:
    raise ImportError(str(e) + "- required module not found")


class Psu(PsuBase):
    def __init__(self, name):
        super(Psu, self).__init__()
        self._name = name
        self._status = False
        # addr 58 - psu0
        # addr 59 - psu1
        self.addr = name.split("-")[3]
        self.position = 0 if name.split("-")[3] == "58" else 1
        self.ps_csr = sysfs.SysfsEntry("/sys/devices/board/secondary/cpld/PS_CSR")

        hwmon_path = glob.glob(os.path.join("/sys/devices/board/control/i2c-psu/", "{}-*{}/hwmon/hwmon*/".format(name.split("-")[2], name.split("-")[3])))
        if hwmon_path:
            self._number_of_fans = len(glob.glob(os.path.join(hwmon_path[0], "fan*_input")))
            self._fan_list = []
            for i in range(1, self._number_of_fans + 1):
                self._fan_list.append(fan.Fan(os.path.join("psu-", str(self.position)), hwmon_path[0], i))

    def __get(self, attr, subattr):
        sensor_data = sensors.sensors_get().get(self._name, {})
        subdata = sensors.sensors_value_get(sensor_data, attr)
        value = sensors.sensors_value_get(subdata, subattr)
        if value is not None:
            return value
        raise NotImplementedError

    def get_voltage(self):
        return float(self.__get("Output Voltage", "in2_input"))

    def get_current(self):
        return float(self.__get("Output Current", "curr2_input"))

    def get_power(self):
        return float(self.__get("Output Power", "power2_input"))

    def get_powergood_status(self):
        res = self.ps_csr.read()

        val = int(res, 16)
        if self.position == 0:
            status = val & 0x4 == 0x4
        else:
            status = (val >> 4) & 0x4 == 0x4
        return status

    def get_name(self):
        return self._name

    def get_presence(self):
        res = self.ps_csr.read()

        val = int(res, 16)
        if self.position == 0:
            pres = val & 0x8 == 0x8
        else:
            pres = (val >> 4) & 0x8 == 0x8
        return pres

    def get_position_in_parent(self):
        return self.position

    def is_replaceable(self):
        return True


def psu_list_get():
    psu_list = []
    for chip, chip_data in sensors.sensors_get().items():
        if chip.startswith("spi800-i2c-44"):
            psu_list.append(Psu(chip))
    return psu_list
