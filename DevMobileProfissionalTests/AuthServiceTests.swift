import XCTest
@testable import DevMobileProfissional

final class AuthServiceTests: XCTestCase {

    var authService = AuthService(signedIn: false)

    override func setUp() {
        authService = AuthService(signedIn: false)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAuthenticate() {
        XCTAssertNil(authService.getUid(), "Uid should be nil before signed in")
        authService.authenticate()
        XCTAssertNotNil(authService.getUid(), "Uid should not be nil after signed in")
    }
    
    func testSignOut() {
        authService.authenticate()
        XCTAssertNotNil(authService.getUid(), "Uid should not be nil after signed in")
        authService.signOut()
        XCTAssertNil(authService.getUid(), "Uid should be nil after signed out")
    }

}
