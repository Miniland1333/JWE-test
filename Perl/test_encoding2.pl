use Crypt::JWT qw(decode_jwt encode_jwt);
use 5.10.0;
use strict;

my $ericsString = "My really secret payload that only Henry knows.";
my $ericsKey = "secretkey";
my $ericsToken = "eyJwMnMiOiJhSTdjSXNrM3l0VHZSclJuWXhBdnA1Rkk2RG5wUnVYWTdma09jU1NWY3NIMlkzXzhOaUQ5TFo5S0ZYdi1HSnFZMTFfN21mQldzREYyM2RaZ2hNZExWUSIsInAyYyI6NDA5NiwiYWxnIjoiUEJFUzItSFMyNTYrQTEyOEtXIiwiZW5jIjoiQTI1NkdDTSIsInppcCI6IkRFRiJ9.c22Wy1Yp8y1qzi8GbNZ68g1hYEdefvYnJZRqi7cmrEUrFvDakrS8FQ.URDJcJCjaeFn_T3z.jzod8Ov152kjnv4MCkM6ySCZ-8gkE1nNavd4MH-GkP2VvxJEa4BmaRa_UTsRQVHSHdOX2oFhw3GeEzLCcLlih0EFSO7uiW_7c274ug.aLLLukYjiS1PzDwr_aQoxA";


my $payload = decode_jwt(token => $ericsToken, key => $ericsKey);

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
