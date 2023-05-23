import XCTest
import Foundation
@testable import CSecp256k1

//https://github.com/bitcoin-core/secp256k1/blob/master/include/secp256k1_schnorrsig.h#L149L158)

final class Secp256k1SchnorrTests: XCTestCase {
    static var magic: (UInt8, UInt8, UInt8, UInt8) { (218, 111, 179, 140) }
    static var context: OpaquePointer! = secp256k1_context_create(
        UInt32(SECP256K1_CONTEXT_SIGN|SECP256K1_CONTEXT_VERIFY)
    )
    func test_secp256k1_schnorr() throws{
        let expectedSignature = "e907831f80848d1069a5371b402410364bdf1c5f8307b0084c55f1ce2dca821525f66a4a85ea8b71e482a74f382d2ce5ebeee8fdb2172f477df4900d310536c0"
        let expectedPrivateKey = "0000000000000000000000000000000000000000000000000000000000000003"
        let messageDigest = "0000000000000000000000000000000000000000000000000000000000000000"
        var messageBytes = messageDigest.hexToByteArray()!
        let expectedSignatureBytes = expectedSignature.hexToByteArray()!
        let auxRandPointer = UnsafeMutableRawPointer.allocate(byteCount: 32, alignment: MemoryLayout<UInt8>.alignment)
        for i in 0..<32 {
            auxRandPointer.storeBytes(of: 0x00, toByteOffset: i, as: UInt8.self)
        }
        var keypair = secp256k1_keypair()
        var signature = [UInt8](repeating: 0, count: 64)
        var extraParams = secp256k1_schnorrsig_extraparams(magic: Secp256k1SchnorrTests.magic, noncefp: nil, ndata: auxRandPointer)
        let keypairResult = secp256k1_keypair_create(Secp256k1SchnorrTests.context, &keypair, expectedPrivateKey.hexToByteArray()!)
        XCTAssertEqual(keypairResult, 1)
        let sigatureResult = secp256k1_schnorrsig_sign_custom(Secp256k1SchnorrTests.context, &signature, &messageBytes, messageBytes.count, &keypair, &extraParams)
        XCTAssertEqual(sigatureResult, 1)
        XCTAssertTrue(expectedSignatureBytes == signature)
    }
}
extension String {
    func hexToByteArray() -> [UInt8]? {
        let hexString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        guard hexString.count % 2 == 0 else { return nil }

        var byteArray = [UInt8]()
        var index = hexString.startIndex

        while index < hexString.endIndex {
            let byteString = hexString[index..<hexString.index(index, offsetBy: 2)]
            if let byte = UInt8(byteString, radix: 16) {
                byteArray.append(byte)
            } else {
                return nil
            }
            index = hexString.index(index, offsetBy: 2)
        }

        return byteArray
    }
}
