try:
    import os
    import glob
except ImportError as e:
    raise ImportError(str(e) + "- required module not found")


class SysfsEntry(object):
    def __init__(self, path):
        self.path = path

    def exists(self):
        return os.path.exists(self.path)

    def _readConversion(self, value):
        return str(value)

    def _writeConversion(self, value):
        return str(value)

    def _read(self):
        with open(self.path, 'r') as f:
            return f.read()

    def _write(self, value):
        try:
            with open(self.path, 'w') as f:
                f.write(value)
        except Exception:
            return False
        return True

    def read(self):
        return self._readConversion(self._read().rstrip())

    def write(self, value):
        return self._write(self._writeConversion(value))


class SysfsEntryInt(SysfsEntry):
    def _readConversion(self, value):
        return int(value)


class SysfsEntryIntLinear(SysfsEntry):
    def __init__(self, name, fromRange=None, toRange=None):
        super(SysfsEntryIntLinear, self).__init__(name)
        self.fromRange = fromRange
        self.toRange = toRange

    def _linearConversion(self, value, fromRange, toRange):
        value -= fromRange[0]
        value *= toRange[1] - toRange[0]
        value //= fromRange[1]
        return value + toRange[0]

    def _readConversion(self, value):
        return self._linearConversion(int(value), self.fromRange, self.toRange)

    def _writeConversion(self, value):
        return str(self._linearConversion(int(value), self.toRange, self.fromRange))


class SysfsEntryFloat(SysfsEntry):
    def __init__(self, path, scale=1000.):
        super(SysfsEntryFloat, self).__init__(path)
        self.scale = scale

    def _readConversion(self, value):
        return float(value) / self.scale

    def _writeConversion(self, value):
        return str(int(value * self.scale))


class SysfsEntryBool(SysfsEntry):
    def _readConversion(self, value):
        return bool(int(value))

    def _writeConversion(self, value):
        return str(int(value))
