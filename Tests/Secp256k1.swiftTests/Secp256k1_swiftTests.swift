import XCTest
@testable import Secp256k1_swift

final class Secp256k1_swiftTests: XCTestCase {
    let privKey: [UInt8] = [
        0x9d, 0x61, 0xb1, 0x9d, 0xef, 0xfd, 0x5a, 0x60, 0xba,
        0x84, 0x4a, 0xf4, 0x92, 0xec, 0x2c, 0xc4, 0x44, 0x49,
        0xc5, 0x69, 0x7b, 0x32, 0x69, 0x19, 0x70, 0x3b, 0xac,
        0x03, 0x1c, 0xae, 0x7f, 0x60
    ]
    
    func testSignAndVerify() {
        let context: OpaquePointer! = secp256k1_context_create(
            UInt32(SECP256K1_CONTEXT_SIGN|SECP256K1_CONTEXT_VERIFY)
        )
        var signature = secp256k1_ecdsa_recoverable_signature()
        let hash = [UInt8](repeating: 0, count: 32)
        let res = secp256k1_ecdsa_sign_recoverable(context, &signature, hash, privKey, nil, nil)
        XCTAssert(res > 0)
        
        var pubKey = secp256k1_pubkey()
        let res2 = secp256k1_ec_pubkey_create(context, &pubKey, privKey)
        XCTAssert(res2 > 0)
        
        var ssig = secp256k1_ecdsa_signature()
        let res3 = secp256k1_ecdsa_recoverable_signature_convert(context, &ssig, &signature)
        XCTAssert(res3 > 0)
        
        let res4 = secp256k1_ecdsa_verify(context, &ssig, hash, &pubKey)
        XCTAssert(res4 == 1)
    }
}
