<!--
Downloaded via https://llm.codes by @steipete on September 26, 2025 at 08:14 PM
Source URL: https://developer.apple.com/documentation/visionkit/
Total pages processed: 160
URLs filtered: Yes
Content de-duplicated: Yes
Availability strings filtered: Yes
Code blocks only: No
-->

# <https://developer.apple.com/documentation/visionkit/>

Framework

# VisionKit

Identify and extract information in the environment using the device’s camera, or in images that your app displays.

## Overview

VisionKit analyzes pixel information and isolates important data such as text of a given language, URLs, street addresses, phone numbers, shipment tracking numbers, flight numbers, dates, times, durations, and barcodes of various formats. The framework provides this analysis to your app through user interfaces your app displays, which enable people to interact with the analyzed data ( `ImageAnalyzer.AnalysisTypes`) and return the data of interest presents a camera pass-through view that enables the user to interact with any of the recognized content types ( `DataScannerViewController.RecognizedDataType`) as seen in the environment, and provides captured information to the app for processing.

The Image Analysis interface ( `ImageAnalysisInteraction` on iOS, and `ImageAnalysisOverlayView` on macOS) displays on top of an image and enables people to interact with content types ( `ImageAnalysisInteraction.InteractionTypes`) that the framework recognizes in the image. For example, the Live Text interface enables them to select any text present in the image ( `textSelection`), or invoke a URL ( `dataDetectors`). Also, the text selection UI offers framework-standard buttons for copying selected text, or looking up the subject on the web for more information.

VisionKit’s Document Camera view controller ( `VNDocumentCameraViewController`) is a camera pass-through experience that enables users to scan physical documents. The user scans the document page by page by tapping a camera interface in the view, which provides your app with the resulting images by page number after the scan completes. With the collection of scanned images, your app can create a digital version of the physical document, such as by exporting the scanned images to PDF.

## Interact with image subjects

In iOS 17 and macOS 14 and later, VisionKit identifies subjects within an image (see `ImageAnalysisInteraction.Subject`). A _subject_ may be the focal point of a picture, such as an object around which a photograph centers. Or, the framework may identify several objects that it recognizes in an image. VisionKit enables your app to extract, or _lift_, subjects to a separate image with the background removed (see `image`), or present a button that gives more information on the subject ( `visualLookUp`).

## Topics

### Content recognition and interaction in images

Enabling Live Text interactions with images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

### Barcode and text scanning through the camera

Scanning data with the camera

Enable Live Text data scanning of text and codes that appear in the camera’s viewfinder.

`class DataScannerViewController`

An object that scans the camera live video for text, data in text, and machine-readable codes.

`protocol DataScannerViewControllerDelegate`

A delegate object that responds when people interact with items that the data scanner recognizes.

`enum RecognizedItem`

An item that the data scanner recognizes in the camera’s live video.

### Document scanning through the camera

Structuring Recognized Text on a Document

Detect, recognize, and structure text on a business card or receipt using Vision and VisionKit.

`class VNDocumentCameraViewController`

An object that presents UI for a camera pass-through that helps people scan physical documents.

`protocol VNDocumentCameraViewControllerDelegate`

A delegate protocol through which the document camera returns its scanned results.

`class VNDocumentCameraScan`

A single document scanned in the document camera.

---

# <https://developer.apple.com/documentation/visionkit>

Framework

# VisionKit

Identify and extract information in the environment using the device’s camera, or in images that your app displays.

## Overview

VisionKit analyzes pixel information and isolates important data such as text of a given language, URLs, street addresses, phone numbers, shipment tracking numbers, flight numbers, dates, times, durations, and barcodes of various formats. The framework provides this analysis to your app through user interfaces your app displays, which enable people to interact with the analyzed data ( `ImageAnalyzer.AnalysisTypes`) and return the data of interest presents a camera pass-through view that enables the user to interact with any of the recognized content types ( `DataScannerViewController.RecognizedDataType`) as seen in the environment, and provides captured information to the app for processing.

The Image Analysis interface ( `ImageAnalysisInteraction` on iOS, and `ImageAnalysisOverlayView` on macOS) displays on top of an image and enables people to interact with content types ( `ImageAnalysisInteraction.InteractionTypes`) that the framework recognizes in the image. For example, the Live Text interface enables them to select any text present in the image ( `textSelection`), or invoke a URL ( `dataDetectors`). Also, the text selection UI offers framework-standard buttons for copying selected text, or looking up the subject on the web for more information.

VisionKit’s Document Camera view controller ( `VNDocumentCameraViewController`) is a camera pass-through experience that enables users to scan physical documents. The user scans the document page by page by tapping a camera interface in the view, which provides your app with the resulting images by page number after the scan completes. With the collection of scanned images, your app can create a digital version of the physical document, such as by exporting the scanned images to PDF.

## Interact with image subjects

In iOS 17 and macOS 14 and later, VisionKit identifies subjects within an image (see `ImageAnalysisInteraction.Subject`). A _subject_ may be the focal point of a picture, such as an object around which a photograph centers. Or, the framework may identify several objects that it recognizes in an image. VisionKit enables your app to extract, or _lift_, subjects to a separate image with the background removed (see `image`), or present a button that gives more information on the subject ( `visualLookUp`).

## Topics

### Content recognition and interaction in images

Enabling Live Text interactions with images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

### Barcode and text scanning through the camera

Scanning data with the camera

Enable Live Text data scanning of text and codes that appear in the camera’s viewfinder.

`class DataScannerViewController`

An object that scans the camera live video for text, data in text, and machine-readable codes.

`protocol DataScannerViewControllerDelegate`

A delegate object that responds when people interact with items that the data scanner recognizes.

`enum RecognizedItem`

An item that the data scanner recognizes in the camera’s live video.

### Document scanning through the camera

Structuring Recognized Text on a Document

Detect, recognize, and structure text on a business card or receipt using Vision and VisionKit.

`class VNDocumentCameraViewController`

An object that presents UI for a camera pass-through that helps people scan physical documents.

`protocol VNDocumentCameraViewControllerDelegate`

A delegate protocol through which the document camera returns its scanned results.

`class VNDocumentCameraScan`

A single document scanned in the document camera.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analysistypes>

- VisionKit
- ImageAnalyzer
- ImageAnalyzer.AnalysisTypes

Structure

# ImageAnalyzer.AnalysisTypes

The types of items that an image analyzer looks for in an image.

struct AnalysisTypes

## Topics

### Specifying types to find

`static let machineReadableCode: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for machine-readable codes, such as QR codes.

`static let text: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for text.

`static let visualLookUp: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for subjects that the framework can look up for more information.

### Managing sets

The properties and methods that conform to the option set protocol.

## Relationships

### Conforms To

- `Equatable`
- `ExpressibleByArrayLiteral`
- `OptionSet`
- `RawRepresentable`
- `SetAlgebra`

## See Also

### Creating configurations

`init(ImageAnalyzer.AnalysisTypes)`

Creates a configuration that an image analyzer uses to find items.

`let analysisTypes: ImageAnalyzer.AnalysisTypes`

The types of items that the image analyzer looks for in the image.

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller>

- VisionKit
- DataScannerViewController

Class

# DataScannerViewController

An object that scans the camera live video for text, data in text, and machine-readable codes.

@ `MainActor` @objc
class DataScannerViewController

## Mentioned in

Scanning data with the camera

## Overview

Use a `DataScannerViewController` object to get input from physical objects that appear in the camera’s live video, such as printed text and QR codes on packages.

Create a data scanner by passing parameters that configure the interface to the `init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)` initializer. Then set its delegate to an object in your app that implements the `DataScannerViewControllerDelegate` protocol.

Before presenting the view controller, check whether the data scanner is available using the `isSupported` and `isAvailable` properties. Before you can use the data scanner, you must provide a reason for using the camera (add the `NSCameraUsageDescription` key to the information property list), and a person must agree when the system dialog first appears.

Then begin data scanning by invoking the `startScanning()` method and implement the `dataScanner(_:didTapOn:)` and similar delegate methods to handle user actions. Use the `RecognizedItem` parameter passed to these methods to perform data-specific actions. For example, if the item is a QR code, perform an action with its payload string, such as opening a URL in a browser, or calling a phone number.

Alternatively, you can track items that appear in the live video using the asynchronous `recognizedItems` array.

## Topics

### Handling availability

`class var isSupported: Bool`

A Boolean value that indicates whether the device supports data scanning.

`class var isAvailable: Bool`

A Boolean value that indicates whether a person grants your app access to the camera and doesn’t have any restrictions to using the camera.

[`class var supportedTextRecognitionLanguages: [String]`](https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/supportedtextrecognitionlanguages)

The identifiers for the languages that the data scanner recognizes.

`enum ScanningUnavailable`

The possible reasons the data scanner is unavailable.

### Creating data scanners

Creates a scanner for finding data, such as text and machine-readable codes, in the camera’s live video.

The types of data that the data scanner identifies in the live video.

`struct RecognizedDataType`

A type of data that the scanner recognizes.

### Configuring data scanners

`var delegate: (any DataScannerViewControllerDelegate)?`

The delegate that handles user interaction with items recognized by the data scanner.

`let qualityLevel: DataScannerViewController.QualityLevel`

The resolution that the scanner uses to find data.

`enum QualityLevel`

The possible quality levels that the scanner uses to find data.

`let recognizesMultipleItems: Bool`

A Boolean value that indicates whether the scanner should identify all items in the live video.

`let isHighFrameRateTrackingEnabled: Bool`

A Boolean value that determines the frequency at which the scanner updates the geometry of recognized items.

`let isPinchToZoomEnabled: Bool`

A Boolean value that indicates whether people can use a two-finger pinch-to-zoom gesture.

`let isGuidanceEnabled: Bool`

A Boolean value that indicates whether the scanner provides help to a person when selecting items.

`let isHighlightingEnabled: Bool`

A Boolean value that indicates whether the scanner displays highlights around recognized items.

### Zooming

`var zoomFactor: Double`

The zoom factor for the live video in the camera.

`var minZoomFactor: Double`

The minimum zoom factor that the camera supports.

`var maxZoomFactor: Double`

The maximum zoom factor that the camera supports.

### Scanning and recognizing items

`func startScanning() throws`

Starts scanning the camera’s live video for data.

`func stopScanning()`

Stops scanning the camera’s live video for data.

`var isScanning: Bool`

A Boolean value that indicates whether the data scanner is actively looking for items.

An asynchronous array of items that the data scanner currently recognizes in the camera’s live video.

### Capturing photos

Captures a high-resolution photo of the camera’s live video.

### Customizing the interface

`var overlayContainerView: UIView`

A view that the data scanner displays over its view without interfering with the Live Text interface.

`var regionOfInterest: CGRect?`

The area of the live video in view coordinates that the data scanner searches for items.

### Responding to view controller events

`func loadView()`

Creates the view that the controller manages.

`func viewDidLoad()`

Performs some action after the system loads the view into memory.

`func viewWillAppear(Bool)`

Performs some action before the view appears.

`func viewDidDisappear(Bool)`

Performs some action after the view disappears.

`func removeFromParent()`

Removes the view controller from its parent.

### Enumerations

`enum TextContentType`

Types of text that a data scanner recognizes.

## Relationships

### Inherits From

- `UIViewController`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSCoding`
- `NSExtensionRequestHandling`
- `NSObjectProtocol`
- `UIActivityItemsConfigurationProviding`
- `UIAppearanceContainer`
- `UIContentContainer`
- `UIFocusEnvironment`
- `UIPasteConfigurationSupporting`
- `UIResponderStandardEditActions`
- `UIStateRestoring`
- `UITraitChangeObservable`
- `UITraitEnvironment`
- `UIUserActivityRestoring`

## See Also

### Barcode and text scanning through the camera

Enable Live Text data scanning of text and codes that appear in the camera’s viewfinder.

`protocol DataScannerViewControllerDelegate`

A delegate object that responds when people interact with items that the data scanner recognizes.

`enum RecognizedItem`

An item that the data scanner recognizes in the camera’s live video.

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatype>

- VisionKit
- DataScannerViewController
- DataScannerViewController.RecognizedDataType

Structure

# DataScannerViewController.RecognizedDataType

A type of data that the scanner recognizes.

struct RecognizedDataType

## Mentioned in

Scanning data with the camera

## Topics

### Recognizing text

Creates a data type for text and information the scanner finds in text.

`enum TextContentType`

Types of text that a data scanner recognizes.

### Recognizing machine-readable codes

Creates a data type for barcodes the use the specified symbologies.

### Hashing and comparing

`func hash(into: inout Hasher)`

Hashes the components of this value using the specified hasher.

Returns a Boolean value indicating whether two sets have equal elements.

## Relationships

### Conforms To

- `Equatable`
- `Hashable`

## See Also

### Creating data scanners

Creates a scanner for finding data, such as text and machine-readable codes, in the camera’s live video.

The types of data that the data scanner identifies in the live video.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction>

- VisionKit
- ImageAnalysisInteraction

Class

# ImageAnalysisInteraction

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

@ `MainActor` @objc
final class ImageAnalysisInteraction

## Mentioned in

Enabling Live Text interactions with images

## Overview

This class enables people to interact with specific content types ( `ImageAnalysisInteraction.InteractionTypes`) that the framework identifies in an image. For example:

- The Live Text interface enables them to select any text present in the image ( `textSelection`), or invoke a URL ( `dataDetectors`). The text selection UI offers framework-standard buttons for copying selected text, or looking it up on the web for more information.

- The _subject lift_ feature identifies a wide variety of objects, or _subjects_, in images with the `imageSubject` interaction type, and provides your app with an image of the objects with the background removed. The `visualLookUp` type supplements this feature by adding a button in the bottom corner of the view that people can click or tap for more information about the recognized subjects.

## Configure the interface and begin interaction

This class conforms to the `UIInteraction` protocol. To connect the interface with an image that your app displays, call `addInteraction(_:)` on your app’s image view and pass in a new instance of this class.

Choose the items that the framework recognizes in an image by configuring the `preferredInteractionTypes` property. To recognize all types of content, specify the `automatic` option, or choose a combination of types by assigning an array:

interaction.preferredInteractionTypes = [.textSelection, .imageSubject]

To begin interaction, call one of the `ImageAnalyzer` class’s `analyze` methods, such as `analyze(_:configuration:)` and set the result onto this class’s `analysis` property.

You can take more control over the interaction or provide details about your app’s image view by implementing a delegate ( `ImageAnalysisInteractionDelegate`) and assigning it to the `delegate` property. If your image view isn’t an instance of `UIImageView`, your app needs to define the interactive area within the image by implementing the `contentsRect(for:)` method.

## Topics

### Creating an image interaction

`init()`

Creates an interaction for Live Text actions with items in an image.

`convenience init(any ImageAnalysisInteractionDelegate)`

Creates an interaction for Live Text actions with the specified delegate.

### Configuring an image interaction

`var delegate: (any ImageAnalysisInteractionDelegate)?`

The delegate that handles the interaction callbacks.

`var analysis: ImageAnalysis?`

The results of analyzing an image for items that people can interact with.

`var view: UIView?`

The view that uses this interaction.

`var preferredInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that people can perform with the image.

`struct InteractionTypes`

The types of interactions that people can perform with an image.

`var activeInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that a person actively performs.

### Responding to view events

`func willMove(to: UIView?)`

Performs an action before the view adds or removes the interaction from its interaction array.

`func didMove(to: UIView?)`

Performs an action after the view adds or removes the interaction from its interaction array.

### Accessing text information

`var text: String`

The text contents of the current image analysis.

`var selectedText: String`

The current selected text.

`var selectedAttributedText: AttributedString`

The current selected attributed text.

Returns a Boolean value that indicates whether active text exists at the specified point.

`var hasActiveTextSelection: Bool`

A Boolean value that indicates whether a person or the app has text selected within the image.

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

### Managing text selection

Sets selected text ranges.

`func resetTextSelection()`

Removes a person’s text selection from the interface.

### Accessing image subjects

The set of all subjects the framework identifies in an image.

`struct Subject`

An area of interest in an image that the framework identifies as a primary focal point.

Provides an image asynchronously that contains the given subjects with the background removed.

Returns the subject at the given point within the interaction’s image, if one exists.

### Managing image subjects

All highlighted subjects in the interaction image.

### Querying the interface state

`var liveTextButtonVisible: Bool`

A Boolean value that indicates whether the Live Text button appears.

`var isSupplementaryInterfaceHidden: Bool`

A Boolean value that indicates whether the view hides supplementary interface objects.

Returns a Boolean value that indicates whether active text, data detectors, or supplementary interface objects exist at the specified point.

Returns a Boolean value that indicates whether supplementary interface objects exist at the specified point.

`var selectableItemsHighlighted: Bool`

A Boolean value that indicates whether the interaction highlights actionable text or data the analyzer detects in text.

### Customizing the interface

`var allowLongPressForDataDetectorsInTextMode: Bool`

A Boolean value that indicates whether people can press and hold text to activate data detectors.

`func setSupplementaryInterfaceHidden(Bool, animated: Bool)`

Hides or shows supplementary interface objects, such as the Live Action button and Quick Actions, depending on the item type.

`var supplementaryInterfaceContentInsets: UIEdgeInsets`

The distances the edges of content are inset from the supplementary interface.

`var supplementaryInterfaceFont: UIFont?`

The font to use for the supplementary interface.

### Managing custom image views

`var contentsRect: CGRect`

A rectangle, in unit coordinate space, that describes the content area of the interaction.

`func setContentsRectNeedsUpdate()`

Informs the view that contains the image when the layout changes and the view needs to reload its content.

### Errors

`enum SubjectUnavailable`

Error conditions that can occur during subject analysis.

## Relationships

### Inherits From

- `NSObject`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`
- `Sendable`
- `SendableMetatype`
- `UIInteraction`

## See Also

### Content recognition and interaction in images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisoverlayview>

- VisionKit
- ImageAnalysisOverlayView

Class

# ImageAnalysisOverlayView

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

@ `MainActor` @objc
final class ImageAnalysisOverlayView

## Mentioned in

Enabling Live Text interactions with images

## Overview

This class enables people to interact with specific content types ( `ImageAnalysisOverlayView.InteractionTypes`) that the framework identifies in an image. For example:

- The Live Text interface enables them to select any text present in the image ( `textSelection`), or invoke a URL ( `dataDetectors`). The text selection UI offers framework-standard buttons for copying selected text, or looking it up on the web for more information.

- The _subject lift_ feature identifies a wide variety of objects, or _subjects_, in images with the `imageSubject` interaction type, and provides your app with an image of the objects with the background removed. The `visualLookUp` type supplements this feature by adding a button in the bottom corner of the view that people can click or tap for more information about the recognized subjects.

## Configure the interface and begin interaction

To connect the interface with an image that your app displays, add a new instance of this class as a subview to your app’s image view.

Choose the items that the framework recognizes in an image by configuring the `preferredInteractionTypes` property. To recognize all types of content, specify the `automatic` option, or choose a combination of types by assigning an array:

overlayView.preferredInteractionTypes = [.textSelection, .imageSubject]

To begin interaction, call one of the `ImageAnalyzer` class’s `analyze` methods, such as `analyze(_:configuration:)` and set the result onto this class’s `analysis` property.

You can take more control over the interaction or provide details about your app’s image view by implementing a delegate ( `ImageAnalysisInteractionDelegate`) and assigning it to the `delegate` property. Your app needs to define the interactive area within the image either by setting the `trackingImageView` property, or by implementing the delegate’s `contentsRect(for:)` method.

## Topics

### Creating overlay views

`convenience init(any ImageAnalysisOverlayViewDelegate)`

Creates an overlay view with the specified delegate object.

`init(frame: NSRect)`

Creates an overlay view with the specified frame rectangle.

`init?(coder: NSCoder)`

Creates an overlay view from data in a coder object.

### Configuring overlay views

`var delegate: (any ImageAnalysisOverlayViewDelegate)?`

An object that handles image analysis interface callbacks.

`var analysis: ImageAnalysis?`

The results of analyzing an image for items that people can interact with.

`var preferredInteractionTypes: ImageAnalysisOverlayView.InteractionTypes`

The types of interactions that people can perform with the image in this overlay view.

`struct InteractionTypes`

The types of interactions that people can perform with an image.

`var trackingImageView: NSImageView?`

The image view that contains the image.

`var activeInteractionTypes: ImageAnalysisOverlayView.InteractionTypes`

The types of interactions that a person actively performs.

### Responding to view events

`func viewDidMoveToSuperview()`

Notifies your app when the view initially appears.

### Accessing text information

`var text: String`

The text contents of the current image analysis.

`var selectedText: String`

The current selected text.

`var selectedAttributedText: AttributedString`

The current selected attributed text.

`var hasActiveTextSelection: Bool`

A Boolean value that indicates whether a person or the app has text selected within the image.

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

Returns a Boolean value that indicates whether active text exists at the specified point.

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

### Managing text selection

The current selected ranges.

`func resetSelection()`

Removes a person’s text selection from the interface.

### Accessing image subjects

The set of all subjects the framework identifies in an image.

`struct Subject`

An area of interest in an image that the framework identifies as a primary focal point.

Provides an image asynchronously that contains the given subjects with the background removed.

Returns the subject at the given point within the overlay view’s image, if one exists.

### Managing image subjects

`func beginSubjectAnalysisIfNecessary()`

Begins subject analysis on the overlay view’s image.

All highlighted subjects in the overlay view’s image.

### Querying the interface state

`var liveTextButtonVisible: Bool`

A Boolean value that indicates whether the Live Text button appears.

`var isSupplementaryInterfaceHidden: Bool`

A Boolean value that indicates whether the view hides supplementary interface objects.

Returns a Boolean value that indicates whether active text, data detectors, or supplementary interface objects exist at the specified point.

Returns a Boolean value that indicates whether supplementary interface objects exist at the specified point.

`var selectableItemsHighlighted: Bool`

A Boolean value that indicates whether the overlay view highlights actionable text or data that the analyzer detects in text.

### Customizing the interface

`func setSupplementaryInterfaceHidden(Bool, animated: Bool)`

Hides or shows supplementary interface objects, such as the Live Text button and the interface for Quick Actions, depending on the item type.

`var supplementaryInterfaceContentInsets: NSEdgeInsets`

The distances the edges of content are inset from the supplementary interface.

`var supplementaryInterfaceFont: NSFont?`

The font to use for the supplementary interface.

`struct MenuTag`

Tags that enable your app to manage image-analysis context menu items.

### Managing custom image views

`var contentsRect: CGRect`

Returns the rectangle, in unit coordinates, that contains the image within the superview.

`func setContentsRectNeedsUpdate()`

Informs the view that contains the image when the layout changes and the view needs to reload its content.

### Errors

`enum SubjectUnavailable`

Error conditions that can occur during subject analysis.

## Relationships

### Inherits From

- `NSView`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSAccessibilityElementProtocol`
- `NSAccessibilityProtocol`
- `NSAnimatablePropertyContainer`
- `NSAppearanceCustomization`
- `NSCoding`
- `NSDraggingDestination`
- `NSObjectProtocol`
- `NSStandardKeyBindingResponding`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceItemIdentification`

## See Also

### Content recognition and interaction in images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.InteractionTypes

Structure

# ImageAnalysisInteraction.InteractionTypes

The types of interactions that people can perform with an image.

struct InteractionTypes

## Topics

### Specifying types of interactions

`static let automatic: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with any type of text, symbols, or subjects that the framework recognizes.

`static let textSelection: ImageAnalysisInteraction.InteractionTypes`

An option that enables text selection, copying, and translating.

`static let dataDetectors: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with text of certain formats, such as URLs, email addresses, and physical addresses.

`static let imageSubject: ImageAnalysisInteraction.InteractionTypes`

An option that enables people to use a long-press gesture on a subject in an image to separate it from the background.

`static let visualLookUp: ImageAnalysisInteraction.InteractionTypes`

An option that presents a button for more information on any subjects the framework recognizes in the image.

`static let automaticTextOnly: ImageAnalysisInteraction.InteractionTypes`

An option that enables all interaction types except image subjects and Visual Look Up.

### Creating an interaction

`init(rawValue: UInt)`

Creates an instance from a raw type.

`var rawValue: UInt`

The corresponding value of the raw type.

### Managing sets

The properties and methods that conform to the option set protocol.

## Relationships

### Conforms To

- `Equatable`
- `ExpressibleByArrayLiteral`
- `OptionSet`
- `RawRepresentable`
- `SetAlgebra`

## See Also

### Configuring an image interaction

`var delegate: (any ImageAnalysisInteractionDelegate)?`

The delegate that handles the interaction callbacks.

`var analysis: ImageAnalysis?`

The results of analyzing an image for items that people can interact with.

`var view: UIView?`

The view that uses this interaction.

`var preferredInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that people can perform with the image.

`var activeInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that a person actively performs.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/textselection>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.InteractionTypes
- textSelection

Type Property

# textSelection

An option that enables text selection, copying, and translating.

static let textSelection: `ImageAnalysisInteraction`. `InteractionTypes`

## Mentioned in

Enabling Live Text interactions with images

## Discussion

People can select text to perform actions. In this mode, the framework disables data detectors ( `dataDetectors`) by default. However, if you set the `allowLongPressForDataDetectorsInTextMode` property to `true`, a person can use a long-press gesture to enable them.

## See Also

### Specifying types of interactions

`static let automatic: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with any type of text, symbols, or subjects that the framework recognizes.

`static let dataDetectors: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with text of certain formats, such as URLs, email addresses, and physical addresses.

`static let imageSubject: ImageAnalysisInteraction.InteractionTypes`

An option that enables people to use a long-press gesture on a subject in an image to separate it from the background.

`static let visualLookUp: ImageAnalysisInteraction.InteractionTypes`

An option that presents a button for more information on any subjects the framework recognizes in the image.

`static let automaticTextOnly: ImageAnalysisInteraction.InteractionTypes`

An option that enables all interaction types except image subjects and Visual Look Up.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/datadetectors>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.InteractionTypes
- dataDetectors

Type Property

# dataDetectors

An option that enables interaction with text of certain formats, such as URLs, email addresses, and physical addresses.

static let dataDetectors: `ImageAnalysisInteraction`. `InteractionTypes`

## Discussion

People interact with _data detectors_, or UI that highlights each instance of the recognized formats in text that’s on an image. The data detectors appear without a Live Text button, because people can’t interact with other text with this option.

## See Also

### Specifying types of interactions

`static let automatic: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with any type of text, symbols, or subjects that the framework recognizes.

`static let textSelection: ImageAnalysisInteraction.InteractionTypes`

An option that enables text selection, copying, and translating.

`static let imageSubject: ImageAnalysisInteraction.InteractionTypes`

An option that enables people to use a long-press gesture on a subject in an image to separate it from the background.

`static let visualLookUp: ImageAnalysisInteraction.InteractionTypes`

An option that presents a button for more information on any subjects the framework recognizes in the image.

`static let automaticTextOnly: ImageAnalysisInteraction.InteractionTypes`

An option that enables all interaction types except image subjects and Visual Look Up.

---

# <https://developer.apple.com/documentation/visionkit/vndocumentcameraviewcontroller>

- VisionKit
- VNDocumentCameraViewController

Class

# VNDocumentCameraViewController

An object that presents UI for a camera pass-through that helps people scan physical documents.

@ `MainActor`
class VNDocumentCameraViewController

## Overview

This class enables a person to scan a physical document, page by page, by tapping a camera interface in the controller’s view. The results of a scan include images, by page number. With the collection of scanned images, your app can create a digital version of the physical document and export the scanned images to PDF.

## Present a document scanning view controller in Swift

The following Swift code presents the document scanning object and adds it to your view controller hierarchy:

let documentCameraViewController = VNDocumentCameraViewController()
documentCameraViewController.delegate = self
present(documentCameraViewController, animated: true)

## Present a document scanning view controller in Objective-C

The following Objective-C code presents the document scanning object and adds it to your view controller hierarchy:

VNDocumentCameraViewController* documentCameraViewController = [[VNDocumentCameraViewController alloc] init];
documentCameraViewController.delegate = self;
[self presentViewController:documentCameraViewController animated:YES completion:nil];

## Topics

### Supporting the document camera

`var delegate: (any VNDocumentCameraViewControllerDelegate)?`

The delegate to be notified when the user saves or cancels the document scanner.

`class var isSupported: Bool`

A Boolean variable that indicates whether or not the current device supports document scanning.

## Relationships

### Inherits From

- `UIViewController`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSCoding`
- `NSExtensionRequestHandling`
- `NSObjectProtocol`
- `NSTouchBarProvider`
- `UIActivityItemsConfigurationProviding`
- `UIAppearanceContainer`
- `UIContentContainer`
- `UIFocusEnvironment`
- `UIPasteConfigurationSupporting`
- `UIResponderStandardEditActions`
- `UIStateRestoring`
- `UITraitChangeObservable`
- `UITraitEnvironment`
- `UIUserActivityRestoring`

## See Also

### Document scanning through the camera

Structuring Recognized Text on a Document

Detect, recognize, and structure text on a business card or receipt using Vision and VisionKit.

`protocol VNDocumentCameraViewControllerDelegate`

A delegate protocol through which the document camera returns its scanned results.

`class VNDocumentCameraScan`

A single document scanned in the document camera.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subject>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.Subject

Structure

# ImageAnalysisInteraction.Subject

An area of interest in an image that the framework identifies as a primary focal point.

struct Subject

## Overview

A _subject_ is a foreground object in an image. A single image can have multiple subjects. For example, in an image of three different coffee mugs, the framework may classify all three mugs as separate subjects. In cases where the framework can’t separate overlapping objects in a photo as individual subjects, a subject may consist of two or more objects.

VisionKit enables your app to extract, or _lift_, the image subjects individually, or together, with the background removed. For more information, see `image`.

An `ImageAnalysisInteraction` object contains an array of subjects ( `subjects`) that activates when `preferredInteractionTypes` contains a subject-related option, such as `automatic`, or `imageSubject`.

Your app can also present a button that gives more information on an image’s subjects by enabling the `visualLookUp` interaction type.

## Topics

### Acquiring the subject image

`var image: UIImage`

An image of the subjects with the background removed.

### Locating and sizing the subject

`var bounds: CGRect`

A rectangle that identifies the extremities of a subject within an image in relation to the interaction view’s bounds.

### Serializing a subject

`func hash(into: inout Hasher)`

Serializes a subject with the given hasher.

## Relationships

### Conforms To

- `Equatable`
- `Hashable`

## See Also

### Accessing image subjects

The set of all subjects the framework identifies in an image.

Provides an image asynchronously that contains the given subjects with the background removed.

Returns the subject at the given point within the interaction’s image, if one exists.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subject/image>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.Subject
- image

Instance Property

# image

An image of the subjects with the background removed.

var image: `UIImage` { get async throws }

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/visuallookup>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.InteractionTypes
- visualLookUp

Type Property

# visualLookUp

An option that presents a button for more information on any subjects the framework recognizes in the image.

static let visualLookUp: `ImageAnalysisInteraction`. `InteractionTypes`

## Discussion

When the framework identifies something familiar in an image that it can provide more information about (see `ImageAnalysisInteraction.Subject`), it offers a button in the bottom-right corner of the view. When people tap the button, a modal sheet appears that offers info about the subject. For example, if the image contains a dog, the modal sheet describes the dog’s breed and provides a relevant web URL where people can read more about the breed.

VisionKit supports Visual Look Up when it recognizes the following subjects:

- Plants and flowers

- Animals, such as cats, dogs, birds, reptiles, and insects

- Places, such as constructed landmarks, sculptures, and natural landmarks

- Art and media, such as paintings, books, and album covers

- Food, such as prepared dishes and desserts

- Symbols, such as laundry care labels and vehicle dashboard indicators

## See Also

### Specifying types of interactions

`static let automatic: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with any type of text, symbols, or subjects that the framework recognizes.

`static let textSelection: ImageAnalysisInteraction.InteractionTypes`

An option that enables text selection, copying, and translating.

`static let dataDetectors: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with text of certain formats, such as URLs, email addresses, and physical addresses.

`static let imageSubject: ImageAnalysisInteraction.InteractionTypes`

An option that enables people to use a long-press gesture on a subject in an image to separate it from the background.

`static let automaticTextOnly: ImageAnalysisInteraction.InteractionTypes`

An option that enables all interaction types except image subjects and Visual Look Up.

---

# <https://developer.apple.com/documentation/visionkit/enabling-live-text-interactions-with-images>

- VisionKit
- Enabling Live Text interactions with images

Article

# Enabling Live Text interactions with images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

## Overview

Enhance the user experience with images in your app by adding standard Live Text interactions. Live Text lets users tap text in an image to copy it, make a call, send an email, translate it, or look up directions. VisionKit provides this familiar Live Text interface to your images and across platforms.

For iOS apps, users can use a long-press gesture (touch and hold) a QR code to follow a link or take another action, depending on the payload. The payload is the data that a QR code contains, such as a URL or email address.

Before interacting with items in an image, the user can tap the Live Text button in the lower-right corner to highlight the recognized items. Then a data-specific action menu appears when the user double-taps on text in an image, and uses a long-press gesture on an email address or QR code.

In your app, you decide whether Live Text recognizes text and data within text, and for iOS apps, QR codes in the image. You choose the types of items to look for and run the analysis on the image, and then VisionKit provides the entire Live Text interface with the breadth of actions for specific types.

### Check whether the device supports Live Text

Before showing a Live Text interface in your app, check whether the device supports Live Text. For iOS apps, the image analyzer is available only on devices with the A12 Bionic chip and later. If the `ImageAnalyzer` `isSupported` property is `true`, show the Live Text interface. Otherwise, disable any feature in your app that relies on Live Text. If you attempt to start the Live Text interface when this property is `false`, the interface doesn’t appear.

### Add a Live Text interaction object to your view in iOS

For iOS apps, you add the Live Text interface by adding an interaction object to the view containing the image. If you use a `UIImageView` to display the image, it handles the image content area calculations for you.

Add an `ImageAnalysisInteraction` object directly on the view containing the image.

let interaction = ImageAnalysisInteraction()
imageView.addInteraction(interaction)

Optionally, customize the interface by setting the interaction’s delegate to an object that implements the `ImageAnalysisInteractionDelegate` protocol methods.

interaction.delegate = self

If you don’t use a `UIImageView` object, inform the interaction object when the content area of the image changes while the interaction bounds don’t change. Implement the `ImageAnalysisInteractionDelegate` `contentsRect(for:)` protocol method to return the content area of the image. This keeps the Live Text highlights within the bounds of the image. Then use the `setContentsRectNeedsUpdate()` method to notify the interaction if the content area changes.

### Add a Live Text view to your image view in macOS

For macOS apps, add the Live Text interface by adding a view above the view containing the image. If you use an `NSImageView` to display the image, it handles the image content area calculations for you.

First create an instance of the `ImageAnalysisOverlayView` class.

let overlayView = ImageAnalysisOverlayView()

Then configure the overlay view to fit the bounds of the image. If your view is an image view, set the `trackingImageView` property so that the dimensions adjust when the scaling and alignment properties change.

overlayView.autoresizingMask = [.width, .height]
overlayView.frame = imageView.bounds
overlayView.trackingImageView = imageView

Add the overlay view above the image in the hierarchy. For example, add it as a subview of the view containing the image.

imageView.addSubview(overlayView)

To customize the interface, set the overlay view’s delegate to an object that implements the optional `ImageAnalysisOverlayViewDelegate` protocol methods.

overlayView.delegate = self

Implement the `overlayView(_:shouldBeginAt:forAnalysisType:)` protocol method to return `true` to begin the interaction.

func overlayView(_ overlayView: ImageAnalysisOverlayView,
shouldBeginAt point: CGPoint, forAnalysisType

overlayView.hasInteractiveItem(at: point) ||
overlayView.hasActiveTextSelection
}

If you aren’t using an `NSImageView` object, implement the `ImageAnalysisOverlayViewDelegate` `contentsRect(for:)` protocol method to return the content area of the image. Then use the `setContentsRectNeedsUpdate()` method to notify the overlay view if the content area of the image changes while the view bounds don’t change.

### Find items and start the interaction with an image

Process the image that your view displays using an `ImageAnalyzer` object. First, specify the types of items in the image you want to find when you create an `ImageAnalyzer.Configuration` object. For iOS apps, the analyzer recognizes both text and machine-readable QR codes in an image; for macOS apps, the analyzer recognizes text in an image.

let configuration = ImageAnalyzer.Configuration([.text, .machineReadableCode])

Then analyze the image by sending `analyze(_:configuration:)` to an `ImageAnalyzer` object, passing the image and the configuration. To improve performance, use a single shared instance of the analyzer throughout the app.

let analyzer = ImageAnalyzer()
let analysis = try? await analyzer.analyze(image, configuration: configuration)

For iOS apps, start the Live Text interface by setting the `analysis` property of the `ImageAnalysisInteraction` object to the results of the analyze method. For example, set the `analysis` property in the action method of a control that starts Live Text.

interaction.analysis = analysis

For macOS apps, start the Live Text interface by setting the `analysis` property of the `ImageAnalysisOverlayView` object.

overlayView.analysis = analysis

The standard Live Text menu appears when users click and hold items in the image. The user chooses actions from this menu, depending on the type of item.

### Customize behavior using interaction types

You can change the behavior of the interface by enabling types of interactions with items the analyzer finds in the image. If you set the interaction or overlay view `preferredInteractionTypes` property to `automatic`, users can interact with all types of items that the analyzer finds.

interaction.preferredInteractionTypes = .automatic

If you set the `preferredInteractionTypes` property to just `textSelection`, users can only select text in the image and then perform a basic text action, such as copying, translating, or sharing the text. For iOS apps, if the `ImageAnalysisInteraction` object’s `allowLongPressForDataDetectorsInTextMode` property is `true`, users can also touch and hold text that contains data (URLs, phone numbers, and email addresses) to perform a data-specific action.

For iOS apps, users can tap the Live Text button in the lower-right corner to switch to highlight mode. Then users can touch and hold data that the analyzer detects in text to perform a data-specific action, such as opening a URL, calling a phone number, or sending an email.

To let users interact with data that the analyzer detects in text in macOS, set the `preferredInteractionTypes` property to `dataDetectors`. Then users can hover over data in text to perform a data-specific action.

For iOS apps only, users can touch and hold QR codes and perform an action, depending on the payload, such as following an embedded link. To enable QR code interactions, set the `ImageAnalyzer.Configuration` structure’s `analysisTypes` property to `machineReadableCode`.

### Change the supplementary interface

You can modify the Live Text supplementary interface to conform better to the look of your app. The supplementary interface consists of the quick actions in the lower-left corner and the Live Text button in the lower-right corner of the interface.

To hide the supplementary interface, set the `isSupplementaryInterfaceHidden` to `false`. For iOS apps, if the `allowLongPressForDataDetectorsInTextMode` property is `true`, users can still touch and hold text to perform data-specific actions.

If your interface overlaps the supplementary interface, set the `supplementaryInterfaceContentInsets` property appropriately to move the quick actions and Live Text button.

If you want the supplementary interface to use a custom font, set the `supplementaryInterfaceFont` property. Quick actions use the specified font for text and font weight for symbols. For button size consistency, the Live Text interface ignores the point size.

### Specify recognized languages

By default the image analyzer attempts to recognize the user’s preferred languages. If you want the analyzer to consider other languages, set the `locales` property of the `ImageAnalyzer.Configuration` object.

To determine whether the image analyzer supports a language, check whether the array that the `ImageAnalyzer` `supportedTextRecognitionLanguages` class property returns includes the language ID.

For more information on language IDs, see Choosing localization regions and scripts.

## See Also

### Content recognition and interaction in images

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer>

- VisionKit
- ImageAnalyzer

Class

# ImageAnalyzer

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

final class ImageAnalyzer

## Mentioned in

Enabling Live Text interactions with images

## Overview

To use an `ImageAnalyzer` object, first create an `ImageAnalyzer.Configuration` object, and specify the types of items you want to find in an image. Then pass the image you want to analyze and the configuration object to an `ImageAnalyzer` object using the `analyze(_:configuration:)` or similar method. This method returns an `ImageAnalysis` object that contains all the data VisionKit needs to implement the Live Text interface.

Next, show the Live Text interface. For iOS apps, set the interaction object of the view that contains the image to an instance of `ImageAnalysisInteraction` and set its `analysis` property to the `ImageAnalysis` object. To enable interactions with the image, set the interaction object’s `preferredInteractionTypes` property. To customize the Live Text interface, set the `ImageAnalysisInteraction` object’s `delegate` property and implement the `ImageAnalysisInteractionDelegate` protocol methods.

For macOS apps, add an `ImageAnalysisOverlayView` object above the view that contains the image, and set its `analysis` property. To enable interactions with the image, set the overlay view’s `preferredInteractionTypes` property. Set the `ImageAnalysisOverlayView` object’s `delegate` property and implement the `ImageAnalysisOverlayViewDelegate` protocol methods.

By default, the Live Text interface starts immediately when you show the view.

## Topics

### Handling availability

`class var isSupported: Bool`

A Boolean value that indicates whether the device supports image analysis.

[`class var supportedTextRecognitionLanguages: [String]`](https://developer.apple.com/documentation/visionkit/imageanalyzer/supportedtextrecognitionlanguages)

The identifiers for the languages that the image analyzer recognizes.

### Creating image analyzers

`init()`

Creates an image analyzer that identifies subjects, text, and machine-readable codes in images.

### Configuring image analyzers

`struct Configuration`

A configuration that specifies the types of items and locales that the image analyzer recognizes.

### Finding items in images

Returns the data for providing a Live Text interaction with an image.

Returns the data for providing a Live Text interaction with an image in the specified orientation.

Returns the data for providing a Live Text interaction with a Core Graphics image in the specified orientation.

Returns the data for providing a Live Text interaction with a pixel buffer image in the specified orientation.

Returns the data for providing a Live Text interaction with a bitmap image in the specified orientation.

Returns the data for providing a Live Text interaction with an image at a URL and in the specified orientation.

### Structures

`struct AnalysisTypes`

The types of items that an image analyzer looks for in an image.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`

## See Also

### Content recognition and interaction in images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysis>

- VisionKit
- ImageAnalysis

Class

# ImageAnalysis

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

final class ImageAnalysis

## Overview

An `ImageAnalysis` object represents the results of an `ImageAnalyzer` object finding items in an image that people can interact with. To create an `ImageAnalysis` object, use the `ImageAnalyzer` class’s `analyze(_:configuration:)` method variety, passing the image and an `ImageAnalyzer.Configuration` object that specifies the items you want to find. Then pass the image analysis to either an `ImageAnalysisInteraction` object for iOS or an `ImageAnalysisOverlayView` object for macOS to provide the Live Text interface.

## Topics

### Checking results

Returns a Boolean value that indicates whether the analysis finds the specified types in the image.

### Getting the text

`var transcript: String`

The string that the text items in the image represent.

## See Also

### Content recognition and interaction in images

Enabling Live Text interactions with images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteractiondelegate>

- VisionKit
- ImageAnalysisInteractionDelegate

Protocol

# ImageAnalysisInteractionDelegate

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

@ `MainActor`
protocol ImageAnalysisInteractionDelegate : AnyObject

## Mentioned in

Enabling Live Text interactions with images

## Overview

The delegate of an `ImageAnalysisInteraction` object implements this protocol to provide interface details and to customize the response for a person’s interaction.

## Topics

### Providing interface details

Provides the view that contains the image.

**Required** Default implementation provided.

Returns the rectangle, in unit coordinates, that contains the image within the view.

Provides the view controller that presents the interface objects.

### Starting the interaction

Provides a Boolean value that indicates whether the interaction can begin at the given point.

### Tracking interface changes

`func interaction(ImageAnalysisInteraction, liveTextButtonDidChangeToVisible: Bool)`

Notifies your app when the Live Text button’s visibility changes.

`func interaction(ImageAnalysisInteraction, highlightSelectedItemsDidChange: Bool)`

Notifies your app when recognized items in the image appear highlighted as a result of a person tapping the Live Text button.

`func textSelectionDidChange(ImageAnalysisInteraction)`

Notifies your app when the interaction’s text selection changes.

## See Also

### Content recognition and interaction in images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisoverlayviewdelegate>

- VisionKit
- ImageAnalysisOverlayViewDelegate

Protocol

# ImageAnalysisOverlayViewDelegate

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

@ `MainActor`
protocol ImageAnalysisOverlayViewDelegate : AnyObject

## Mentioned in

Enabling Live Text interactions with images

## Overview

The delegate of an `ImageAnalysisOverlayView` object implements this protocol to provide interface details and to customize the response for a person’s interaction.

## Topics

### Providing interface details

Provides the view that contains the image.

**Required** Default implementation provided.

Returns the rectangle, in unit coordinate space, that contains the image within the view.

### Starting the interaction

Provides a Boolean value that indicates whether the interaction can begin at the given point.

### Tracking interface changes

`func overlayView(ImageAnalysisOverlayView, liveTextButtonDidChangeToVisible: Bool)`

Notifies your app when the Live Text button’s visibility changes.

`func overlayView(ImageAnalysisOverlayView, highlightSelectedItemsDidChange: Bool)`

Notifies your app when recognized items in the image appear highlighted as a result of a person clicking or tapping the Live Text button.

`func textSelectionDidChange(ImageAnalysisOverlayView)`

Notifies your app when the interaction’s text selection changes.

### Responding to key and menu events

Returns a Boolean value that indicates whether the overlay view consumes the given key-down event.

Provides a Boolean value that indicates whether the overlay view shows a menu for the given event.

`func overlayView(ImageAnalysisOverlayView, menu: NSMenu, willHighlight: NSMenuItem?)`

Notifies your app that the given menu item is highlighted.

`func overlayView(ImageAnalysisOverlayView, willOpen: NSMenu)`

Notifies your app that a given menu is opening imminently.

`func overlayView(ImageAnalysisOverlayView, didClose: NSMenu)`

Notifies your app that the given menu closed.

`func overlayView(ImageAnalysisOverlayView, needsUpdate: NSMenu)`

Notifies your app that the given menu needs updating.

Notifies your app before the framework presents a context menu.

## See Also

### Content recognition and interaction in images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`struct CameraRegionView`

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

---

# <https://developer.apple.com/documentation/visionkit/cameraregionview>

- VisionKit
- CameraRegionView

Structure

# CameraRegionView

This view displays a stabilized region of interest within a person’s view and provides passthrough camera feed for that selected region.

@ `MainActor` @preconcurrency
struct CameraRegionView

## Overview

`CameraRegionView` needs enterprise API access in order to be used. To use this view, you need to apply for the `Camera Region access` entitlement. For more information, including how to apply for this entitlement, see Building spatial experiences for business apps with enterprise APIs for visionOS.

This is a standalone view used in a `WindowGroup` that a person can freely move and place in order to position the desired region of interest. Examples of possible regions of interest are documents, user manuals, gauges, and displays.

The view also allows additional post-processing of passthrough camera frames. These stabilized camera frames of the selected region of interest are directly rendered into the view. The framework provides these frames to enterprise developers before rendering them on screen, so developers can apply any enhancements or modifications prior to the rendering within the view.

struct AppScene: Scene {
var body: some Scene {
// Enterprise use case which requires an enterprise license and
// entitlement.
WindowGroup(id: "WithEnterpriseLicense") {
CameraRegionView() { result in
switch result {
case .success(let context):
let pixelBuffer = context.pixelBuffer

// Add desired changes to pixel buffer.
return pixelBuffer
case .failure(let error):
// Handle errors.
return nil
}
}
}
.windowResizability(.contentSize)
}
}

## Topics

### Creating a view

Creates a view that renders a spatial camera region and optionally applies contrast enhancement.

### Setting up frame processing in your view

`struct PixelBufferProcessingContext`

A context which provides the pixel buffer for a passthrough frame.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Content recognition and interaction in images

Enabling Live Text interactions with images

Add a Live Text interface that enables users to perform actions with text and QR codes that appear in images.

`class ImageAnalyzer`

An object that finds items in images that people can interact with, such as subjects, text, and QR codes.

`class ImageAnalysis`

An object that represents the results of analyzing an image, and provides the input for the Live Text interface object.

`class ImageAnalysisInteraction`

An interface that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisInteractionDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an interaction object.

`class ImageAnalysisOverlayView`

A view that enables people to interact with recognized text, barcodes, and other objects in an image.

`protocol ImageAnalysisOverlayViewDelegate`

A delegate that handles image-analysis and user-interaction callbacks for an overlay view.

---

# <https://developer.apple.com/documentation/visionkit/scanning-data-with-the-camera>

- VisionKit
- Scanning data with the camera

Article

# Scanning data with the camera

Enable Live Text data scanning of text and codes that appear in the camera’s viewfinder.

## Overview

Let users scan text and codes with the camera, similar to the Live Text interface in the Camera app. VisionKit provides the live video, guidance for the user, item highlighting, and tap-to-focus and pinch-to-zoom functionality. You provide the user with feedback and actions for the items the scanner recognizes and the user taps. For example, your app can let users scan a QR code on a warehouse box, or call a support number on product materials.

You create a `DataScannerViewController` object and implement its delegate methods to handle when the scanner identifies items in the camera’s live video. When users tap an item, such as a QR code, you offer an appropriate action, depending on the item type. A QR code contains data, called a _payload_, such as a phone number or email address. If the payload is a website, you can open it in the browser or perform some other custom action.

### Provide a reason for using the camera

The first time your app attempts to use the camera, the system prompts users for permission. It displays a dialog that includes the name of your app and a reason that you provide to notify users why you’re using the camera. If the user grants permission, you can use the camera on the device; otherwise, the user is unable to use your app to scan text or codes. If you don’t add this key, a runtime error occurs when you access the camera.

You provide the reason for using the camera in the Xcode project configuration. Add the `NSCameraUsageDescription` key to the target’s information property list in Xcode.

1. In the project editor, select the target and click Info.

2. Under Custom iOS Target Properties, click the Plus button in any row.

3. From the pop-up menu in the Key column, choose Privacy - Camera Usage Description.

4. In the Value column, enter the reason, such as “Your camera is used to scan text and codes.”

For more information about privacy keys, see Requesting access to protected resources.

### Create a data scanner view controller

In your code, create a `DataScannerViewController` object that you configure for the needs of your app. The `DataScannerViewController` class provides the interface for scanning items in the live video. In the parameters of the initializer, you specify the types of items to scan, the quality level, whether to return multiple items, and more.

let viewController = DataScannerViewController(
recognizedDataTypes: [.text(), .barcode()],
qualityLevel: .fast,
recognizesMultipleItems: false,
isHighFrameRateTrackingEnabled: false,
isHighlightingEnabled: true)

For larger items, you can pass `DataScannerViewController.QualityLevel.fast` as the quality parameter to increase recognition speed by lowering the resolution. For smaller items, pass `DataScannerViewController.QualityLevel.accurate` to increase the resolution. If you’re unsure of the content, pass `DataScannerViewController.QualityLevel.balanced`.

If you overlay an interface on the live video, pass `true` as the `isHighFrameRateTrackingEnabled` parameter so that the scanner updates the geometry of items more frequently. For example, pass `true` so that your custom highlights keep up with the camera movement.

Use the other parameters of the initializer to disable specific interface features and gestures. For example, pass `false` for the `isGuidanceEnabled` parameter to remove text that appears in the live video while the user is scanning, such as _Slow Down_.

After you create the view controller and before you present it, set its delegate to an object in your app that handles the `DataScannerViewControllerDelegate` protocol callbacks.

viewController.delegate = self

### Handle when the scanner becomes unavailable

Before presenting an interface for scanning, confirm that the device supports scanning and that your app has access to the camera.

Check that these two properties are true:

- If the scanner can run on the user’s device, the `DataScannerViewController` `isSupported` class property is `true`. The data scanner is available on devices with the A12 Bionic chip and later.

- If the user doesn’t deny your app access to the camera, or there’s no other restrictions to using the camera, the `DataScannerViewController` `isAvailable` class property is `true`.

For example, when this convenience property that checks both these values returns `true`, enable the scanning interface in your app:

var scannerAvailable: Bool {
DataScannerViewController.isSupported &&
DataScannerViewController.isAvailable
}

If the scanner becomes unavailable for any reason while your app is running, the data scanner calls the `dataScanner(_:becameUnavailableWithError:)` delegate method. Implement this delegate method to disable or remove the data-scanning controls in your interface. For example, the scanner calls this method when users tap Don’t Allow the first time the system prompt appears, as described in Provide a reason for using the camera.

To reset the user authorization when testing your code, see Requesting access to protected resources.

### Begin data scanning

After the user allows access to the camera without restrictions, you can begin scanning for items that appear in the live video by invoking the `startScanning()` method.

try? viewController.startScanning()

The view controller begins scanning for items and maintains a collection of the current recognized items. To process items as they appear in the live video, implement these `DataScannerViewControllerDelegate` protocol methods to handle when the scanner adds, deletes, and updates items in the collection:

- `dataScanner(_:didAdd:allItems:)`

- `dataScanner(_:didRemove:allItems:)`

- `dataScanner(_:didUpdate:allItems:)`

For text items, the items in the `allItems` parameter appear in the reading order in which the strings appear in the live video.

When scanning QR codes, implement these methods to show an item’s payload, such as a URL, email address, or other data. To process items when the user taps them, see Respond when users tap an item.

### Highlight recognized items

If you pass `true` for the `isHighlightingEnabled` parameter in the initializer when you create the view controller, the scanner automatically highlights items it recognizes.

Optionally, provide your own interface for highlighting recognized items. Implement the `DataScannerViewControllerDelegate` protocol methods that the scanner invokes when modifying the list of recognized items in the live video. Then add your custom highlights of the recognized items as subviews of the view controller’s `overlayContainerView` property.

If you pass `false` as the `recognizesMultipleItems` parameter in the initializer when you create the view controller, the scanner picks only one item in the live video. By default the scanner picks the item closest to the center. However, users can provide a hint to the scanner for which item to highlight. If users tap an area in the live video, the scanner recognizes the item closest to the tap.

### Respond when users tap an item

When users tap a recognized item in the live video, the view controller invokes the `dataScanner(_:didTapOn:)` delegate method and passes the recognized item. Implement this method to take some action, depending on the item the user taps. Use the parameters of the `RecognizedItem` enumeration to get details about the item, such as the bounds.

For example, to handle when users tap a QR code, implement the `dataScanner(_:didTapOn:)` method to perform an action with the QR code’s payload. If the user taps text, provide other actions for text, such as copying it to the pasteboard.

func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
switch item {
case .text(let text):
// Copy the text to the pasteboard.
UIPasteboard.general.string = text.transcript
case .barcode(let code):
// Open the URL in the browser.
...
default:
// Insert code to handle other data types.
...
}
}

### Dismiss the data scanner view controller

When users perform an action, such as tapping an item, you can dismiss the view controller. Alternatively, you can start and stop scanning while the view controller shows the live video.

To stop scanning, use the `DataScannerViewController` `stopScanning()` method in one of the delegate methods. For example, after you capture information about the tapped item, stop scanning and dismiss the view controller in the `dataScanner(_:didTapOn:)` delegate method.

dataScanner.stopScanning()
dataScanner.dismiss(animated: true)

### Scan specific types of text and codes

You can specify the exact types of text and codes that the data scanner recognizes by passing custom types to the `DataScannerViewController` initializer.

To create a custom text type, pass one of the `DataScannerViewController.TextContentType` values to the text type initializer. The data scanner supports URLs, dates, email addresses, telephone numbers, and more. For example, a travel app can create a flight number text type.

.text(textContentType: .flightNumber)

To create a custom barcode type, pass the symbology you want to scan to the barcode type initializer. For a complete list of the symbology that the data scanner supports, see `VNBarcodeSymbology`. For example, create a type for scanning Aztec codes.

.barcode(symbologies: [.aztec])

Then pass the custom types as the `recognizedDataTypes` parameter to the `DataScannerViewController` initializer. For example, create a data scanner that only recognizes URLs and QR codes.

// Specify the types of data to recognize.

.text(textContentType: .URL),\
.barcode(symbologies: [.qr])\
]

// Create the data scanner.
let dataScanner = DataScannerViewController(recognizedDataTypes: recognizedDataTypes)

### Recognize more languages

By default, the data scanner view controller prioritizes text in the user’s preferred languages. If you know the content contains other languages, create the view controller by passing a `DataScannerViewController.RecognizedDataType` object that you configure for those languages.

Create a `DataScannerViewController.RecognizedDataType` structure using the `text(languages:textContentType:)` initializer to pass the identifiers for the languages you want to recognize.

let textDataType: DataScannerViewController.RecognizedDataType =
.text(languages: ["en-US", "fr-FR", "de-DE"])
)

Then pass the data type in the `recognizedDataTypes` parameter of the initializer when you create the `DataScannerViewController` object.

To determine whether the data scanner view controller supports a language, check whether the array that the `DataScannerViewController` `supportedTextRecognitionLanguages` class property returns includes the language ID. For more information on language IDs, see Choosing localization regions and scripts.

## See Also

### Barcode and text scanning through the camera

`class DataScannerViewController`

An object that scans the camera live video for text, data in text, and machine-readable codes.

`protocol DataScannerViewControllerDelegate`

A delegate object that responds when people interact with items that the data scanner recognizes.

`enum RecognizedItem`

An item that the data scanner recognizes in the camera’s live video.

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontrollerdelegate>

- VisionKit
- DataScannerViewControllerDelegate

Protocol

# DataScannerViewControllerDelegate

A delegate object that responds when people interact with items that the data scanner recognizes.

@ `MainActor`
protocol DataScannerViewControllerDelegate : AnyObject

## Mentioned in

Scanning data with the camera

## Overview

Implement this protocol to handle when people tap recognized items and, optionally, provide additional feedback when the data scanner updates the recognized items.

## Topics

### Customizing highlighting

[`func dataScanner(DataScannerViewController, didAdd: [RecognizedItem], allItems: [RecognizedItem])`](https://developer.apple.com/documentation/visionkit/datascannerviewcontrollerdelegate/datascanner(_:didadd:allitems:))

Responds when the data scanner starts recognizing an item.

**Required** Default implementation provided.

[`func dataScanner(DataScannerViewController, didUpdate: [RecognizedItem], allItems: [RecognizedItem])`](https://developer.apple.com/documentation/visionkit/datascannerviewcontrollerdelegate/datascanner(_:didupdate:allitems:))

Responds when the data scanner updates the geometry of an item it recognizes.

[`func dataScanner(DataScannerViewController, didRemove: [RecognizedItem], allItems: [RecognizedItem])`](https://developer.apple.com/documentation/visionkit/datascannerviewcontrollerdelegate/datascanner(_:didremove:allitems:))

Responds when the data scanner stops recognizing an item.

### Zooming

`func dataScannerDidZoom(DataScannerViewController)`

Responds when a person or your code changes the zoom factor.

### Tapping items

`func dataScanner(DataScannerViewController, didTapOn: RecognizedItem)`

Responds when a person taps an item that the data scanner recognizes.

### Handling errors

`func dataScanner(DataScannerViewController, becameUnavailableWithError: DataScannerViewController.ScanningUnavailable)`

Responds when the data scanner becomes unavailable and stops scanning.

## See Also

### Barcode and text scanning through the camera

Enable Live Text data scanning of text and codes that appear in the camera’s viewfinder.

`class DataScannerViewController`

An object that scans the camera live video for text, data in text, and machine-readable codes.

`enum RecognizedItem`

An item that the data scanner recognizes in the camera’s live video.

---

# <https://developer.apple.com/documentation/visionkit/recognizeditem>

- VisionKit
- RecognizedItem

Enumeration

# RecognizedItem

An item that the data scanner recognizes in the camera’s live video.

enum RecognizedItem

## Mentioned in

Scanning data with the camera

## Overview

A `RecognizedItem` enumeration contains the data for an item that the scanner identifies, such as the location, bounds, and content of the item. For text items, the content is the selected string, and for barcodes, it’s the encoded payload string.

## Topics

### Machine-readable items

`case barcode(RecognizedItem.Barcode)`

A machine-readable barcode.

`struct Barcode`

An object that represents a machine-readable code that the scanner recognizes.

### Text items

`case text(RecognizedItem.Text)`

Text or data the analyzer detects in text.

`struct Text`

An object that represents a text item that the scanner recognizes.

### Item location

`var bounds: RecognizedItem.Bounds`

The four corners of the recognized item in view coordinates.

`struct Bounds`

An object that represents the four corners of a recognized item.

### Item identification

`var id: UUID`

A unique identifier for the recognized item.

## Relationships

### Conforms To

- `Identifiable`

## See Also

### Barcode and text scanning through the camera

Enable Live Text data scanning of text and codes that appear in the camera’s viewfinder.

`class DataScannerViewController`

An object that scans the camera live video for text, data in text, and machine-readable codes.

`protocol DataScannerViewControllerDelegate`

A delegate object that responds when people interact with items that the data scanner recognizes.

---

# <https://developer.apple.com/documentation/visionkit/structuring_recognized_text_on_a_document>

- Vision
- Original Objective-C and Swift API
- Structuring Recognized Text on a Document

Sample Code

# Structuring Recognized Text on a Document

Detect, recognize, and structure text on a business card or receipt using Vision and VisionKit.

Download

Xcode 11.3+

## Overview

## See Also

### Text recognition

Recognizing Text in Images

Add text-recognition features to your app using the Vision framework.

Extracting phone numbers from text in images

Analyze and filter phone numbers from text in live capture by using Vision.

Locating and displaying recognized text

Perform text recognition on a photo using the Vision framework’s text-recognition request.

`class VNRecognizeTextRequest`

An image-analysis request that finds and recognizes text in an image.

`class VNRecognizedTextObservation`

A request that detects and recognizes regions of text in an image.

---

# <https://developer.apple.com/documentation/visionkit/vndocumentcameraviewcontrollerdelegate>

- VisionKit
- VNDocumentCameraViewControllerDelegate

Protocol

# VNDocumentCameraViewControllerDelegate

A delegate protocol through which the document camera returns its scanned results.

protocol VNDocumentCameraViewControllerDelegate : `NSObjectProtocol`

## Overview

Your app is responsible for dismissing the document camera in all delegate callback methods.

## Topics

### Determining scan results

`func documentCameraViewController(VNDocumentCameraViewController, didFinishWith: VNDocumentCameraScan)`

Tells the delegate that the user successfully saved a scanned document from the document camera.

`func documentCameraViewControllerDidCancel(VNDocumentCameraViewController)`

Tells the delegate that the user canceled out of the document scanner camera.

`func documentCameraViewController(VNDocumentCameraViewController, didFailWithError: any Error)`

Tells the delegate that document scanning failed while the camera view controller was active.

## Relationships

### Inherits From

- `NSObjectProtocol`

## See Also

### Document scanning through the camera

Structuring Recognized Text on a Document

Detect, recognize, and structure text on a business card or receipt using Vision and VisionKit.

`class VNDocumentCameraViewController`

An object that presents UI for a camera pass-through that helps people scan physical documents.

`class VNDocumentCameraScan`

A single document scanned in the document camera.

---

# <https://developer.apple.com/documentation/visionkit/vndocumentcamerascan>

- VisionKit
- VNDocumentCameraScan

Class

# VNDocumentCameraScan

A single document scanned in the document camera.

class VNDocumentCameraScan

## Overview

When the document camera scans a document, it returns the resulting information in this format, through the delegate method `documentCameraViewController(_:didFinishWith:)`.

## Topics

### Reading the scanned document

`var title: String`

The title of the scanned document.

`var pageCount: Int`

The number of pages in the scanned document.

Requests the image of a page at a specified index.

## Relationships

### Inherits From

- `NSObject`

### Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## See Also

### Document scanning through the camera

Structuring Recognized Text on a Document

Detect, recognize, and structure text on a business card or receipt using Vision and VisionKit.

`class VNDocumentCameraViewController`

An object that presents UI for a camera pass-through that helps people scan physical documents.

`protocol VNDocumentCameraViewControllerDelegate`

A delegate protocol through which the document camera returns its scanned results.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analysistypes>))

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller>)

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatype>))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisoverlayview>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes>))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/textselection>))

),#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/datadetectors>))

).#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/vndocumentcameraviewcontroller>))

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subject>))

).#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subject/image>))

),#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/visuallookup>))

).#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/enabling-live-text-interactions-with-images>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysis>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteractiondelegate>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisoverlayviewdelegate>)

---

# <https://developer.apple.com/documentation/visionkit/cameraregionview>)

---

# <https://developer.apple.com/documentation/visionkit/scanning-data-with-the-camera>)

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontrollerdelegate>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/recognizeditem>)

---

# <https://developer.apple.com/documentation/visionkit/structuring_recognized_text_on_a_document>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/vndocumentcameraviewcontroller>)

---

# <https://developer.apple.com/documentation/visionkit/vndocumentcameraviewcontrollerdelegate>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/vndocumentcamerascan>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/allowlongpressfordatadetectorsintextmode>

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/automatic>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.InteractionTypes
- automatic

Type Property

# automatic

An option that enables interaction with any type of text, symbols, or subjects that the framework recognizes.

static let automatic: `ImageAnalysisInteraction`. `InteractionTypes`

## Mentioned in

Enabling Live Text interactions with images

## Discussion

People can select text to perform actions, and after tapping the Live Text button, they can interact with data detectors. If the `allowLongPressForDataDetectorsInTextMode` property is `true`, a person can touch and hold text to activate data detectors without tapping the Live Text button.

## See Also

### Specifying types of interactions

`static let textSelection: ImageAnalysisInteraction.InteractionTypes`

An option that enables text selection, copying, and translating.

`static let dataDetectors: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with text of certain formats, such as URLs, email addresses, and physical addresses.

`static let imageSubject: ImageAnalysisInteraction.InteractionTypes`

An option that enables people to use a long-press gesture on a subject in an image to separate it from the background.

`static let visualLookUp: ImageAnalysisInteraction.InteractionTypes`

An option that presents a button for more information on any subjects the framework recognizes in the image.

`static let automaticTextOnly: ImageAnalysisInteraction.InteractionTypes`

An option that enables all interaction types except image subjects and Visual Look Up.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/imagesubject>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.InteractionTypes
- imageSubject

Type Property

# imageSubject

An option that enables people to use a long-press gesture on a subject in an image to separate it from the background.

static let imageSubject: `ImageAnalysisInteraction`. `InteractionTypes`

## Discussion

For more information about image subjects, see `ImageAnalysisInteraction.Subject`.

## See Also

### Specifying types of interactions

`static let automatic: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with any type of text, symbols, or subjects that the framework recognizes.

`static let textSelection: ImageAnalysisInteraction.InteractionTypes`

An option that enables text selection, copying, and translating.

`static let dataDetectors: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with text of certain formats, such as URLs, email addresses, and physical addresses.

`static let visualLookUp: ImageAnalysisInteraction.InteractionTypes`

An option that presents a button for more information on any subjects the framework recognizes in the image.

`static let automaticTextOnly: ImageAnalysisInteraction.InteractionTypes`

An option that enables all interaction types except image subjects and Visual Look Up.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/automatictextonly>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.InteractionTypes
- automaticTextOnly

Type Property

# automaticTextOnly

An option that enables all interaction types except image subjects and Visual Look Up.

static let automaticTextOnly: `ImageAnalysisInteraction`. `InteractionTypes`

## Discussion

This option represents the `automatic` type, but excludes the `imageSubject` and `visualLookUp` types.

## See Also

### Specifying types of interactions

`static let automatic: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with any type of text, symbols, or subjects that the framework recognizes.

`static let textSelection: ImageAnalysisInteraction.InteractionTypes`

An option that enables text selection, copying, and translating.

`static let dataDetectors: ImageAnalysisInteraction.InteractionTypes`

An option that enables interaction with text of certain formats, such as URLs, email addresses, and physical addresses.

`static let imageSubject: ImageAnalysisInteraction.InteractionTypes`

An option that enables people to use a long-press gesture on a subject in an image to separate it from the background.

`static let visualLookUp: ImageAnalysisInteraction.InteractionTypes`

An option that presents a button for more information on any subjects the framework recognizes in the image.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/datadetectors>))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/allowlongpressfordatadetectorsintextmode>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/automatic>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/datadetectors>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/imagesubject>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/visuallookup>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/interactiontypes/automatictextonly>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analysistypes/machinereadablecode>

- VisionKit
- ImageAnalyzer
- ImageAnalyzer.AnalysisTypes
- machineReadableCode

Type Property

# machineReadableCode

An option that analyzes an image for machine-readable codes, such as QR codes.

static let machineReadableCode: `ImageAnalyzer`. `AnalysisTypes`

## Mentioned in

Enabling Live Text interactions with images

## Discussion

The framework recognizes the following code types:

Aztec, Codebar, Code 39 Checksum, Code 39, Code 39 Full ASCII, Code 39 Full ASCII Checksum, Code 93, Code 93, Code 128, Matrix EAN-8, Data, EAN-13, GS1 DataBar Expanded, GS1 DataBar Limited, ITF, ITF-14, MicroPDF417, MicroQR, PDF417 QR, UPC-E

## See Also

### Specifying types to find

`static let text: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for text.

`static let visualLookUp: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for subjects that the framework can look up for more information.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analysistypes/text>

- VisionKit
- ImageAnalyzer
- ImageAnalyzer.AnalysisTypes
- text

Type Property

# text

An option that analyzes an image for text.

static let text: `ImageAnalyzer`. `AnalysisTypes`

## See Also

### Specifying types to find

`static let machineReadableCode: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for machine-readable codes, such as QR codes.

`static let visualLookUp: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for subjects that the framework can look up for more information.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analysistypes/visuallookup>

- VisionKit
- ImageAnalyzer
- ImageAnalyzer.AnalysisTypes
- visualLookUp

Type Property

# visualLookUp

An option that analyzes an image for subjects that the framework can look up for more information.

static let visualLookUp: `ImageAnalyzer`. `AnalysisTypes`

## Discussion

When the framework recognizes a particular type of subject in an image, it offers an interface for people to learn more about the subject. For example, if an image contains a rose, the framework recognizes a plant and enables people to tap the plant which presents a sheet with a list of additional resources on the specific type of plant — in this case, a rose.

For more information about subjects in images, see `ImageAnalysisInteraction.Subject`.

## See Also

### Specifying types to find

`static let machineReadableCode: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for machine-readable codes, such as QR codes.

`static let text: ImageAnalyzer.AnalysisTypes`

An option that analyzes an image for text.

---

# <https://developer.apple.com/documentation/visionkit/analysistypes-set-properties-and-methods>

Collection

- VisionKit
- ImageAnalyzer
- ImageAnalyzer.Configuration
- ImageAnalyzer.AnalysisTypes
- Set properties and methods

API Collection

# Set properties and methods

The properties and methods that conform to the option set protocol.

## Topics

### Creating sets

`init(rawValue: UInt)`

Creates an analysis type with the given value.

`var rawValue: UInt`

A unique, underlying value for the analysis type.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/configuration/init(>_:)

# app-main)

- VisionKit
- ImageAnalyzer
- ImageAnalyzer.Configuration
- init(\_:)

Initializer

# init(\_:)

Creates a configuration that an image analyzer uses to find items.

init(_ types: `ImageAnalyzer`. `AnalysisTypes`)

## Parameters

`types`

The types of items that an image analyzer looks for in the image.

## See Also

### Creating configurations

`let analysisTypes: ImageAnalyzer.AnalysisTypes`

The types of items that the image analyzer looks for in the image.

`struct AnalysisTypes`

The types of items that an image analyzer looks for in an image.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/configuration/analysistypes>

- VisionKit
- ImageAnalyzer
- ImageAnalyzer.Configuration
- analysisTypes

Instance Property

# analysisTypes

The types of items that the image analyzer looks for in the image.

let analysisTypes: `ImageAnalyzer`. `AnalysisTypes`

## Mentioned in

Enabling Live Text interactions with images

## See Also

### Creating configurations

`init(ImageAnalyzer.AnalysisTypes)`

Creates a configuration that an image analyzer uses to find items.

`struct AnalysisTypes`

The types of items that an image analyzer looks for in an image.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analysistypes/machinereadablecode>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analysistypes/text>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analysistypes/visuallookup>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/analysistypes-set-properties-and-methods>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/configuration/init(>_:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/configuration/analysistypes>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/textcontenttype>

- VisionKit
- DataScannerViewController
- DataScannerViewController.TextContentType

Enumeration

# DataScannerViewController.TextContentType

Types of text that a data scanner recognizes.

enum TextContentType

## Mentioned in

Scanning data with the camera

## Overview

To configure a `DataScannerViewController`, pass one or more options into its initializer. For example, the following code creates a data scanner that detects textual references to money.

.text(textContentType: .currency)\
]

// Create the data scanner.
let dataScanner = DataScannerViewController(recognizedDataTypes: recognizedDataTypes)

## Topics

### Identifying content types

`case URL`

The content type for a URL that appears in text.

`case dateTimeDuration`

The content type for dates, times, and durations that appear in text.

`case emailAddress`

The content type for an email address that appears in text.

`case flightNumber`

The content type for a vendor-specific flight number that appears in text.

`case fullStreetAddress`

The content type for a mailing address that appears in text.

`case shipmentTrackingNumber`

The content type for a vendor-specific parcel tracking number that appears in text.

`case telephoneNumber`

The content type for a phone number that appears in text.

`case currency`

The content type for currency.

## Relationships

### Conforms To

- `Copyable`
- `Equatable`
- `Hashable`
- `Sendable`
- `SendableMetatype`

## See Also

### Recognizing text

Creates a data type for text and information the scanner finds in text.

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatype/hash(into>:)

# app-main)

- VisionKit
- DataScannerViewController
- DataScannerViewController.RecognizedDataType
- hash(into:)

Instance Method

# hash(into:)

Hashes the components of this value using the specified hasher.

func hash(into hasher: inout `Hasher`)

## Parameters

`hasher`

The hasher to use when combining the components.

## See Also

### Hashing and comparing

Returns a Boolean value indicating whether two sets have equal elements.

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatype/==(>_:_:)

# app-main)

- VisionKit
- DataScannerViewController
- DataScannerViewController.RecognizedDataType
- ==(\_:\_:)

Operator

# ==(\_:\_:)

Returns a Boolean value indicating whether two sets have equal elements.

## Parameters

`lhs`

A value to compare.

`rhs`

Another value to compare.

## Return Value

`true` if the values are equal; otherwise, `false`.

## See Also

### Hashing and comparing

`func hash(into: inout Hasher)`

Hashes the components of this value using the specified hasher.

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/init(recognizeddatatypes:qualitylevel:recognizesmultipleitems:ishighframeratetrackingenabled:ispinchtozoomenabled:isguidanceenabled:ishighlightingenabled>:)

# app-main)

- VisionKit
- DataScannerViewController
- init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)

Initializer

# init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)

Creates a scanner for finding data, such as text and machine-readable codes, in the camera’s live video.

@ `MainActor`
init(

qualityLevel: `DataScannerViewController`. `QualityLevel` = .balanced,
recognizesMultipleItems: `Bool` = false,
isHighFrameRateTrackingEnabled: `Bool` = true,
isPinchToZoomEnabled: `Bool` = true,
isGuidanceEnabled: `Bool` = true,
isHighlightingEnabled: `Bool` = false
)

## Parameters

`recognizedDataTypes`

The types of data that the data scanner identifies in the live video.

`qualityLevel`

The level of resolution to scan that depends on the size of the items.

`recognizesMultipleItems`

A Boolean value that indicates whether the scanner identifies all items in the live video.

`isHighFrameRateTrackingEnabled`

A Boolean value that determines the frequency that the scanner updates the geometry of recognized items.

`isPinchToZoomEnabled`

A Boolean value that indicates whether people can use a two-finger pinch-to-zoom gesture.

`isGuidanceEnabled`

A Boolean value that indicates whether the scanner provides help to a person when selecting items.

`isHighlightingEnabled`

A Boolean value that indicates whether the scanner displays highlights around recognized items.

## See Also

### Related Documentation

`let qualityLevel: DataScannerViewController.QualityLevel`

The resolution that the scanner uses to find data.

`let recognizesMultipleItems: Bool`

A Boolean value that indicates whether the scanner should identify all items in the live video.

`let isHighFrameRateTrackingEnabled: Bool`

A Boolean value that determines the frequency at which the scanner updates the geometry of recognized items.

`let isGuidanceEnabled: Bool`

### Creating data scanners

`struct RecognizedDataType`

A type of data that the scanner recognizes.

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatypes>

- VisionKit
- DataScannerViewController
- recognizedDataTypes

Instance Property

# recognizedDataTypes

The types of data that the data scanner identifies in the live video.

@ `MainActor`

## See Also

### Creating data scanners

Creates a scanner for finding data, such as text and machine-readable codes, in the camera’s live video.

`struct RecognizedDataType`

A type of data that the scanner recognizes.

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatype/text(languages:textcontenttype>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/textcontenttype>)

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatype/barcode(symbologies>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatype/hash(into>:))

# 502 Bad Gateway

* * *

Apple

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatype/==(>_:_:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/init(recognizeddatatypes:qualitylevel:recognizesmultipleitems:ishighframeratetrackingenabled:ispinchtozoomenabled:isguidanceenabled:ishighlightingenabled>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/datascannerviewcontroller/recognizeddatatypes>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/preferredinteractiontypes>

- VisionKit
- ImageAnalysisInteraction
- preferredInteractionTypes

Instance Property

# preferredInteractionTypes

The types of interactions that people can perform with the image.

@ `MainActor`
final var preferredInteractionTypes: `ImageAnalysisInteraction`. `InteractionTypes` { get set }

## Mentioned in

Enabling Live Text interactions with images

## Discussion

You need to set this property to enable interactions with the image. If this property contains `automatic`, the interaction ignores the other types in the set. The default value for this property is an empty array that disables any interactions.

If you set this property to one or more types, the interaction sets the view’s `isUserInteractionEnabled` property to `true` so that the interaction begins. For example, when you’re ready to start the Live Text interface, set this property to `automatic`.

If you set this property to an empty array, the image analysis interaction doesn’t reset the view’s `isUserInteractionEnabled` property to `false`.

## See Also

### Configuring an image interaction

`var delegate: (any ImageAnalysisInteractionDelegate)?`

The delegate that handles the interaction callbacks.

`var analysis: ImageAnalysis?`

The results of analyzing an image for items that people can interact with.

`var view: UIView?`

The view that uses this interaction.

`struct InteractionTypes`

The types of interactions that people can perform with an image.

`var activeInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that a person actively performs.

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analyze(_:configuration>:)

# app-main)

- VisionKit
- ImageAnalyzer
- analyze(\_:configuration:)

Instance Method

# analyze(\_:configuration:)

Returns the data for providing a Live Text interaction with an image.

final func analyze(
_ image: `UIImage`,
configuration: `ImageAnalyzer`. `Configuration`

## Parameters

`image`

An image that the analyzer processes.

`configuration`

A configuration that specifies the data types, and locales for text items, to recognize.

## Return Value

The data items that the analyzer finds in the image.

## Mentioned in

Enabling Live Text interactions with images

## Discussion

This function configures orientation automatically based on the given image’s orientation property.

## See Also

### Finding items in images

Returns the data for providing a Live Text interaction with an image in the specified orientation.

Returns the data for providing a Live Text interaction with a Core Graphics image in the specified orientation.

Returns the data for providing a Live Text interaction with a pixel buffer image in the specified orientation.

Returns the data for providing a Live Text interaction with a bitmap image in the specified orientation.

Returns the data for providing a Live Text interaction with an image at a URL and in the specified orientation.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisoverlayview/analysis>

- VisionKit
- ImageAnalysisOverlayView
- analysis

Instance Property

# analysis

The results of analyzing an image for items that people can interact with.

@ `MainActor`
final var analysis: `ImageAnalysis`? { get set }

## Mentioned in

Enabling Live Text interactions with images

## See Also

### Configuring overlay views

`var delegate: (any ImageAnalysisOverlayViewDelegate)?`

An object that handles image analysis interface callbacks.

`var preferredInteractionTypes: ImageAnalysisOverlayView.InteractionTypes`

The types of interactions that people can perform with the image in this overlay view.

`struct InteractionTypes`

The types of interactions that people can perform with an image.

`var trackingImageView: NSImageView?`

The image view that contains the image.

`var activeInteractionTypes: ImageAnalysisOverlayView.InteractionTypes`

The types of interactions that a person actively performs.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/delegate>

- VisionKit
- ImageAnalysisInteraction
- delegate

Instance Property

# delegate

The delegate that handles the interaction callbacks.

@ `MainActor`
weak final var delegate: (any `ImageAnalysisInteractionDelegate`)? { get set }

## See Also

### Configuring an image interaction

`var analysis: ImageAnalysis?`

The results of analyzing an image for items that people can interact with.

`var view: UIView?`

The view that uses this interaction.

`var preferredInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that people can perform with the image.

`struct InteractionTypes`

The types of interactions that people can perform with an image.

`var activeInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that a person actively performs.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteractiondelegate/contentsrect(for>:)

# app-main)

- VisionKit
- ImageAnalysisInteractionDelegate
- contentsRect(for:)

Instance Method

# contentsRect(for:)

Returns the rectangle, in unit coordinates, that contains the image within the view.

@ `MainActor`

**Required** Default implementation provided.

## Parameters

`interaction`

The associated interaction object for the contents rectangle.

## Return Value

The rectangle of the image within the view, in unit coordinates. The default return value is the unit rectangle, `[0.0, 0.0, 1.0, 1.0]`, which represents the whole view contents.

## Mentioned in

Enabling Live Text interactions with images

## Discussion

Implement this method when the interaction view type isn’t `UIImageView`.

## Default Implementations

### ImageAnalysisInteractionDelegate Implementations

A default unit rectangle that represents the full size of the interaction view.

## See Also

### Providing interface details

Provides the view that contains the image.

Provides the view controller that presents the interface objects.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/init()>

# app-main)

- VisionKit
- ImageAnalysisInteraction
- init()

Initializer

# init()

Creates an interaction for Live Text actions with items in an image.

@ `MainActor`
override dynamic init()

## See Also

### Creating an image interaction

`convenience init(any ImageAnalysisInteractionDelegate)`

Creates an interaction for Live Text actions with the specified delegate.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/init(>_:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- init(\_:)

Initializer

# init(\_:)

Creates an interaction for Live Text actions with the specified delegate.

@ `MainActor`
convenience init(_ delegate: any `ImageAnalysisInteractionDelegate`)

## Parameters

`delegate`

The object that provides details about the interface for the interaction.

## See Also

### Creating an image interaction

`init()`

Creates an interaction for Live Text actions with items in an image.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/analysis>

- VisionKit
- ImageAnalysisInteraction
- analysis

Instance Property

# analysis

The results of analyzing an image for items that people can interact with.

@ `MainActor`
final var analysis: `ImageAnalysis`? { get set }

## Mentioned in

Enabling Live Text interactions with images

## See Also

### Configuring an image interaction

`var delegate: (any ImageAnalysisInteractionDelegate)?`

The delegate that handles the interaction callbacks.

`var view: UIView?`

The view that uses this interaction.

`var preferredInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that people can perform with the image.

`struct InteractionTypes`

The types of interactions that people can perform with an image.

`var activeInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that a person actively performs.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/view>

- VisionKit
- ImageAnalysisInteraction
- view

Instance Property

# view

The view that uses this interaction.

@ `MainActor` @preconcurrency
weak final var view: `UIView`? { get }

## See Also

### Configuring an image interaction

`var delegate: (any ImageAnalysisInteractionDelegate)?`

The delegate that handles the interaction callbacks.

`var analysis: ImageAnalysis?`

The results of analyzing an image for items that people can interact with.

`var preferredInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that people can perform with the image.

`struct InteractionTypes`

The types of interactions that people can perform with an image.

`var activeInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that a person actively performs.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/activeinteractiontypes>

- VisionKit
- ImageAnalysisInteraction
- activeInteractionTypes

Instance Property

# activeInteractionTypes

The types of interactions that a person actively performs.

@ `MainActor`
final var activeInteractionTypes: `ImageAnalysisInteraction`. `InteractionTypes` { get }

## Discussion

This property is always a concrete type that’s never set to `automatic`.

## See Also

### Configuring an image interaction

`var delegate: (any ImageAnalysisInteractionDelegate)?`

The delegate that handles the interaction callbacks.

`var analysis: ImageAnalysis?`

The results of analyzing an image for items that people can interact with.

`var view: UIView?`

The view that uses this interaction.

`var preferredInteractionTypes: ImageAnalysisInteraction.InteractionTypes`

The types of interactions that people can perform with the image.

`struct InteractionTypes`

The types of interactions that people can perform with an image.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/willmove(to>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- willMove(to:)

Instance Method

# willMove(to:)

Performs an action before the view adds or removes the interaction from its interaction array.

@ `MainActor` @preconcurrency
final func willMove(to view: `UIView`?)

## Parameters

`view`

The view that owns and contains the interaction in its interaction array.

## See Also

### Responding to view events

`func didMove(to: UIView?)`

Performs an action after the view adds or removes the interaction from its interaction array.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/didmove(to>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- didMove(to:)

Instance Method

# didMove(to:)

Performs an action after the view adds or removes the interaction from its interaction array.

@ `MainActor` @preconcurrency
final func didMove(to view: `UIView`?)

## Parameters

`view`

The view that owns and contains the interaction in its interaction array.

## See Also

### Responding to view events

`func willMove(to: UIView?)`

Performs an action before the view adds or removes the interaction from its interaction array.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/text>

- VisionKit
- ImageAnalysisInteraction
- text

Instance Property

# text

The text contents of the current image analysis.

@ `MainActor`
final var text: `String` { get }

## See Also

### Accessing text information

`var selectedText: String`

The current selected text.

`var selectedAttributedText: AttributedString`

The current selected attributed text.

Returns a Boolean value that indicates whether active text exists at the specified point.

`var hasActiveTextSelection: Bool`

A Boolean value that indicates whether a person or the app has text selected within the image.

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/selectedtext>

- VisionKit
- ImageAnalysisInteraction
- selectedText

Instance Property

# selectedText

The current selected text.

@ `MainActor`
final var selectedText: `String` { get }

## See Also

### Accessing text information

`var text: String`

The text contents of the current image analysis.

`var selectedAttributedText: AttributedString`

The current selected attributed text.

Returns a Boolean value that indicates whether active text exists at the specified point.

`var hasActiveTextSelection: Bool`

A Boolean value that indicates whether a person or the app has text selected within the image.

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/selectedattributedtext>

- VisionKit
- ImageAnalysisInteraction
- selectedAttributedText

Instance Property

# selectedAttributedText

The current selected attributed text.

@ `MainActor`
final var selectedAttributedText: `AttributedString` { get }

## See Also

### Accessing text information

`var text: String`

The text contents of the current image analysis.

`var selectedText: String`

The current selected text.

Returns a Boolean value that indicates whether active text exists at the specified point.

`var hasActiveTextSelection: Bool`

A Boolean value that indicates whether a person or the app has text selected within the image.

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hastext(at>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- hasText(at:)

Instance Method

# hasText(at:)

Returns a Boolean value that indicates whether active text exists at the specified point.

@ `MainActor`

## Parameters

`point`

A point in the image, in view coordinates.

## Return Value

`true` if active text exists at `point`; otherwise, `false`.

## See Also

### Accessing text information

`var text: String`

The text contents of the current image analysis.

`var selectedText: String`

The current selected text.

`var selectedAttributedText: AttributedString`

The current selected attributed text.

`var hasActiveTextSelection: Bool`

A Boolean value that indicates whether a person or the app has text selected within the image.

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hasactivetextselection>

- VisionKit
- ImageAnalysisInteraction
- hasActiveTextSelection

Instance Property

# hasActiveTextSelection

A Boolean value that indicates whether a person or the app has text selected within the image.

@ `MainActor`
final var hasActiveTextSelection: `Bool` { get }

## Discussion

If `textSelection` is an active interaction type, a person can select text using a standard input method and the app can select text through the `selectedRanges` property. If neither a person nor the app select any text, then this property returns `false`.

## See Also

### Accessing text information

`var text: String`

The text contents of the current image analysis.

`var selectedText: String`

The current selected text.

`var selectedAttributedText: AttributedString`

The current selected attributed text.

Returns a Boolean value that indicates whether active text exists at the specified point.

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/analysishastext(at>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- analysisHasText(at:)

Instance Method

# analysisHasText(at:)

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

@ `MainActor`

## Parameters

`point`

A point in the image, in view coordinates.

## Return Value

`true` if text exists at `point`; otherwise, `false`.

## See Also

### Accessing text information

`var text: String`

The text contents of the current image analysis.

`var selectedText: String`

The current selected text.

`var selectedAttributedText: AttributedString`

The current selected attributed text.

Returns a Boolean value that indicates whether active text exists at the specified point.

`var hasActiveTextSelection: Bool`

A Boolean value that indicates whether a person or the app has text selected within the image.

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hasdatadetector(at>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- hasDataDetector(at:)

Instance Method

# hasDataDetector(at:)

Returns a Boolean value that indicates whether the analysis detects data at the specified point.

@ `MainActor`

## Parameters

`point`

A point in the image, in view coordinates.

## Return Value

`true` if the analyzer detects data at `point`; otherwise, `false`.

## See Also

### Accessing text information

`var text: String`

The text contents of the current image analysis.

`var selectedText: String`

The current selected text.

`var selectedAttributedText: AttributedString`

The current selected attributed text.

Returns a Boolean value that indicates whether active text exists at the specified point.

`var hasActiveTextSelection: Bool`

A Boolean value that indicates whether a person or the app has text selected within the image.

Returns a Boolean value that indicates whether the analysis finds text at the specified point.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/resettextselection()>

# app-main)

- VisionKit
- ImageAnalysisInteraction
- resetTextSelection()

Instance Method

# resetTextSelection()

Removes a person’s text selection from the interface.

@ `MainActor`
final func resetTextSelection()

## See Also

### Managing text selection

Sets selected text ranges.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subjects>

- VisionKit
- ImageAnalysisInteraction
- subjects

Instance Property

# subjects

The set of all subjects the framework identifies in an image.

@ `MainActor`

## See Also

### Accessing image subjects

`struct Subject`

An area of interest in an image that the framework identifies as a primary focal point.

Provides an image asynchronously that contains the given subjects with the background removed.

Returns the subject at the given point within the interaction’s image, if one exists.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/image(for>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- image(for:)

Instance Method

# image(for:)

Provides an image asynchronously that contains the given subjects with the background removed.

@ `MainActor`

## Parameters

`subjects`

An array of subjects to include in the image.

## Discussion

If one or more subjects fail to produce an image, the method throws `ImageAnalysisInteraction.SubjectUnavailable.imageUnavailable`.

## See Also

### Accessing image subjects

The set of all subjects the framework identifies in an image.

`struct Subject`

An area of interest in an image that the framework identifies as a primary focal point.

Returns the subject at the given point within the interaction’s image, if one exists.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subject(at>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- subject(at:)

Instance Method

# subject(at:)

Returns the subject at the given point within the interaction’s image, if one exists.

@ `MainActor`

## Parameters

`point`

A point in view coordinates at which to select a subject.

## Return Value

The subject that resides at `point`; or, `nil`, if no subject resides at `point`.

## Discussion

This method works for interaction types that include `imageSubject`.

The following code retrieves a subject image given a screen point, for instance, where a person taps:

let configuration = ImageAnalyzer.Configuration()
...
interaction.preferredInteractionTypes = [.imageSubject]
...
let viewPoint = /*A point in view coordinates*/
if let subjectObject = try await interaction.subject(at: viewPoint) {
if let image = subjectObject.image {
// Do something with the subject image.
}
}

## See Also

### Accessing image subjects

The set of all subjects the framework identifies in an image.

`struct Subject`

An area of interest in an image that the framework identifies as a primary focal point.

Provides an image asynchronously that contains the given subjects with the background removed.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/highlightedsubjects>

- VisionKit
- ImageAnalysisInteraction
- highlightedSubjects

Instance Property

# highlightedSubjects

All highlighted subjects in the interaction image.

@ `MainActor`

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/livetextbuttonvisible>

- VisionKit
- ImageAnalysisInteraction
- liveTextButtonVisible

Instance Property

# liveTextButtonVisible

A Boolean value that indicates whether the Live Text button appears.

@ `MainActor`
final var liveTextButtonVisible: `Bool` { get }

## Discussion

When a person taps the Live Text button, it highlights recognized items in the image.

## See Also

### Querying the interface state

`var isSupplementaryInterfaceHidden: Bool`

A Boolean value that indicates whether the view hides supplementary interface objects.

Returns a Boolean value that indicates whether active text, data detectors, or supplementary interface objects exist at the specified point.

Returns a Boolean value that indicates whether supplementary interface objects exist at the specified point.

`var selectableItemsHighlighted: Bool`

A Boolean value that indicates whether the interaction highlights actionable text or data the analyzer detects in text.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/issupplementaryinterfacehidden>

- VisionKit
- ImageAnalysisInteraction
- isSupplementaryInterfaceHidden

Instance Property

# isSupplementaryInterfaceHidden

A Boolean value that indicates whether the view hides supplementary interface objects.

@ `MainActor`
final var isSupplementaryInterfaceHidden: `Bool` { get set }

## Mentioned in

Enabling Live Text interactions with images

## Discussion

Supplementary interface objects include the Live Text button and Quick Actions, depending on the item type. Setting this property invokes the `setSupplementaryInterfaceHidden(_:animated:)` method, passing this property value and `true` for the `animated` parameter.

## See Also

### Querying the interface state

`var liveTextButtonVisible: Bool`

A Boolean value that indicates whether the Live Text button appears.

Returns a Boolean value that indicates whether active text, data detectors, or supplementary interface objects exist at the specified point.

Returns a Boolean value that indicates whether supplementary interface objects exist at the specified point.

`var selectableItemsHighlighted: Bool`

A Boolean value that indicates whether the interaction highlights actionable text or data the analyzer detects in text.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hasinteractiveitem(at>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- hasInteractiveItem(at:)

Instance Method

# hasInteractiveItem(at:)

Returns a Boolean value that indicates whether active text, data detectors, or supplementary interface objects exist at the specified point.

@ `MainActor`

## Parameters

`point`

A point in the image, in view coordinates.

## Return Value

`true` if active text, data detectors, or supplementary interface objects exist at `point`; otherwise, `false`.

## See Also

### Querying the interface state

`var liveTextButtonVisible: Bool`

A Boolean value that indicates whether the Live Text button appears.

`var isSupplementaryInterfaceHidden: Bool`

A Boolean value that indicates whether the view hides supplementary interface objects.

Returns a Boolean value that indicates whether supplementary interface objects exist at the specified point.

`var selectableItemsHighlighted: Bool`

A Boolean value that indicates whether the interaction highlights actionable text or data the analyzer detects in text.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hassupplementaryinterface(at>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- hasSupplementaryInterface(at:)

Instance Method

# hasSupplementaryInterface(at:)

Returns a Boolean value that indicates whether supplementary interface objects exist at the specified point.

@ `MainActor`

## Parameters

`point`

A point in the image, in view coordinates.

## Return Value

`true` if supplementary interface objects exist at `point`; otherwise, `false`.

## Discussion

Supplementary interface objects include the Live Text button and Quick Actions, depending on the item type.

## See Also

### Querying the interface state

`var liveTextButtonVisible: Bool`

A Boolean value that indicates whether the Live Text button appears.

`var isSupplementaryInterfaceHidden: Bool`

A Boolean value that indicates whether the view hides supplementary interface objects.

Returns a Boolean value that indicates whether active text, data detectors, or supplementary interface objects exist at the specified point.

`var selectableItemsHighlighted: Bool`

A Boolean value that indicates whether the interaction highlights actionable text or data the analyzer detects in text.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/selectableitemshighlighted>

- VisionKit
- ImageAnalysisInteraction
- selectableItemsHighlighted

Instance Property

# selectableItemsHighlighted

A Boolean value that indicates whether the interaction highlights actionable text or data the analyzer detects in text.

@ `MainActor`
final var selectableItemsHighlighted: `Bool` { get set }

## Discussion

The interaction object manages this property value for you. It sets this property to `false` if you set the `analysis` property or the `activeInteractionTypes` property to an empty set. Otherwise, it sets this property depending on whether a person toggles the Live Text button in the interface.

## See Also

### Querying the interface state

`var liveTextButtonVisible: Bool`

A Boolean value that indicates whether the Live Text button appears.

`var isSupplementaryInterfaceHidden: Bool`

A Boolean value that indicates whether the view hides supplementary interface objects.

Returns a Boolean value that indicates whether active text, data detectors, or supplementary interface objects exist at the specified point.

Returns a Boolean value that indicates whether supplementary interface objects exist at the specified point.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/setsupplementaryinterfacehidden(_:animated>:)

# app-main)

- VisionKit
- ImageAnalysisInteraction
- setSupplementaryInterfaceHidden(\_:animated:)

Instance Method

# setSupplementaryInterfaceHidden(\_:animated:)

Hides or shows supplementary interface objects, such as the Live Action button and Quick Actions, depending on the item type.

@ `MainActor`
final func setSupplementaryInterfaceHidden(
_ hidden: `Bool`,
animated: `Bool`
)

## Parameters

`hidden`

`true` to hide the supplementary interface; otherwise, `false`.

`animated`

`true` to animate the interface transition; otherwise, `false`.

## See Also

### Customizing the interface

`var allowLongPressForDataDetectorsInTextMode: Bool`

A Boolean value that indicates whether people can press and hold text to activate data detectors.

`var supplementaryInterfaceContentInsets: UIEdgeInsets`

The distances the edges of content are inset from the supplementary interface.

`var supplementaryInterfaceFont: UIFont?`

The font to use for the supplementary interface.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/supplementaryinterfacecontentinsets>

- VisionKit
- ImageAnalysisInteraction
- supplementaryInterfaceContentInsets

Instance Property

# supplementaryInterfaceContentInsets

The distances the edges of content are inset from the supplementary interface.

@ `MainActor`
final var supplementaryInterfaceContentInsets: `UIEdgeInsets` { get set }

## Mentioned in

Enabling Live Text interactions with images

## See Also

### Customizing the interface

`var allowLongPressForDataDetectorsInTextMode: Bool`

A Boolean value that indicates whether people can press and hold text to activate data detectors.

`func setSupplementaryInterfaceHidden(Bool, animated: Bool)`

Hides or shows supplementary interface objects, such as the Live Action button and Quick Actions, depending on the item type.

`var supplementaryInterfaceFont: UIFont?`

The font to use for the supplementary interface.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/supplementaryinterfacefont>

- VisionKit
- ImageAnalysisInteraction
- supplementaryInterfaceFont

Instance Property

# supplementaryInterfaceFont

The font to use for the supplementary interface.

@ `MainActor`
final var supplementaryInterfaceFont: `UIFont`? { get set }

## Mentioned in

Enabling Live Text interactions with images

## Discussion

The interaction also uses the font weight for image symbols, but ignores the point size to keep button sizes consistent.

## See Also

### Customizing the interface

`var allowLongPressForDataDetectorsInTextMode: Bool`

A Boolean value that indicates whether people can press and hold text to activate data detectors.

`func setSupplementaryInterfaceHidden(Bool, animated: Bool)`

Hides or shows supplementary interface objects, such as the Live Action button and Quick Actions, depending on the item type.

`var supplementaryInterfaceContentInsets: UIEdgeInsets`

The distances the edges of content are inset from the supplementary interface.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/contentsrect>

- VisionKit
- ImageAnalysisInteraction
- contentsRect

Instance Property

# contentsRect

A rectangle, in unit coordinate space, that describes the content area of the interaction.

@ `MainActor`
final var contentsRect: `CGRect` { get }

## Discussion

If the interaction’s view isn’t an instance of `UIImageView`, your app sets the value for this property by implementing the `ImageAnalysisInteractionDelegate` callback `contentsRect(for:)`. The default return value is the unit rectangle, `[0.0, 0.0, 1.0, 1.0]`, which represents the whole view contents.

## See Also

### Managing custom image views

`func setContentsRectNeedsUpdate()`

Informs the view that contains the image when the layout changes and the view needs to reload its content.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/setcontentsrectneedsupdate()>

# app-main)

- VisionKit
- ImageAnalysisInteraction
- setContentsRectNeedsUpdate()

Instance Method

# setContentsRectNeedsUpdate()

Informs the view that contains the image when the layout changes and the view needs to reload its content.

@ `MainActor`
final func setContentsRectNeedsUpdate()

## Mentioned in

Enabling Live Text interactions with images

## Discussion

The framework ignores calls to this method when your app adds the interaction to a `UIImageView`, which calculates the `contentsRect` based on the image view’s `UIView.ContentMode`.

When the view that contains the image isn’t an instance of `UIImageView`, call this method when the layout changes. The interaction then invokes the delegate’s `contentsRect(for:)` callback, which provides the updated content area to the system.

## See Also

### Managing custom image views

`var contentsRect: CGRect`

A rectangle, in unit coordinate space, that describes the content area of the interaction.

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subjectunavailable>

- VisionKit
- ImageAnalysisInteraction
- ImageAnalysisInteraction.SubjectUnavailable

Enumeration

# ImageAnalysisInteraction.SubjectUnavailable

Error conditions that can occur during subject analysis.

enum SubjectUnavailable

## Overview

This enumeration contains a failure `ImageAnalysisInteraction.SubjectUnavailable.imageUnavailable` that can occur when the `ImageAnalysisInteraction.Subject` property `image` fails to produce a result.

## Topics

### Identifying an error cause

`case imageUnavailable`

An error that indicates the subject fails to produce an image.

## Relationships

### Conforms To

- `Copyable`
- `Equatable`
- `Error`
- `Hashable`
- `Sendable`
- `SendableMetatype`

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/preferredinteractiontypes>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalyzer/analyze(_:configuration>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisoverlayview/analysis>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteractiondelegate>))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/delegate>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteractiondelegate/contentsrect(for>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/init()>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/init(>_:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/analysis>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/view>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/activeinteractiontypes>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/willmove(to>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/didmove(to>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/text>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/selectedtext>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/selectedattributedtext>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hastext(at>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hasactivetextselection>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/analysishastext(at>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hasdatadetector(at>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/selectedranges>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/resettextselection()>)

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subjects>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subject>)

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/image(for>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/subject(at>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/highlightedsubjects>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/livetextbuttonvisible>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/issupplementaryinterfacehidden>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hasinteractiveitem(at>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/hassupplementaryinterface(at>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/selectableitemshighlighted>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/setsupplementaryinterfacehidden(_:animated>:))

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/supplementaryinterfacecontentinsets>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/supplementaryinterfacefont>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/contentsrect>)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---

# <https://developer.apple.com/documentation/visionkit/imageanalysisinteraction/setcontentsrectneedsupdate()>)

)#app-main)

# The page you're looking for can't be found

Search developer.apple.comSearch Icon

---
