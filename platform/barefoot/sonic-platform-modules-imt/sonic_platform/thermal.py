try:
    import subprocess

    from sonic_platform_base.thermal_base import ThermalBase
    import sonic_platform.sensors as sensors
except ImportError as e:
    raise ImportError(str(e) + "- required module not found")


# Thermal -> ThermalBase -> DeviceBase
class Thermal(ThermalBase):
    def __init__(self, chip, label):
        self.__chip = chip
        self.__label = label
        self.__name = f"{chip}:{label}".lower().replace(' ', '-')

    def __get(self, attr_prefix, attr_suffix):
        sensor_data = sensors.sensors_get().get(self.__chip, {}).get(self.__label, {})
        value = sensors.sensors_value_get(sensor_data, attr_prefix, attr_suffix)
        if value is not None:
            return value
        raise NotImplementedError

    # ThermalBase interface methods:
    def get_temperature(self) -> float:
        return float(self.__get('temp', 'input'))

    def get_high_threshold(self) -> float:
        return float(self.__get('temp', 'max'))

    def get_high_critical_threshold(self) -> float:
        return float(self.__get('temp', 'crit'))

    # DeviceBase interface methods:
    def get_name(self):
        return self.__name

    def get_presence(self):
        return True

    def get_status(self):
        return True


def thermal_list_get():
    thermal_list = []
    for chip, chip_data in sensors.sensors_get().items():
        for sensor, sensor_data in chip_data.items():
            # add only temperature sensors
            if sensors.sensors_value_get(sensor_data, "temp") is not None:
                thermal_list.append(Thermal(chip, sensor))
    return thermal_list
