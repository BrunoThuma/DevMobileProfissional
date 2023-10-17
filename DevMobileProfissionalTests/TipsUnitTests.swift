import XCTest
@testable import DevMobileProfissional

class TipsUnitTests: XCTestCase {
    var dataService = DataService()

    override func setUp() {
        dataService = DataService()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetTipListWithoutAuth() {
        XCTAssertEqual(dataService.getTipList(uid: nil),
                       [],
                       "getTipList with nil authentication must be empty")
    }
    
    func testGetTipListWithAuth() {
        XCTAssertEqual(dataService.getTipList(uid: "aaa"),
                       ["Gorjetinha","Milho x10","Mais um mes inscrito! <3"],
                       "getTipList with nil authentication must be empty")
    }
}
