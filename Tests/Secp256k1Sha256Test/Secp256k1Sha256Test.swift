import XCTest
import Foundation
@testable import CSecp256k1

final class Secp256k1Sha256Test: XCTestCase {
    
    func test_sha256_tag() throws {
        let message = "hello".data(using: .utf8)!
        let tag = "key".data(using: .utf8)!
        let bytes = tag.withUnsafeBytes { bytesPtr in
            Array(bytesPtr)
        }
        XCTAssertTrue(try taggedHash(tag: bytes, data: message) == [172, 26, 198, 111, 120, 121, 86, 53, 202, 57, 141, 122, 215, 96, 187, 35, 39, 146, 208, 240, 231, 77, 0, 132, 253, 39, 187, 201, 72, 223, 83, 2])
    }
    
    func taggedHash<D: DataProtocol>(tag: [UInt8], data: D) throws -> [UInt8]{
        let messageBytes = Array(data)
        var output = [UInt8](repeating: 0, count: 32)
        let context: OpaquePointer! = secp256k1_context_create(
            UInt32(SECP256K1_CONTEXT_SIGN|SECP256K1_CONTEXT_VERIFY)
        )
        guard (secp256k1_tagged_sha256(context, &output, tag, tag.count, messageBytes, messageBytes.count) != 0) else {
            throw NSError.init(domain: "", code: -1)
        }
        return output
    }
}
