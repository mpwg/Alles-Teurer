<!--
Downloaded via https://llm.codes by @steipete on September 24, 2025 at 06:50 PM
Source URL: https://developer.apple.com/documentation/VisualIntelligence
Total pages processed: 19
URLs filtered: Yes
Content de-duplicated: Yes
Availability strings filtered: Yes
Code blocks only: No
-->

# https://developer.apple.com/documentation/VisualIntelligence

Framework

# Visual Intelligence

Include your app’s content in search results that visual intelligence provides.

## Overview

People use visual intelligence to learn about places and objects around them and onscreen. By pointing their visual intelligence camera at their surroundings and tapping the search button, or by selecting objects in a screenshot, people can search for matching content in apps that offer integration with visual intelligence. Matches appear in the visual intelligence experience, allowing people to view and open items, or see additional search results in the corresponding app. For example, an app that provides information about landmarks might integrate with visual intelligence to allow people to view information about a landmark or open the app for more information.

To integrate your app with visual intelligence and include your app’s content in search results, use the Visual Intelligence framework and App Intents. The Visual Intelligence framework provides you with information captured by visual intelligence, and your app uses the App Intents framework to receive the information and return matching content to the system and visual intelligence.

## Topics

### Essentials

Integrating your app with visual intelligence

Enable people to find app content that matches their surroundings or objects onscreen with visual intelligence.

`struct SemanticContentDescriptor`

A type that represents a scene that visual intelligence captures, like a screenshot, photo, or photo and video stream.

### App intents essentials

Making actions and content discoverable and widely available

Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the Action button.

Creating your first app intent

Create your first app intent that makes your app available in system experiences like Spotlight or the Shortcuts app.

---

# https://developer.apple.com/documentation/visualintelligence/integrating-your-app-with-visual-intelligence

- Visual Intelligence
- Integrating your app with visual intelligence

Article

# Integrating your app with visual intelligence

Enable people to find app content that matches their surroundings or objects onscreen with visual intelligence.

## Overview

With visual intelligence, people can visually search for information and content that matches their surroundings, or an onscreen object. Integrating your app with visual intelligence allows people to view your matching content quickly and launch your app for more detailed information or additional search results, giving it additional visibility.

### Explore the role of the App Intents framework

To integrate your app with visual intelligence, the Visual Intelligence framework provides information about objects it detects in the visual intelligence camera or a screenshot. To exchange information with your app, the system uses the App Intents framework and its concepts of app intents and app entities.

When a person performs visual search on the visual intelligence camera or a screenshot, the system forwards the information captured to an App Intents query you implement. In your query code, search your app’s content for matching items, and return them to visual intelligence as app entities. Visual intelligence then uses the app entities to display your content in the search results view, right where a person needs it.

To learn more about a displayed item, someone can tap it to open the item in your app and view information and functionality. For example, an app that allows people to view information about landmarks might show detailed information like hours, a map, or community reviews for the item a person taps in visual search.

### Provide a display representation

Visual Intelligence uses the `DisplayRepresentation` of your `AppEntity` to organize and present your content in the visual intelligence search experience. Make sure to provide localized, concise, and high-quality display representations that consist of a title, subtitle, and an image. The following example shows a version of the display representation of an `AppEntity` for a landmark. It uses strings from the model object for simplicity. In your code, make sure to provide a localized display representation.

struct LandmarkEntity: IndexedEntity {
static var typeDisplayRepresentation: TypeDisplayRepresentation {
return TypeDisplayRepresentation(
name: LocalizedStringResource("Landmark", table: "AppIntents", comment: "The type name for the landmark entity"),
numericFormat: "\(placeholder: .int) landmarks"
)
}

var displayRepresentation: DisplayRepresentation {
DisplayRepresentation(
title: "\(name)",
subtitle: "\(continent)",
image: .init(named: landmark.thumbnailImageName)
)
}

// ...
}

For additional information about display representations, refer to Integrating custom data types into your intents.

### Provide search results

To integrate your app with visual search, create the query that provides visual intelligence with content that matches a person’s surroundings or selection:

1. In your Xcode project, adopt the `IntentValueQuery` protocol and implement its `values(for:)` requirement.

2. Change the `values(for:)` function to receive a `SemanticContentDescriptor` as its `input`. The `SemanticContentDescriptor` makes visual intelligence information available to your app.

3. Use the descriptor’s `labels` to access a list of labels that visual intelligence creates or the `pixelBuffer` of the camera capture.

4. Search your app’s content using the labels and perform an image search with an image you create from the `pixelBuffer`.

5. Describe your search results as `AppEntity` objects and return them as the result of the query.

The following example demonstrates how an app that enables people to view information about points-of-interest and landmarks might access the `pixelBuffer` for its search:

struct LandmarkIntentValueQuery: IntentValueQuery {

@Dependency var modelData: ModelData

guard let pixelBuffer: CVReadOnlyPixelBuffer = input.pixelBuffer else {
return []
}

let landmarks = try await modelData.search(matching: pixelBuffer)

return landmarks
}
}

The `seachLandmarks(matching:)` function asynchronously returns a list of app entities that represent landmarks. Returning results quickly makes for a good search experience; limit the list of returned items, if needed. Limiting the items also prevents visual search from showing a long list of results that a person might have to scroll through. If your app finds a large number of matches — for example, several hundred items — you might return the first hundred results, and give people the opportunity to view the full list in your app as described in Link to additional results in your app.

### Open an item in your app

To allow someone to open your app and view additional information or access additional actions for a visual search, create an `OpenIntent`. In the intent’s `perform()` method, open your app to match the app entity that visual intelligence passes to the method.

Continuing the example that shows information about points of interest or landmarks, the `OpenIntent` might look like this:

struct OpenLandmarkIntent: OpenIntent {
static let title: LocalizedStringResource = "Open Landmark"

@Parameter(title: "Landmark", requestValueDialog: "Which landmark?")
var target: LandmarkEntity
}

Adopting the `OpenIntent` protocol isn’t specific to integrating your app with visual intelligence. Adopting App Intents, including one or more `OpenIntent` implementations, is a best practice for modern apps that offer additional integration with system experiences. If you’ve already adopted App Intents, you might be able to reuse existing code to open an item in your app with an `OpenIntent`.

For more information about adopting App Intents in your app, refer to App Intents and Making actions and content discoverable and widely available.

### Return different values in one query

Your app can’t contain more than one `IntentValueQuery` that takes a `SemanticContentDescriptor`. To return more than one `AppEntity` type from a single intent value query, use the `UnionValue()` Swift macro to return multiple app entity types. The following example uses a union value for its result — indicated by the `@UnionValue` annotation — to return a list of individual landmarks and collections of landmarks:

@UnionValue
enum VisualSearchResult {
case landmark(LandmarkEntity)
case collection(CollectionEntity)
}

// ...

// Returned search results are either landmarks or a collection.
let landmarks = try await modelData.searchLandmarks(matching: pixelBuffer)
return landmarks
}
}

### Link to additional results in your app

Returning visual search results quickly and limiting the number of items ensures a quick and enjoyable experience for people using your app. However, your app might offer a lot — possibly hundreds — of results, or browsing long lists of items might be part of your app’s core experience. If you need to provide many results, display a limited amount and allow people to open your app from the “More results” button to view more visual search results.

First, create a new app intent that conforms to the `semanticContentSearch` schema. With App Intents domains and schemas, you can quickly create app intents that follow a predefined form to enable specific functionality, such as opening a content search experience or list of results.

In the semantic content search intent’s `perform()` method, navigate to your app’s search experience and pass information that the `SemanticContentDescriptor` object provides to perform a search and show the full list of results.

## See Also

### Essentials

`struct SemanticContentDescriptor`

A type that represents a scene that visual intelligence captures, like a screenshot, photo, or photo and video stream.

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor

- Visual Intelligence
- SemanticContentDescriptor

Structure

# SemanticContentDescriptor

A type that represents a scene that visual intelligence captures, like a screenshot, photo, or photo and video stream.

struct SemanticContentDescriptor

## Mentioned in

Integrating your app with visual intelligence

## Topics

### Accessing semantic content

[`let labels: [String]`](https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/labels)

A list of labels that visual intelligence uses to classify items onscreen or visual intelligence camera.

`var pixelBuffer: CVReadOnlyPixelBuffer?`

The pixel buffer that visual intelligence captures.

### Protocol conformance

`static var defaultResolverSpecification: some ResolverSpecification`

A default implementation of an internal type that the App Intents framework uses to convert data values with resolvers.

`typealias Specification`

`typealias ValueType`

`typealias UnwrappedType`

## Relationships

### Conforms To

- `Copyable`
- `CustomLocalizedStringResourceConvertible`
- `CustomStringConvertible`
- `DisplayRepresentable`
- `InstanceDisplayRepresentable`
- `PersistentlyIdentifiable`
- `Sendable`
- `SendableMetatype`
- `TypeDisplayRepresentable`

## See Also

### Essentials

Enable people to find app content that matches their surroundings or objects onscreen with visual intelligence.

---

# https://developer.apple.com/documentation/visualintelligence/integrating-your-app-with-visual-intelligence)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/visualintelligence

Framework

# Visual Intelligence

Include your app’s content in search results that visual intelligence provides.

## Overview

People use visual intelligence to learn about places and objects around them and onscreen. By pointing their visual intelligence camera at their surroundings and tapping the search button, or by selecting objects in a screenshot, people can search for matching content in apps that offer integration with visual intelligence. Matches appear in the visual intelligence experience, allowing people to view and open items, or see additional search results in the corresponding app. For example, an app that provides information about landmarks might integrate with visual intelligence to allow people to view information about a landmark or open the app for more information.

To integrate your app with visual intelligence and include your app’s content in search results, use the Visual Intelligence framework and App Intents. The Visual Intelligence framework provides you with information captured by visual intelligence, and your app uses the App Intents framework to receive the information and return matching content to the system and visual intelligence.

## Topics

### Essentials

Integrating your app with visual intelligence

Enable people to find app content that matches their surroundings or objects onscreen with visual intelligence.

`struct SemanticContentDescriptor`

A type that represents a scene that visual intelligence captures, like a screenshot, photo, or photo and video stream.

### App intents essentials

Making actions and content discoverable and widely available

Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the Action button.

Creating your first app intent

Create your first app intent that makes your app available in system experiences like Spotlight or the Shortcuts app.

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/pixelbuffer

- Visual Intelligence
- SemanticContentDescriptor
- pixelBuffer

Instance Property

# pixelBuffer

The pixel buffer that visual intelligence captures.

var pixelBuffer: CVReadOnlyPixelBuffer? { get }

## Mentioned in

Integrating your app with visual intelligence

## See Also

### Accessing semantic content

[`let labels: [String]`](https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/labels)

A list of labels that visual intelligence uses to classify items onscreen or visual intelligence camera.

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/defaultresolverspecification

- Visual Intelligence
- SemanticContentDescriptor
- defaultResolverSpecification

Type Property

# defaultResolverSpecification

A default implementation of an internal type that the App Intents framework uses to convert data values with resolvers.

static var defaultResolverSpecification: some ResolverSpecification { get }

## See Also

### Protocol conformance

`typealias Specification`

`typealias ValueType`

`typealias UnwrappedType`

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/specification

- Visual Intelligence
- SemanticContentDescriptor
- SemanticContentDescriptor.Specification

Type Alias

# SemanticContentDescriptor.Specification

typealias Specification = some ResolverSpecification

## See Also

### Protocol conformance

`static var defaultResolverSpecification: some ResolverSpecification`

A default implementation of an internal type that the App Intents framework uses to convert data values with resolvers.

`typealias ValueType`

`typealias UnwrappedType`

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/valuetype

- Visual Intelligence
- SemanticContentDescriptor
- SemanticContentDescriptor.ValueType

Type Alias

# SemanticContentDescriptor.ValueType

typealias ValueType = SemanticContentDescriptor

## See Also

### Protocol conformance

`static var defaultResolverSpecification: some ResolverSpecification`

A default implementation of an internal type that the App Intents framework uses to convert data values with resolvers.

`typealias Specification`

`typealias UnwrappedType`

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/unwrappedtype

- Visual Intelligence
- SemanticContentDescriptor
- SemanticContentDescriptor.UnwrappedType

Type Alias

# SemanticContentDescriptor.UnwrappedType

typealias UnwrappedType = SemanticContentDescriptor

## See Also

### Protocol conformance

`static var defaultResolverSpecification: some ResolverSpecification`

A default implementation of an internal type that the App Intents framework uses to convert data values with resolvers.

`typealias Specification`

`typealias ValueType`

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/labels)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/pixelbuffer)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/defaultresolverspecification)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/specification)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/valuetype)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/unwrappedtype)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor/labels

- Visual Intelligence
- SemanticContentDescriptor
- labels

Instance Property

# labels

A list of labels that visual intelligence uses to classify items onscreen or visual intelligence camera.

let labels: [String]

## Mentioned in

Integrating your app with visual intelligence

## Discussion

Visual intelligence defines the possible label values. Use them to search for content in your app, for example, `book` or `car`, and return matching content to visual search.

## See Also

### Accessing semantic content

`var pixelBuffer: CVReadOnlyPixelBuffer?`

The pixel buffer that visual intelligence captures.

---

# https://developer.apple.com/documentation/visualintelligence/semanticcontentdescriptor).

.#app-main)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

