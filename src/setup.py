from setuptools import setup

setup(
    name='froggo',
    version='0.1',
    py_modules=['froggo'],
    install_requires=['click', 'subprocess'],
    entry_points={
        'console_scripts': [
            'froggo=froggo:cli',
        ],
    },
)