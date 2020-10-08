<?php

require __DIR__ . '/vendor/autoload.php';

use Jose\Component\Core\AlgorithmManager;
use Jose\Component\Encryption\Algorithm\KeyEncryption\PBES2HS256A128KW;
use Jose\Component\Encryption\Algorithm\ContentEncryption\A256CBCHS512;
use Jose\Component\Encryption\Compression\CompressionMethodManager;
use Jose\Component\Encryption\Compression\Deflate;
use Jose\Component\Encryption\JWEBuilder;
use Jose\Component\Encryption\JWEDecrypter;

// The key encryption algorithm manager with the A256KW algorithm.
$keyEncryptionAlgorithmManager = new AlgorithmManager([
    new PBES2HS256A128KW(),
]);

// The content encryption algorithm manager with the A256CBC-HS256 algorithm.
$contentEncryptionAlgorithmManager = new AlgorithmManager([
    new A256CBCHS512(),
]);

// The compression method manager with the DEF (Deflate) method.
$compressionMethodManager = new CompressionMethodManager([
    new Deflate(),
]);

// We instantiate our JWE Builder.
$jweBuilder = new JWEBuilder(
    $keyEncryptionAlgorithmManager,
    $contentEncryptionAlgorithmManager,
    $compressionMethodManager
);
use Jose\Component\KeyManagement\JWKFactory;


// Our key.
$jwk = JWKFactory::createFromSecret(
         'secretkey',       // The shared secret
     );

// The payload we want to encrypt. It MUST be a string.
$payload = json_encode([
    'iat' => time(),
    'nbf' => time(),
    'exp' => time() + 3600,
    'iss' => 'My service',
    'aud' => 'Your application',
]);

$jwe = $jweBuilder
    ->create()              // We want to create a new JWE
    ->withPayload($payload) // We set the payload
    ->withSharedProtectedHeader([
        'alg' => 'PBES2-HS256+A128KW',        // Key Encryption Algorithm
        'enc' => 'A256CBC-HS512', // Content Encryption Algorithm
        'zip' => 'DEF'            // We enable the compression (irrelevant as the payload is small, just for the example).
    ])
    ->addRecipient($jwk)    // We add a recipient (a shared key or public key).
    ->build();              // We build it

    use Jose\Component\Encryption\Serializer\CompactSerializer;

    $serializer = new CompactSerializer(); // The serializer

    $token = $serializer->serialize($jwe, 0); // We serialize the recipient at index 0 (we only have one recipient).
print($token);

$jweDecrypter = new JWEDecrypter(
        $keyEncryptionAlgorithmManager,
        $contentEncryptionAlgorithmManager,
        $compressionMethodManager
    );
	$jwe = $serializer->unserialize($token);
	$success = $jweDecrypter->decryptUsingKey($jwe, $jwk, 0);

# print($success);