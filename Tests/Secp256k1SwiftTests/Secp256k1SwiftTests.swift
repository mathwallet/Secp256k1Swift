import XCTest
@testable import Secp256k1Swift

final class Secp256k1SwiftTests: XCTestCase {
    
    func testExample() {
        debugPrint(SECP256K1.generatePrivateKey())
    }
}
