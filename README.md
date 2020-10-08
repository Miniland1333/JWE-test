# JWE with PHP to Perl

There are two Dockerfiles for this project, one at the top-level for PHP and one for Perl.

## Instructions for running this test

1. Build top-level dockerfile and run (PHP)
2. Copy console-outputted JWE and paste into within Perl/test_encoding2.pl line 7
3. Build and run Perl/Dockerfile
4. Hopefully see some console output like below

```
erics payload HASH(0x19c5d78)
iss = My service
nbf = 1602142461
exp = 1602146061
aud = Your application
iat = 1602142461
```

