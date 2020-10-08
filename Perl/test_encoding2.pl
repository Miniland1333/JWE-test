use Crypt::JWT qw(decode_jwt encode_jwt);
use 5.10.0;
use strict;

my $ericsString = "My really secret payload that only Henry knows.";
my $ericsKey = "secretkey";
my $ericsToken = "eyJwMnMiOiJqUDJycmlBSFpadnJmTm4xZGM5VFI3YkVCSWxvM2lmRElVNnFmQThTN2poTmtLSnZKUkpVQWZhbnZ5YWotM1VRaER6YS00c1ItLW9qT1paQkVLN0duQSIsInAyYyI6NDA5NiwiYWxnIjoiUEJFUzItSFMyNTYrQTEyOEtXIiwiZW5jIjoiQTI1NkNCQy1IUzUxMiIsInppcCI6IkRFRiJ9.i3qeeEairQi77EjVTeETnHvh230WkAUZIQw3DC09BUaSYLn0KoQdg2y6OGXyNIKeh4iWQeWBAz3iwtGU_cLVPjilNBT50GfD.IqUo8VFcV92LPCWeheSq1Q.NoG-6vExvqJanyMvsJHXy55SHQHAx4FDdYVyn99yKx6xhAYr74uvSETpRWzCoCXjC3rLNtuL_O2zkZj8vyr6PcCTXJxCR1e2iqjD0Q-eaXY.d1poC28FXWIi86c4GIpihKcVS7GIyMxQo7RNd86AO3w";


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
