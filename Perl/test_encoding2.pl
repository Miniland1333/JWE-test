use Crypt::JWT qw(decode_jwt encode_jwt);
use 5.10.0;
use strict;

my $ericsString = "My really secret payload that only Henry knows.";
my $ericsKey = "secretkey";
my $ericsToken = "eyJwMnMiOiJkYk9pVl9QLXoyS0hGWmJ1T1VQNzV5SWtTT0Q3aXZpYTlSWEY2czhJYzF2RDFiT2NQZDBRNkdBYXBUXzFWazNLaGotMUd1Z2NBbEpnSW9hX19HWWUtQSIsInAyYyI6NDA5NiwiYWxnIjoiUEJFUzItSFMyNTYrQTEyOEtXIiwiZW5jIjoiQTI1NkNCQy1IUzUxMiIsInppcCI6IkRFRiJ9.aq7vinK0ks0PhfEsYgDmFc0j7Eyi419RisAXW1_AqcTceQDKKUEm9Oljawef6Q4Yv6UWUl3bIoKEeKmyP9p_GXA0_lQYo_uo.1mQ2Rg2wAXx5hWmDy6auhg.BIeMrkoeiBJI2Dcmggm-__2iacJOFz4TDcPkn_5lDmRKtvSWrrvANa22dXtAVetjymQbHFC1NLbKSTf8-otolI9Y9xAzIHghSPncpo2cfDg.r7FufaIlZzUgzqyzADsR61V245VV0ZsrtxXKwBIOwkg1";


my $payload = decode_jwt(
    token => $ericsToken,
    key   => $ericsKey,
);

say "erics payload $payload";
while ( my($key, $value) = each $payload ) {
    print "$key = $value\n";
}

# my $string = "Now is the time for all good men to come to the aid of your country";
# my $content_alg = "A256CBC-HS512";
# my $signing_alg = "PBES2-HS256+A128KW";

# my $Mikestoken = encode_jwt(payload => $ericsString, key => $ericsKey,
#     enc                             => $content_alg, alg => $signing_alg,
# );
# my $Mikescompressedtoken = encode_jwt(payload => $ericsString, key => $ericsKey,
#     enc                                       => $content_alg, alg => $signing_alg, zip => 'deflate'
# );
#
# say "mike's token $Mikestoken";
# say "Mikescompressedtoken  $Mikescompressedtoken     ";
#
# my $mikespayload = decode_jwt(token => $Mikestoken, key => $ericsKey);
# my $mikescompressedpayload = decode_jwt(token => $Mikescompressedtoken, key => $ericsKey);
#
# say "mikes payload  $mikespayload";
# say "mikes compressed payload $mikescompressedpayload";
