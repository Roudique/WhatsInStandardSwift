import XCTest
@testable import WhatsinstandardSwift

final class WhatsinstandardSwiftTests: XCTestCase {
    func testFetch() {
        let exp = expectation(description: "test")
        
        WhatsInStandardAPI.fetch { result in
            switch result {
            case .success(let info):
                XCTAssertFalse(info.isDeprecated)
                XCTAssert(info.sets.count > 0)
                exp.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        
        wait(for: [exp], timeout: 3.0)
    }
    
    func testParse() throws {
        let url = try XCTUnwrap(Bundle(for: type(of: self)).url(forResource: "test_data", withExtension: "json"))
        let data = try Data(contentsOf: url)
        
        
        XCTAssertNotNil(try WhatsInStandardAPI.decode(data: data))
    }

    static var allTests = [
        ("testFetch", testFetch),
    ]
}
