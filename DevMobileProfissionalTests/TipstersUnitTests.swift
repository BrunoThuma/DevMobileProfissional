import XCTest
@testable import DevMobileProfissional

final class TipstersUnitTests: XCTestCase {
    
    var dataService = DataService()
    
    override func setUp() {
        dataService = DataService()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetTipstersListWithoutAuth() {
        XCTAssertEqual(dataService.getTipstersList(uid: nil),
                       [],
                       "getTipstersList with nil authentication must be empty")
    }
    
    func testGetTipstersListWithAuth() {
        XCTAssertEqual(dataService.getTipstersList(uid: "aaa"),
                       ["Bruno Thuma","Alanzoka","LVndmark"],
                       "getTipstersList with nil authentication must be empty")
    }
}
