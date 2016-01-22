import Foundation
import XCPlayground

//: Captures a value to be displayed in the specified value history in the timeline.
// func XCPCaptureValue<T>(identifier: String, value: T)

//: Returns a Boolean value indicating whether indefinite execution is enabled.
// func XCPExecutionShouldContinueIndefinitely() -> Bool

//: Sets whether indefinite execution is enabled.
// func XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: Bool = true)

//: Displays a view during playground execution and records frames for playback after execution.
// func XCPShowView(identifier: String, view: NSView)
// func XCPShowView(identifier: String, view: UIView)

//: Returns the path to the directory containing data shared between all playgrounds.
// let XCPSharedDataDirectoryPath: String

//: [Previous](@previous) | [Next](@next)

//Playgrounds support dragging files, images, and colors directly into the editor to create object literals.
//Object literals allow you to include visual representations of files, images, and colors within a playground, enabling a more expressive playground document. Literals behave similarly to their plain code counterparts but are rendered specially in the Xcode editor. (22099316)
//
//The API exposed by XCPlayground has been revised significantly. Instead of a collection of global functions, Xcode now exposes an XCPlaygroundPage class with methods for interacting with Xcode and the current playground page.
//XCPlaygroundPage exposes the following functionality:
//
//Use XCPlaygroundPage.currentPage to obtain a reference to the current page.
//Use XCPlaygroundPage.captureValue(_:withIdentifier:) to capture values into timeline items.
//Set XCPlaygroundPage.needsIndefiniteExecution to indicate to Xcode that the playground page contains asynchronous code intended to execute indefinitely.
//Set XCPlaygroundPage.liveView to tell Xcode to present a live view for the playground page
//XCPlaygroundSharedDataDirectoryURL has been defined as a new global constant; it exposes the shared playground data directory as an NSURL.
//As part of this API change, XCPCaptureValue, XCPShowView, XCPSetExecutionShouldContinueIndefinitely, XCPExecutionShouldContinueIndefinitely, and XCPSharedDataDirectoryPath have been deprecated; they may be removed in a future version of Xcode. (20783204)
//
//XCPlayground supports presenting view controllers as the live view for a playground page.
//To use this feature, set XCPlaygroundPage.liveView to your view controller of choice. When available, view controllers should be preferred but plain views may still be used as the live view for a playground page.
//    
//Playground authors may also make custom types that can be presented as the live view for a playground page by conforming to the XCPlaygroundLiveViewable protocol, which allows an object or a value to return a view or view controller that should be used as its live view representation. (20783161)
//
//Playgrounds can programmatically stop execution by calling XCPlaygroundPage.currentPage.finishExecution().
//This method instructs Xcode to stop executing the current playground page; it allows Xcode to clean up for exiting properly in ways that exiting directly does not. (22463694)
//
