import XCTest
@testable import Secp256k1Swift
@testable import BIP32Swift

final class BIP32SwiftTests: XCTestCase {
    func testExamples() {
        guard let n = HDNode(seed: SECP256K1.generatePrivateKey()!) else { return }
        debugPrint(n)
    }
}
