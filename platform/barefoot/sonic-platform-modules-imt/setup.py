from setuptools import setup

setup(
    name='sonic-platform',
    version='1.0',
    description='SONiC platform API implementation',
    author_email='support@interfacemasters.com',
    packages=[
        'sonic_platform',
        'sonic_platform/pltfm_mgr_rpc',
    ]
)
