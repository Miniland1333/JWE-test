use Crypt::JWT qw(decode_jwt encode_jwt);
use 5.10.0;
use strict;

my $ericsString = "My really secret payload that only Henry knows.";
my $ericsKey = "secretkey";
my $ericsToken = "eyJwMnMiOiIybmpfNngwa1dNdElQb0pFc1ZEWW1wVHBoME9ycUh3dW5iaXZHd19mM3F2STh4WXIzV3VtYTc2VGJQRVlNdzZnUk8ydWRZV3BzMEYxdGRwSU9QcUhVdyIsInAyYyI6NDA5NiwiYWxnIjoiUEJFUzItSFM1MTIrQTI1NktXIiwiZW5jIjoiQTI1NkdDTSIsInppcCI6IkRFRiJ9.-HINmFmszCMpnQkat-hA7TBfTFpyKtDYnLVaJdzJxS7w_KJjJ4LhuQ.tZynDRO-npPrGYNG.Z0lF2HNXUhmNuBfLow8eckbwb_ZQMdDp4eg37C3kxb96mxMRek8qnZ9Twetyxmujr6ScmIkZddBrIsDRXN85xzMoua0i1ClfwGYtqw.PBR4uHKGUf8WJOaFb92bEA";


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
