FROM alexellis2/python-gpio:armv6

RUN apt-get update && \
    apt-get -qy install python-smbus i2c-tools python-pip

WORKDIR /srv

ADD ./examples  ./examples
ADD ./library   ./library
ADD ./docker-entrypoint.sh .

RUN cd library && \
    python setup.py install

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["python", "./examples/rainbow.py"]