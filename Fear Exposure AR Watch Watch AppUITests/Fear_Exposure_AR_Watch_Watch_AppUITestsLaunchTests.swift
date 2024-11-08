//
//  Fear_Exposure_AR_Watch_Watch_AppUITestsLaunchTests.swift
//  Fear Exposure AR Watch Watch AppUITests
//
//  Created by Putu Agus Dharma Kusuma on 08/11/24.
//

import XCTest

final class Fear_Exposure_AR_Watch_Watch_AppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
