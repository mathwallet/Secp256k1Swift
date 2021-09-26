import XCTest
@testable import Secp256k1Swift
@testable import BIP32

final class BIP32Tests: XCTestCase {
    func testExamples() {
        debugPrint(HDNode(seed: SECP256K1.generatePrivateKey()!))
    }
}
