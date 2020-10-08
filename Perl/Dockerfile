FROM perl:5.20

RUN cpan install Crypt::JWT

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

CMD [ "perl", "./test_encoding2.pl" ]