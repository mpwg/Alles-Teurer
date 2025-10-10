<!--
Downloaded via https://llm.codes by @steipete on September 24, 2025 at 07:37 PM
Source URL: https://developer.apple.com/documentation/Charts
Total pages processed: 184
URLs filtered: Yes
Content de-duplicated: Yes
Availability strings filtered: Yes
Code blocks only: No
-->

# https://developer.apple.com/documentation/Charts

Framework

# Swift Charts

Construct and customize charts on every Apple platform.

## Overview

Swift Charts is a powerful and concise SwiftUI framework you can use to transform your data into informative visualizations. With Swift Charts, you can build effective and customizable charts with minimal code. This framework provides marks, scales, axes, and legends as building blocks that you can combine to develop a broad range of data-driven charts.

There are many ways you can use Swift Charts to communicate patterns or trends in your data. You can create a variety of charts including line charts, bar charts, and scatter plots as shown above. When you create a chart using this framework, it automatically generates scales and axes that fit your data.

Swift Charts supports localization and accessibility features. You can also override default behavior to customize your charts by using chart modifiers. For example, you can create a dynamic experience by adding animations to your charts.

## Topics

### Essentials

Swift Charts updates

Learn about important changes to Swift Charts.

### Charts

Creating a chart using Swift Charts

Make a chart by combining chart building blocks in SwiftUI.

Visualizing your app’s data

Build complex and interactive charts using Swift Charts.

`struct Chart`

A SwiftUI view that displays a chart.

`protocol ChartContent`

A type that represents the content that you draw on a chart.

`struct ChartContentBuilder`

A result builder that you use to compose the contents of a chart.

`struct Plot`

A mechanism for grouping chart contents into a single entity.

### 3D charts

`struct Chart3D`

A SwiftUI view that displays interactive 3D charts and visualizations.

`protocol Chart3DContent`

A type that represents the three-dimensional content that you draw on a chart.

`struct Chart3DContentBuilder`

A result builder that you use to compose the three-dimensional contents of a chart.

`struct SurfacePlot`

Chart content that represents a mathematical function of two variables using a 3D surface.

### Marks

`struct AreaMark`

Chart content that represents data using the area of one or more regions.

`struct LineMark`

Chart content that represents data using a sequence of connected line segments.

`struct PointMark`

Chart content that represents data using points.

`struct RectangleMark`

Chart content that represents data using rectangles.

`struct RuleMark`

Chart content that represents data using a single horizontal or vertical rule.

`struct BarMark`

Chart content that represents data using bars.

`struct SectorMark`

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

### Mark configuration

`struct MarkStackingMethod`

The ways in which you can stack marks in a chart.

`struct MarkDimension`

An individual dimension representing a mark’s width or height.

`struct InterpolationMethod`

The ways in which line or area marks interpolate their data.

`struct BasicChartSymbolShape`

A basic chart symbol shape.

`protocol ChartSymbolShape`

A type that can act as a shape for the marks that you add to a chart.

`struct AnyChartSymbolShape`

A type-erased plotting shape.

### Labeled data

`struct PlottableValue`

Labeled data that you plot in a chart using marks.

`protocol Plottable`

A type that can serve as data to plot in a chart.

### Scales

`protocol ScaleRange`

A type that you can use to configure the range of a chart.

`protocol PositionScaleRange`

A type that configures the x-axis and y-axis values.

`struct PlotDimensionScaleRange`

A range that represents the plot area’s width or height.

`protocol ScaleDomain`

A type that you can use to configure the domain of a chart.

`struct AutomaticScaleDomain`

A domain that the chart infers from its data.

`struct ScaleType`

The ways you can scale the domain or range of a plot.

### Axes

Customizing axes in Swift Charts

Improve the clarity of your chart by configuring the appearance of its axes.

`struct ChartAxisContent`

A view that represents a chart’s axis.

`protocol AxisContent`

A type that represents the elements you use to build a chart’s axes.

`struct AxisMarks`

A group of visual marks that a chart draws to indicate the composition of a chart’s axes.

`struct AnyAxisContent`

A type-erased element of a chart’s axis.

`struct AxisContentBuilder`

A result builder that constructs axis content.

### Axis marks

`protocol AxisMark`

A type that serves as the basic building block for the elements of an axis.

`struct AxisTick`

A mark that a chart draws on an axis to indicate a reference point along that axis.

`struct AxisGridLine`

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

`struct AxisValueLabel`

A label that describes the value for an axis mark.

`struct AxisValue`

A value for an axis mark.

`struct AnyAxisMark`

A type-erased axis mark.

`struct AxisMarkBuilder`

A result builder that constructs axis marks and overrides default marks.

### Annotations

`struct AnnotationContext`

Information about an item that you add an annotation to.

`struct AnnotationPosition`

The position of an annotation.

`struct AnnotationOverflowResolution`

### Data bins

`struct NumberBins`

A collection of bins for a chart that plots data against numbers.

`struct DateBins`

A collection of bins for a chart that plots data against dates.

`struct ChartBinRange`

The range of data that a single bin of a chart represents.

### Chart management

`struct ChartPlotContent`

A view that represents a chart’s plot area.

`struct ChartProxy`

A proxy that you use to access the scales and plot area of a chart.

### Scrolling

`protocol ChartScrollTargetBehavior`

A type that configures the scroll behavior of charts.

`struct ChartScrollTargetBehaviorContext`

Contextual information that you can use to determine how to best adjust how charts scroll.

### Structures

`struct Chart3DRenderingStyle`

---

# https://developer.apple.com/documentation/charts/creating-a-chart-using-swift-charts

- Swift Charts
- Creating a chart using Swift Charts

Article

# Creating a chart using Swift Charts

Make a chart by combining chart building blocks in SwiftUI.

## Overview

Help people understand complex data by focusing on what you want to communicate and who you’re communicating to. For example, suppose that you have a collection of colorful toy shapes:

You can formulate questions about this data that you’d like to answer, like which toy shape appears the most, or how many toys are green? One way to represent your data is to collect it into a table. A table organizes the data into columns and rows so it can be easily inspected. For example, you can record how many shapes of each color you have:

| | Cube | Sphere | Pyramid | Total |
| --- | --- | --- | --- | --- |
| **Pink** | 1 | 2 | 0 | 3 |
| **Yellow** | 1 | 1 | 2 | 4 |
| **Purple** | 1 | 1 | 1 | 3 |
| **Green** | 2 | 0 | 1 | 3 |
| **Total** | 5 | 4 | 4 | 13 |

However, in many cases, a more effective data representation is a chart. A chart allows you to communicate large amounts of information all at once. The kind of chart that you create and the way you configure the chart depend on what you want to show. To create a chart with Swift Charts, define your data and initialize a `Chart` view with marks and data properties. Then use modifiers to customize different components of the chart, like the legend, axes, and scale.

### Define the data source

Think about a chart as an answer to your questions. Suppose you want to know which toy shape appears the most. Start by visualizing how many of each shape you have. To display this information with a chart, create a `ToyShape` structure that represents the information that you want to visualize:

struct ToyShape: Identifiable {
var type: String
var count: Double
var id = UUID()
}

Then, initialize an array of `ToyShape` structures to hold the data from the table:

var data: [ToyShape] = [\
.init(type: "Cube", count: 5),\
.init(type: "Sphere", count: 4),\
.init(type: "Pyramid", count: 4)\
]

In a real app, you might download this data from a network connection, or load it from a file.

### Initialize a chart view and create marks

Create a `Chart` view that serves as a container for the data series that you want to draw:

import SwiftUI
import Charts

struct BarChart: View {
var body: some View {
Chart {
// Add marks here.
}
}
}

Inside the chart, specify the graphical marks that represent the data. You can populate it with a variety of kinds of marks, like `BarMark`, `PointMark` or `LineMark`, that plot your data. The kind of mark that you choose depends on how you want to visualize the data. For example, you can use `LineMark` to create a line chart or `PointMark` to produce a scatter plot. In this case, creating a bar chart is a good way to convey the number of each type of toy shape, so you use `BarMark`:

Chart {
BarMark(
x: .value("Shape Type", data[0].type),
y: .value("Total Count", data[0].count)
)
BarMark(
x: .value("Shape Type", data[1].type),
y: .value("Total Count", data[1].count)
)
BarMark(
x: .value("Shape Type", data[2].type),
y: .value("Total Count", data[2].count)
)
}

The resulting chart clearly communicates that the cube toy shape appears the most:

Scale determines the position, height, and color of each `BarMark`. As you plot data on the y-dimension, the framework automatically generates axis labels for the y-axis to map the data values. The scale for the y-dimension is adjusted to match the range of totals for the shape’s group.

The above code lists each `BarMark` individually. However, for regular, repetitive data, you can use a `ForEach` structure to represent the same chart more concisely:

Chart {
ForEach(data) { shape in
BarMark(
x: .value("Shape Type", shape.type),
y: .value("Total Count", shape.count)
)
}
}

### Explore additional data properties

The above bar chart shows how much of each type of toy shape there are, but the earlier table separates each toy shape by color as well. A stacked bar chart can visualize not only the amount of each toy shape type, but also the distribution of colors among the shapes. Before you can plot this new information, you need to represent color in your data structure:

struct ToyShape: Identifiable {
var color: String
var type: String
var count: Double
var id = UUID()
}

Then update the initialized data to include the color information:

var stackedBarData: [ToyShape] = [\
.init(color: "Green", type: "Cube", count: 2),\
.init(color: "Green", type: "Sphere", count: 0),\
.init(color: "Green", type: "Pyramid", count: 1),\
.init(color: "Purple", type: "Cube", count: 1),\
.init(color: "Purple", type: "Sphere", count: 1),\
.init(color: "Purple", type: "Pyramid", count: 1),\
.init(color: "Pink", type: "Cube", count: 1),\
.init(color: "Pink", type: "Sphere", count: 2),\
.init(color: "Pink", type: "Pyramid", count: 0),\
.init(color: "Yellow", type: "Cube", count: 1),\
.init(color: "Yellow", type: "Sphere", count: 1),\
.init(color: "Yellow", type: "Pyramid", count: 2)\
]

To represent this additional dimension of information, add the `foregroundStyle(by:)` method to the `BarMark`, and indicate the data’s color property as the plottable value:

Chart {
ForEach(stackedBarData) { shape in
BarMark(
x: .value("Shape Type", shape.type),
y: .value("Total Count", shape.count)
)
.foregroundStyle(by: .value("Shape Color", shape.color))
}
}

The chart now splits the bars into different parts that represent the number of colors for each shape:

The stacked bar chart chooses colors to represent the new data, and adds a legend to indicate which color represents which kind of data.

### Customize your chart

For many charts, the default configuration works well. However, in this case, the colors that the framework assigns to each mark don’t match the shape colors that they represent. You can customize the chart to override the default color scale by adding the `Chart/chartForegroundStyleScale(_:)` chart modifier:

Chart {
ForEach(stackedBarData) { shape in
BarMark(
x: .value("Shape Type", shape.type),
y: .value("Total Count", shape.count)
)
.foregroundStyle(by: .value("Shape Color", shape.color))
}
}
.chartForegroundStyleScale([\
"Green": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow\
])

Now the names of the colors match the colors used in the chart, making the chart easier to understand:

This chart makes the relationship between shape counts and colors clear. You can customize charts in many other ways. For example, you can set the bar width, choose different legend symbols, and control the axes.

## See Also

### Charts

Visualizing your app’s data

Build complex and interactive charts using Swift Charts.

`struct Chart`

A SwiftUI view that displays a chart.

`protocol ChartContent`

A type that represents the content that you draw on a chart.

`struct ChartContentBuilder`

A result builder that you use to compose the contents of a chart.

`struct Plot`

A mechanism for grouping chart contents into a single entity.

---

# https://developer.apple.com/documentation/charts/visualizing_your_app_s_data

- Swift Charts
- Visualizing your app’s data

Sample Code

# Visualizing your app’s data

Build complex and interactive charts using Swift Charts.

Download

Xcode 15.0+

## Overview

## See Also

### Charts

Creating a chart using Swift Charts

Make a chart by combining chart building blocks in SwiftUI.

`struct Chart`

A SwiftUI view that displays a chart.

`protocol ChartContent`

A type that represents the content that you draw on a chart.

`struct ChartContentBuilder`

A result builder that you use to compose the contents of a chart.

`struct Plot`

A mechanism for grouping chart contents into a single entity.

---

# https://developer.apple.com/documentation/charts/chart

- Swift Charts
- Chart

Structure

# Chart

A SwiftUI view that displays a chart.

@MainActor @preconcurrency

## Mentioned in

Creating a chart using Swift Charts

## Overview

To create a chart, instantiate a `Chart` structure with marks that display the properties of your data. For example, suppose you have an array of `ValuePerCategory` structures that define data points composed of a `category` and a `value`:

struct ValuePerCategory {
var category: String
var value: Double
}

let data: [ValuePerCategory] = [\
.init(category: "A", value: 5),\
.init(category: "B", value: 9),\
.init(category: "C", value: 7)\
]

You can use `BarMark` inside a chart to represent the `category` property as different bars in the chart and the `value` property as the y value for each bar:

Chart(data, id: \.category) { item in
BarMark(
x: .value("Category", item.category),
y: .value("Value", item.value)
)
}

This chart initializer behaves a lot like a SwiftUI `ForEach`, creating a mark — in this case, a bar — for each of the values in the `data` array:

### Controlling data series inside a chart

You can compose more sophisticated charts by providing more than one series of marks to the chart. For example, suppose you have profit data for two companies:

struct ProfitOverTime {
var date: Date
var profit: Double
}

The following chart creates two different series of `LineMark` instances with different colors to represent the data for each company. In effect, it moves the `ForEach` construct from the chart’s initializer into the body of the chart, enabling you to represent multiple different series:

Chart {
ForEach(departmentAProfit, id: \.date) { item in
LineMark(
x: .value("Date", item.date),
y: .value("Profit A", item.profit),
series: .value("Company", "A")
)
.foregroundStyle(.blue)
}
ForEach(departmentBProfit, id: \.date) { item in
LineMark(
x: .value("Date", item.date),
y: .value("Profit B", item.profit),
series: .value("Company", "B")
)
.foregroundStyle(.green)
}
RuleMark(
y: .value("Threshold", 400)
)
.foregroundStyle(.red)
}

You indicate which series a line mark belongs to by specifying its `series` input parameter. The above chart also uses a `RuleMark` to produce a horizontal line segment that displays a constant threshold value across the width of the chart:

## Topics

### Creating a chart

Creates a chart composed of any number of data series and individual marks.

Creates a chart composed of a series of identifiable marks.

Creates a chart composed of a series of marks.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Charts

Make a chart by combining chart building blocks in SwiftUI.

Visualizing your app’s data

Build complex and interactive charts using Swift Charts.

`protocol ChartContent`

A type that represents the content that you draw on a chart.

`struct ChartContentBuilder`

A result builder that you use to compose the contents of a chart.

`struct Plot`

A mechanism for grouping chart contents into a single entity.

---

# https://developer.apple.com/documentation/charts/chartcontent

- Swift Charts
- ChartContent

Protocol

# ChartContent

A type that represents the content that you draw on a chart.

@MainActor @preconcurrency
protocol ChartContent

## Overview

You build a `Chart` by adding instances that conform to the `ChartContent` protocol to the chart’s `content` closure. The following example adds three explicit `BarMark` instances to a chart:

Chart {
BarMark(
x: .value("Shape Type", "Cube"),
y: .value("Total Count", 5)
)
BarMark(
x: .value("Shape Type", "Sphere"),
y: .value("Total Count", 6)
)
BarMark(
x: .value("Shape Type", "Pyramid"),
y: .value("Total Count", 4)
)
}

The chart draws marks that correspond to the instances that you specify:

You can combine any number of marks or types of marks in a single chart by listing them individually as shown in the above example, wrapping them in a `ForEach`, or any combination of these. For some mark types, like `LineMark`, you can group the marks into series using the mark’s `series` initialization parameter.

### Configure chart content

The `ChartContent` protocol provides a set of modifiers that you use to configure the properties of chart content. These behave like SwiftUI view modifiers, except that they act on chart content rather than views. Any of the types that conform to the protocol can use these modifiers. For example, you can add the `foregroundStyle(_:)` modifier to the bar representing the number of spheres in the previous example to make it red:

BarMark(
x: .value("Shape Type", "Sphere"),
y: .value("Total Count", 6)
)
.foregroundStyle(.red)

## Topics

### Styling marks

Sets the foreground style for the chart content.

Sets the opacity for the chart content.

Sets the corner radius of the chart content.

Sets the style for line marks.

Plots line and area marks with the interpolation method that you specify.

### Positioning marks

Applies an offset that you specify as a size to the chart content.

Applies a vertical and horizontal offset to the chart content.

Applies an offset to the chart content.

Aligns this item’s styles with the chart’s plot area.

### Setting symbol appearance

Sets a plotting symbol type for the chart content.

Sets a SwiftUI view to use as the symbol for the chart content.

Sets the plotting symbol size for the chart content.

Sets the plotting symbol size for the chart content according to a perceived area.

### Encoding data into mark characteristics

Represents data using a foreground style.

Represents data using line styles.

Represents data using position.

Represents data using different kinds of symbols.

Represents data using symbol sizes.

### Annotating marks

Annotates this mark or collection of marks with a view positioned relative to its bounds.

### Masking and clipping

Masks chart content using the alpha channel of the specified content.

Sets a clip shape for the chart content.

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a label to the chart content that describes its contents.

Adds a description of the value that the chart content contains.

### Implementing chart content

`var body: Self.Body`

The content and behavior of the chart content.

**Required**

`associatedtype Body : ChartContent`

The type of chart content contained in the body of this instance.

### Supporting types

`struct AnyChartContent`

A type-erased chart content.

### Instance Methods

Applies a Gaussian blur to this chart content.

A chart content that adds a shadow to this chart content.

Controls the display order of overlapping chart content.

## Relationships

### Inherited By

- `VectorizedChartContent`

### Conforming Types

- `AnyChartContent`
- `AreaMark`
- `AreaPlot`
Conforms when `Content` conforms to `ChartContent`.

- `BarMark`
- `BarPlot`
Conforms when `Content` conforms to `ChartContent`.

- `BuilderConditional`
Conforms when `TrueContent` conforms to `ChartContent` and `FalseContent` conforms to `ChartContent`.

- `FunctionAreaPlotContent`
- `FunctionLinePlotContent`
- `LineMark`
- `LinePlot`
Conforms when `Content` conforms to `ChartContent`.

- `Plot`
Conforms when `Content` conforms to `ChartContent`.

- `PointMark`
- `PointPlot`
Conforms when `Content` conforms to `ChartContent`.

- `RectangleMark`
- `RectanglePlot`
Conforms when `Content` conforms to `ChartContent`.

- `RuleMark`
- `RulePlot`
Conforms when `Content` conforms to `ChartContent`.

- `SectorMark`
- `SectorPlot`
Conforms when `Content` conforms to `ChartContent`.

- `VectorizedAreaPlotContent`
- `VectorizedBarPlotContent`
- `VectorizedLinePlotContent`
- `VectorizedPointPlotContent`
- `VectorizedRectanglePlotContent`
- `VectorizedRulePlotContent`
- `VectorizedSectorPlotContent`

## See Also

### Charts

Creating a chart using Swift Charts

Make a chart by combining chart building blocks in SwiftUI.

Visualizing your app’s data

Build complex and interactive charts using Swift Charts.

`struct Chart`

A SwiftUI view that displays a chart.

`struct ChartContentBuilder`

A result builder that you use to compose the contents of a chart.

`struct Plot`

A mechanism for grouping chart contents into a single entity.

---

# https://developer.apple.com/documentation/charts/chartcontentbuilder

- Swift Charts
- ChartContentBuilder

Structure

# ChartContentBuilder

A result builder that you use to compose the contents of a chart.

@resultBuilder
struct ChartContentBuilder

## Overview

This Result Builder combines any number of `ChartContent` instances into a single composite instance, including support for conditionals.

You don’t call the methods of the result builder directly. Instead, Swift uses them to combine the elements that you declare in any closure that has the `@ChartContentBuilder` attribute. In particular, you rely on this behavior when you declare the `content` inside a `Chart` initializer like `init(content:)`.

## Topics

### Building chart content

Builds a partial result from a single, first component.

Deprecated

Builds a partial result by combining an accumulated component and a new component.

Produces empty chart content.

### Building conditionally

Builds a partial result that’s conditionally present.

Builds a partial result from a condition that’s true.

Builds a partial result from a condition that’s false.

### Building with conditional availability

Builds a partial result that propagates or erases type information outside a compiler-controlled availability check.

### Supporting types

`struct BuilderConditional`

A conditional result from a result builder.

### Type Methods

Builds a result from multiple components.

Builds a result from a single component.

## See Also

### Charts

Creating a chart using Swift Charts

Make a chart by combining chart building blocks in SwiftUI.

Visualizing your app’s data

Build complex and interactive charts using Swift Charts.

`struct Chart`

A SwiftUI view that displays a chart.

`protocol ChartContent`

A type that represents the content that you draw on a chart.

`struct Plot`

A mechanism for grouping chart contents into a single entity.

---

# https://developer.apple.com/documentation/charts/plot

- Swift Charts
- Plot

Structure

# Plot

A mechanism for grouping chart contents into a single entity.

@MainActor @preconcurrency

## Topics

## Relationships

### Conforms To

- `ChartContent`
Conforms when `Content` conforms to `ChartContent`.

- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Charts

Creating a chart using Swift Charts

Make a chart by combining chart building blocks in SwiftUI.

Visualizing your app’s data

Build complex and interactive charts using Swift Charts.

`struct Chart`

A SwiftUI view that displays a chart.

`protocol ChartContent`

A type that represents the content that you draw on a chart.

`struct ChartContentBuilder`

A result builder that you use to compose the contents of a chart.

---

# https://developer.apple.com/documentation/charts/chart3d

- Swift Charts
- Chart3D Beta

Structure

# Chart3D

A SwiftUI view that displays interactive 3D charts and visualizations.

@MainActor @preconcurrency

## Overview

Use `Chart3D` to create three-dimensional data visualizations with compatible mark types. To add content to your chart, use the 3D-only `SurfacePlot` or the 3D initializers of `PointMark`, `RuleMark`, and `RectangleMark`.

For example, you can use a `SurfacePlot` to visualize a 3D surface for the function `y = cos(2 * x) * sin(2 * x)`:

Chart3D {
SurfacePlot(x: "x", y: "y", z: "z") { x, z in
sin(2 * x) * cos(2 * z)
}
}

You can also use the 3D initializers for `PointMark` `init(x:y:z:)`, `RuleMark` `init(x:y:z:)`, `RectangleMark` `init(x:y:z:)` to plot 3D visualizations of your data.

For example, suppose you have an array of `Penguin` structures that define datapoints composed of `beakLength`, `weight` `flipperLength`:

struct Penguin: Identifiable {
let id: Int
let flipperLength: Double
let weight: Double
let beakLength: Double
}

let penguins: [Penguin] = [\
Penguin(id: 0, flipperLength: 197, weight: 4.2, beakLength: 59),\
Penguin(id: 1, flipperLength: 220, weight: 4.7, beakLength: 48),\
Penguin(id: 2, flipperLength: 235, weight: 5.8, beakLength: 42),\
...\
]

You can also use the 3D initializer of `PointMark` `init(x:y:z:)` to represent the `flipperLength` property as the x value, the `weight` property as the y value, and the `beakLength` property as the z value:

Chart3D(penguins) {
PointMark(
x: .value("Flipper Length (mm)", $0.flipperLength),
y: .value("Weight (kg)", $0.weight),
z: .value("Beak Length (mm)", $0.beakLength)
)
}

### Customizing interactivity

@State private var pose: Chart3DPose = .default
var body: some View {
Chart3D(penguins) {
PointMark(
x: .value("Flipper Length (mm)", $0.flipperLength),
y: .value("Weight (kg)", $0.weight),
z: .value("Beak Length (mm)", $0.beakLength)
)
}
.chart3DPose($pose)
}

On available platforms, you can use the `chart3DCameraProjection(_:)` modifier to switch from orthographic to perspective projection.

Chart3D(penguins) {
...
}
.chart3DCameraProjection(.perspective)

A SwiftUI view that displays a three-dimensional chart.

## Topics

### Creating 3D charts

Creates a 3D chart composed of a series of identifiable marks.

Creates a 3D chart composed of a series of marks.

### Configuring chart shapes

`protocol Chart3DSymbolShape`

A type that can act as a shape for the marks that you add to a chart.

`struct BasicChart3DSymbolShape`

A basic chart symbol shape.

### Configuring surfaces

`protocol Chart3DSurfaceStyle`

`struct BasicChart3DSurfaceStyle`

### Customizing chart presentation

`struct Chart3DCameraProjection`

`struct Chart3DPose`

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### 3D charts

`protocol Chart3DContent`

A type that represents the three-dimensional content that you draw on a chart.

Beta

`struct Chart3DContentBuilder`

A result builder that you use to compose the three-dimensional contents of a chart.

`struct SurfacePlot`

Chart content that represents a mathematical function of two variables using a 3D surface.

Beta Software

This documentation contains preliminary information about an API or technology in development. This information is subject to change, and software implemented according to this documentation should be tested with final operating system software.

Learn more about using Apple's beta software

---

# https://developer.apple.com/documentation/charts/chart3dcontent

- Swift Charts
- Chart3DContent Beta

Protocol

# Chart3DContent

A type that represents the three-dimensional content that you draw on a chart.

@MainActor @preconcurrency
protocol Chart3DContent

## Topics

### Associated Types

`associatedtype Body : Chart3DContent`

**Required**

### Instance Properties

`var body: Self.Body`

### Instance Methods

A value that controls whether the surface has a metallic look.

A value that controls the degree of surface roughness.

Set the rotation of a 3D symbol.

## Relationships

### Conforming Types

- `BuilderConditional`
Conforms when `TrueContent` conforms to `Chart3DContent` and `FalseContent` conforms to `Chart3DContent`.

- `PointMark`
- `RectangleMark`
- `RuleMark`
- `SurfacePlot`

## See Also

### 3D charts

`struct Chart3D`

A SwiftUI view that displays interactive 3D charts and visualizations.

Beta

`struct Chart3DContentBuilder`

A result builder that you use to compose the three-dimensional contents of a chart.

`struct SurfacePlot`

Chart content that represents a mathematical function of two variables using a 3D surface.

Beta Software

This documentation contains preliminary information about an API or technology in development. This information is subject to change, and software implemented according to this documentation should be tested with final operating system software.

Learn more about using Apple's beta software

---

# https://developer.apple.com/documentation/charts/chart3dcontentbuilder

- Swift Charts
- Chart3DContentBuilder Beta

Structure

# Chart3DContentBuilder

A result builder that you use to compose the three-dimensional contents of a chart.

@resultBuilder
struct Chart3DContentBuilder

## Topics

## See Also

### 3D charts

`struct Chart3D`

A SwiftUI view that displays interactive 3D charts and visualizations.

Beta

`protocol Chart3DContent`

A type that represents the three-dimensional content that you draw on a chart.

`struct SurfacePlot`

Chart content that represents a mathematical function of two variables using a 3D surface.

Beta Software

This documentation contains preliminary information about an API or technology in development. This information is subject to change, and software implemented according to this documentation should be tested with final operating system software.

Learn more about using Apple's beta software

---

# https://developer.apple.com/documentation/charts/surfaceplot

- Swift Charts
- SurfacePlot Beta

Structure

# SurfacePlot

Chart content that represents a mathematical function of two variables using a 3D surface.

@MainActor @preconcurrency
struct SurfacePlot

## Overview

Use `SurfacePlot` to visualize a 3D surface for functions of the form `y = f(x, z)`

To create a `SurfacePlot`, provide a closure that takes `x` and `z` values as input and returns a `y` value. For example, to draw the function `y = sin(2 * x) * cos(2 * z)`, you write:

Chart3D {
SurfacePlot(x: "x", y: "y", z: "z") { x, z in
sin(2 * x) * cos(2 * z)
}
.foregroundStyle(.heightBased)
}
.chartXScale(domain: -2...2)
.chartYScale(domain: -1...1)
.chartZScale(domain: -2...2)

## Styling the Surface

Chart3D {
SurfacePlot(x: "x", y: "y", z: "z") { x, z in
sin(2 * x) * cos(2 * z) * 0.5
}
.foregroundStyle(.heightBased)

SurfacePlot(x: "x", y: "y", z: "z") { x, z in
sin(4 * x) * cos(4 * z) * 0.2 - 1
}
.foregroundStyle(.normalBased)
}
.chartXScale(domain: -2...2)
.chartYScale(domain: -1.5...1)
.chartZScale(domain: -2...2)

Chart content that represents a collection of data using three-dimensional data.

## Topics

### Initializers

Creates a SurfacePlot that represents a function y = f(x, z).

## Relationships

### Conforms To

- `Chart3DContent`
- `Sendable`
- `SendableMetatype`

## See Also

### 3D charts

`struct Chart3D`

A SwiftUI view that displays interactive 3D charts and visualizations.

Beta

`protocol Chart3DContent`

A type that represents the three-dimensional content that you draw on a chart.

`struct Chart3DContentBuilder`

A result builder that you use to compose the three-dimensional contents of a chart.

Beta Software

This documentation contains preliminary information about an API or technology in development. This information is subject to change, and software implemented according to this documentation should be tested with final operating system software.

Learn more about using Apple's beta software

---

# https://developer.apple.com/documentation/charts/areamark

- Swift Charts
- AreaMark

Structure

# AreaMark

Chart content that represents data using the area of one or more regions.

@MainActor @preconcurrency
struct AreaMark

## Overview

Use `AreaMark` to represent data as filled regions on a chart. To create a simple area mark chart, plot a date or an ordered string property on the x-axis, and a number on the y-axis. For example, suppose you have data that represents the cost of a cheeseburger over time, stored in an array of `Food` structures:

let cheeseburgerCost: [Food] = [\
.init(name: "Cheeseburger", price: 0.15, year: 1960),\
.init(name: "Cheeseburger", price: 0.20, year: 1970),\
// ...\
.init(name: "Cheeseburger", price: 1.10, year: 2020)\
]

struct Food: Identifiable {
let name: String
let price: Double
let date: Date
let id = UUID()

init(name: String, price: Double, year: Int) {
self.name = name
self.price = price
let calendar = Calendar.autoupdatingCurrent
self.date = calendar.date(from: DateComponents(year: year))!
}
}

You can create labeled data in the form of `PlottableValue` instances for each of the `x` and `y` inputs to an area mark:

Chart(cheeseburgerCost) { cost in
AreaMark(
x: .value("Date", cost.date),
y: .value("Price", cost.price)
)
}

The resulting chart automatically scales and labels the axes based on the data, and fills the area under the data points with a default color:

If you want only the line without filling in the area below the line, use `LineMark` instead.

### Add detail with a stacked area chart

To represent an additional dimension of information, you can create a stacked area chart. For example, suppose you have another data set that represents the same cost data from the previous example, but which is broken into the component costs for the burger, bun, and cheese:

let cheeseburgerCostByItem: [Food] = [\
.init(name: "Burger", price: 0.07, year: 1960),\
.init(name: "Cheese", price: 0.03, year: 1960),\
.init(name: "Bun", price: 0.05, year: 1960),\
.init(name: "Burger", price: 0.10, year: 1970),\
.init(name: "Cheese", price: 0.04, year: 1970),\
.init(name: "Bun", price: 0.06, year: 1970),\
// ...\
.init(name: "Burger", price: 0.60, year: 2020),\
.init(name: "Cheese", price: 0.26, year: 2020),\
.init(name: "Bun", price: 0.24, year: 2020)\
]

You can again create an area mark with the data, but in this case add the `foregroundStyle(by:)` modifier to create a stacked area chart that divides the information into distinct regions based on the data’s `name` property:

Chart(cheeseburgerCostByItem) { cost in
AreaMark(
x: .value("Date", cost.date),
y: .value("Price", cost.price)
)
.foregroundStyle(by: .value("Food Item", cost.name))
}

The chart automatically assigns a different color to each region, and adds a legend that indicates what each color represents based on the names that you provide to the modifier:

### Stack the data in different ways

You can highlight different aspects of the data by stacking it in different ways. For example, the previous chart shows the absolute contributions of each ingredient to the cheeseburger’s total cost. To see the relative contributions instead, you can create a normalized chart by setting the area mark’s `stacking` parameter to `normalized`:

Chart(cheeseburgerCostByItem) { cost in
AreaMark(
x: .value("Date", cost.date),
y: .value("Price", cost.price),
stacking: .normalized
)
.foregroundStyle(by: .value("Food Item", cost.name))
}

Alternatively, you can use `center` stacking to create a streamgraph, which shifts the area chart’s baseline to the center of the chart’s plotting area:

Chart(cheeseburgerCostByItem) { cost in
AreaMark(
x: .value("Date", cost.date),
y: .value("Price", cost.price),
stacking: .center
)
.foregroundStyle(by: .value("Food Item", cost.name))
}

### Create a range area chart

You can also use area marks to create a range area chart, where you provide an interval to fill in for each data point. To do this, you provide either a date or ordered string category for the x-axis and a range of values for the y-axis, or vice versa. For example, suppose you record the minimum and maximum temperatures every day in a `Weather` structure:

struct Weather: Identifiable {
let date: Date
let maximumTemperature: Double
let minimumTemperature: Double
let id: Int
}

If you load a collection of these structures into a `data` array, you can use the date on the x-axis, and each day’s minimum and maximum temperature as the start and end points for the y-axis:

Chart(data) { day in
AreaMark(
x: .value("Date", day.date),
yStart: .value("Minimum Temperature", day.minimumTemperature),
yEnd: .value("Maximum Temperature", day.maximumTemperature)
)
}

This creates a filled region that’s shaped by the start and end points on each date:

## Topics

### Creating an area mark

Creates an area mark using the specified horizontal and vertical positions.

Creates an area mark and associates it with the specified series.

### Creating a range area chart

Creates an area mark that plots values with a vertical interval.

Creates an area mark that plots values with a vertical interval and associates it with the specified series.

Creates an area mark that plots values with a horizontal interval.

Creates an area mark that plots values with a horizontal interval and associates it with the specified series.

## Relationships

### Conforms To

- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Marks

`struct LineMark`

Chart content that represents data using a sequence of connected line segments.

`struct PointMark`

Chart content that represents data using points.

`struct RectangleMark`

Chart content that represents data using rectangles.

`struct RuleMark`

Chart content that represents data using a single horizontal or vertical rule.

`struct BarMark`

Chart content that represents data using bars.

`struct SectorMark`

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

---

# https://developer.apple.com/documentation/charts/linemark

- Swift Charts
- LineMark

Structure

# LineMark

Chart content that represents data using a sequence of connected line segments.

@MainActor @preconcurrency
struct LineMark

## Mentioned in

Creating a chart using Swift Charts

## Overview

You create a line chart by plotting a category or date property, typically with the x position, and plotting a number category, typically with the y position. The example below plots the `date` property to the x position and the `hoursOfSunshine` property to the y position using `init(x:y:)`:

struct MonthlyHoursOfSunshine {
var date: Date
var hoursOfSunshine: Double

init(month: Int, hoursOfSunshine: Double) {
let calendar = Calendar.autoupdatingCurrent
self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
self.hoursOfSunshine = hoursOfSunshine
}
}

var data: [MonthlyHoursOfSunshine] = [\
MonthlyHoursOfSunshine(month: 1, hoursOfSunshine: 74),\
MonthlyHoursOfSunshine(month: 2, hoursOfSunshine: 99),\
// ...\
MonthlyHoursOfSunshine(month: 12, hoursOfSunshine: 62)\
]

var body: some View {
Chart(data) {
LineMark(
x: .value("Month", $0.date),
y: .value("Hours of Sunshine", $0.hoursOfSunshine)
)
}
}

### Plotting multiple lines

You can plot multiple lines in a chart either by explicitly specifying the `series` parameter in `init(x:y:series:)` or by applying the `foregroundStyle(_:)` or `lineStyle(_:)` modifiers. Line marks with the same `series` value will always be rendered together as a single line. When `series` is unspecified line marks with the same value plotted to foreground style and line style will be grouped together and plotted on their own line. The example below plots one line per distinct value in `city` and colors each line based on the `city` it represents:

struct MonthlyHoursOfSunshine {
var city: String
var date: Date
var hoursOfSunshine: Double

init(city: String, month: Int, hoursOfSunshine: Double) {
let calendar = Calendar.autoupdatingCurrent
self.city = city
self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
self.hoursOfSunshine = hoursOfSunshine
}
}

var data: [MonthlyHoursOfSunshine] = [\
MonthlyHoursOfSunshine(city: "Seattle", month: 1, hoursOfSunshine: 74),\
MonthlyHoursOfSunshine(city: "Cupertino", month: 1, hoursOfSunshine: 196),\
// ...\
MonthlyHoursOfSunshine(city: "Seattle", month: 12, hoursOfSunshine: 62),\
MonthlyHoursOfSunshine(city: "Cupertino", month: 12, hoursOfSunshine: 199)\
]

var body: some View {
Chart(data) {
LineMark(
x: .value("Month", $0.date),
y: .value("Hours of Sunshine", $0.hoursOfSunshine)
)
.foregroundStyle(by: .value("City", $0.city))
}
}

## Topics

### Creating a line mark

Creates a line mark.

Creates a separate line for each unique value of series.

## Relationships

### Conforms To

- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Marks

`struct AreaMark`

Chart content that represents data using the area of one or more regions.

`struct PointMark`

Chart content that represents data using points.

`struct RectangleMark`

Chart content that represents data using rectangles.

`struct RuleMark`

Chart content that represents data using a single horizontal or vertical rule.

`struct BarMark`

Chart content that represents data using bars.

`struct SectorMark`

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

---

# https://developer.apple.com/documentation/charts/pointmark

- Swift Charts
- PointMark

Structure

# PointMark

Chart content that represents data using points.

@MainActor @preconcurrency
struct PointMark

## Mentioned in

Creating a chart using Swift Charts

## Overview

You can create different kinds of point charts using the `PointMark` chart content. One common chart you can build with point marks is a scatter plot which displays the relationship between two numerical data properties. To build a scatter plot use the `init(x:y:)`. Provide a `.value` for both the `x` and `y` parameters with a string, used as a label for the data, and the data element to be plotted. The following example plots the `wingLength` and `wingHeight` properties with x and y, respectively:

struct Insect {
let name: String
let family: String
let wingLength: Double
let wingWidth: Double
let weight: Double
}

var data: [Insect] = [\
Insect(name: "Hepialidae", family: "Lepidoptera", wingLength: 61, wingWidth: 52, weight: 22),\
Insect(name: "Danaidae", family: "Lepidoptera", wingLength: 60, wingWidth: 48, weight: 24),\
Insect(name: "Riodinidae", family: "Lepidoptera", wingLength: 53, wingWidth: 43, weight: 18),\
// ...\
]

var body: some View {
Chart(data) {
PointMark(
x: .value("Wing Length", $0.wingLength),
y: .value("Wing Width", $0.wingWidth)
)
}
}

### Adding Additional Data Fields

Swift Charts provides three additional modifiers for point mark that each allow you to plot an additional property to a unique visual channel.

| Modifier | Visual Channel |
| --- | --- |
| `foregroundStyle(by:)` | plot an additional property with color |
| `symbol(by:)` | plot an additional property with symbols |
| `symbolSize(by:)` | plot an additional property with size |

For example, to plot the `family` property from the previous example’s `Insect` structure as a color, add the `foregroundStyle(by:)` modifier:

Chart(data) {
PointMark(
x: .value("Wing Length", $0.wingLength),
y: .value("Wing Width", $0.wingWidth)
)
.foregroundStyle(by: .value("Family", $0.family))
}

The foreground style modifier automatically generates a color scale that provides each mark with a color that reflects its value property. To learn how to modify the default color scale, see `ScaleModifiers`. The modifier also provides a default legend. To learn how to modify or disable the legend, see `ChartLegend`.

Alternatively, you can distinguish families with different symbols by plotting the `family` property using the `symbol(by:)` modifier:

Chart(data) {
PointMark(
x: .value("Wing Length", $0.wingLength),
y: .value("Wing Width", $0.wingWidth)
)
.symbol(by: .value("Family", $0.family))
}

### PointMark in Chart3D

To make a point in a 3D Chart, use the `init(x:y:z:)` initializer.

In addition to an `x` and `y` value, you can now position your `PointMark` along the `z` axis.

For example, in addition to plotting an insect’s `wingLength` and `wingWidth` you can also plot their `weight` with the following `Chart3D`:

Chart3D(data) {
PointMark(
x: .value("Wing Length", $0.wingLength),
y: .value("Wing Width", $0.wingWidth),
z: .value("Weight", $0.weight)
)
.foregroundStyle(by: .value("Category", $0.family))
}

## Styling a 3D PointMark

3D points also offer symbols, such as `sphere`, `cylinder`, `cone`, and `cube`. Combined with the `symbolSize(_:)` and `symbolRotation(_:)` modifiers, you can provide rich customizations for your 3D points:

Chart3D(PointMarkData.insectData) {
PointMark(
x: .value("Wing Length", $0.wingLength),
y: .value("Wing Width", $0.wingWidth),
z: .value("Weight", $0.weight)
)
.symbol(.cone)
.symbolSize(0.05)
.foregroundStyle(by: .value("Category", $0.family))
}

## Topics

### Creating a point mark

Creates a point mark that plots values to x and y.

### Initializers

Creates a point mark with fixed x position and plots values with y.

Creates a point mark that plots a value on x with fixed y position.

Creates a 3D point mark that plots values to x, y and z.

Beta

## Relationships

### Conforms To

- `Chart3DContent`
- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Marks

`struct AreaMark`

Chart content that represents data using the area of one or more regions.

`struct LineMark`

Chart content that represents data using a sequence of connected line segments.

`struct RectangleMark`

Chart content that represents data using rectangles.

`struct RuleMark`

Chart content that represents data using a single horizontal or vertical rule.

`struct BarMark`

Chart content that represents data using bars.

`struct SectorMark`

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

---

# https://developer.apple.com/documentation/charts/rectanglemark

- Swift Charts
- RectangleMark

Structure

# RectangleMark

Chart content that represents data using rectangles.

@MainActor @preconcurrency
struct RectangleMark

## Overview

Use rectangle mark to map data fields to rectangles. You can use the rectangle mark to create heat map charts or to annotate rectangular areas in a chart.

### Create a Heat Map with Rectangle Marks

When presenting data about the effectiveness of a machine learning model, you typically organize the data using a confusion matrix which shows the predicted versus the actual results of the model. To create a 2D heat map that represents a machine learning model you use `init(x:y:width:height:)`. The example below uses a 2D heat map to visualize a basic confusion matrix with the following layout:

| | Negative | Positive |
| --- | --- | --- |
| **Negative** | True Negative | False Negative |
| **Positive** | False Positive | True Positive |

The number of records in each cell, `num`, is represented by the color of its corresponding rectangle. This is done by applying the `foregroundStyle(by:)` modifier to the rectangle mark and passing it a `PlottableValue` constructed with `value(_:_:)` which takes a label and the value to plot, in this case `num`. A scale from values of `num` to color will be automatically generated and used to color the rectangles based on the value.

struct MatrixEntry {
var positive: String
var negative: String
var num: Double
}

var data: [MatrixEntry] = [\
MatrixEntry(positive: "+", negative: "+", num: 125),\
MatrixEntry(positive: "+", negative: "-", num: 10),\
MatrixEntry(positive: "-", negative: "-", num: 80),\
MatrixEntry(positive: "-", negative: "+", num: 1)\
]

var body: some View {
Chart(data) {
RectangleMark(
x: .value("Positive", $0.positive),
y: .value("Negative", $0.negative)
)
.foregroundStyle(by: .value("Number", $0.num))
}
}

### Annotate a Rectangular Area with Rectangle Marks

You can annotate a specific region in a chart with a rectangle mark by providing the coordinates of one or more rectangles. For example you can annotate point marks with rectangle marks using a shared data source like in the example below:

struct Coord {
var x: Double
var y: Double
}

var data: [Coord] = [\
Coord(x: 5, y: 5),\
Coord(x: 2.5, y: 2.5),\
Coord(x: 3, y: 3)\
]

var body: some View {
Chart(data) {
RectangleMark(
xStart: .value("Rect Start Width", $0.x - 0.25),
xEnd: .value("Rect End Width", $0.x + 0.25),
yStart: .value("Rect Start Height", $0.y - 0.25),
yEnd: .value("Rect End Height", $0.y + 0.25)
)
.opacity(0.2)

PointMark(
x: .value("X", $0.x),
y: .value("Y", $0.y)
)
}
}

### RectangleMark in Chart3D

To plot a rectangle in a 3D Chart, use the `init(x:y:z:)` initializer.

The rectangle extends along the two axes that you provide ranges for, and is positioned at a point that you specify for the third axis.

For example, the following `Chart3D` shows three rectangle marks. Each mark extends along two axes, and is fixed at `0` on the third axis.

Chart3D {
// A rule that extends along the x-axis and y-axis
RectangleMark(
x: .value("x", -0.5..<0.5),
y: .value("y", -0.5..<0.5),
z: .value("z", 0)
)
.foregroundStyle(.red)
// A rule that extends along the y-axis and z-axis
RectangleMark(
x: .value("x", 0),
y: .value("y", -0.5..<0.5),
z: .value("z", -0.5..<0.5)
)
.foregroundStyle(.green)
// A rule that extends along the z-axis and x-axis
RectangleMark(
x: .value("x", -0.5..<0.5),
y: .value("y", 0),
z: .value("z", -0.5..<0.5)
)
.foregroundStyle(.blue)
}

## Topics

### Creating a rectangle mark

Creates a rectangle mark with an y interval encoding and an x encoding.

Creates a rectangle mark with an x interval encoding and a y encoding.

Creates a rectangle mark with x and y interval encodings.

Creates a rectangle that plots values with x and y.

### Initializers

Creates a rectangle mark for a 3D chart.

Beta

Creates a rectangle mark that plots values on x and has a fixed y interval.

Creates a rectangle mark with a fixed x interval and y encoding.

`init(xStart: CGFloat?, xEnd: CGFloat?, yStart: CGFloat?, yEnd: CGFloat?)`

Creates a rectangle mark with fixed x and y intervals.

Creates a rectangle mark with a y interval encoding and a fixed x interval.

Creates a rectangle mark with an x interval encoding and a fixed y interval.

## Relationships

### Conforms To

- `Chart3DContent`
- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Marks

`struct AreaMark`

Chart content that represents data using the area of one or more regions.

`struct LineMark`

Chart content that represents data using a sequence of connected line segments.

`struct PointMark`

Chart content that represents data using points.

`struct RuleMark`

Chart content that represents data using a single horizontal or vertical rule.

`struct BarMark`

Chart content that represents data using bars.

`struct SectorMark`

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

---

# https://developer.apple.com/documentation/charts/rulemark

- Swift Charts
- RuleMark

Structure

# RuleMark

Chart content that represents data using a single horizontal or vertical rule.

@MainActor @preconcurrency
struct RuleMark

## Overview

You can use `RuleMark` to plot a horizontal or vertical rule in your chart.

### Show Range with Rule Marks

To create a horizontal line at a `y` position from `xStart` to `xEnd` you use the `init(xStart:xEnd:y:)` or `init(xStart:xEnd:y:)`. To create a vertical line at an `x` position from `yStart` to `yEnd` you use `init(x:yStart:yEnd:)` or `init(x:yStart:yEnd:)`. The example below uses the `Pollen` structure and the `init(xStart:xEnd:y:)` to map horizontal lines that span from the value of the `startDate` to the value of the `endDate` for x positions to a pollen `source` property’s y position:

struct Pollen {
var source: String
var startDate: Date
var endDate: Date

init(startMonth: Int, numMonths: Int, source: String) {
self.source = source
let calendar = Calendar.autoupdatingCurrent
self.startDate = calendar.date(from: DateComponents(year: 2020, month: startMonth, day: 1))!
self.endDate = calendar.date(byAdding: .month, value: numMonths, to: startDate)!
}
}

var data: [Pollen] = [\
Pollen(startMonth: 1, numMonths: 9, source: "Trees"),\
Pollen(startMonth: 12, numMonths: 1, source: "Trees"),\
Pollen(startMonth: 3, numMonths: 8, source: "Grass"),\
Pollen(startMonth: 4, numMonths: 8, source: "Weeds")\
]

var body: some View {
Chart(data) {
RuleMark(
xStart: .value("Start Date", $0.startDate),
xEnd: .value("End Date", $0.endDate),
y: .value("Pollen Source", $0.source)
)
}
}

### Annotate a chart with rule mark

You can annotate a chart with horizontal or vertically spanning rules. This allows viewers to easily compare values over a range to a constant value. Use the `init(xStart:xEnd:y:)` initializer to represent a constant `y` value or `init(x:yStart:yEnd:)` for a constant `x` value. To span the plotting area of a chart with a line, omit the optional start and end parameters and plot a constant value. The example below results in a line that spans the chart horizontally at the y position of 9000:

struct DepartmentProfit {
var department: String
var profit: Double
}

var data: [DepartmentProfit] = [\
DepartmentProfit(department: "Production", profit: 15000),\
DepartmentProfit(department: "Marketing", profit: 8000),\
DepartmentProfit(department: "Finance", profit: 10000)\
]

var body: some View {
Chart
ForEach(data) {
BarMark(
x: .value("Department", $0.department),
y: .value("Profit", $0.profit)
)
}
RuleMark(y: .value("Break Even Threshold", 9000))
.foregroundStyle(.red)
}
}

### RuleMark in Chart3D

To plot a rule in a 3D chart, use the `init(x:y:z:)` initializer.

The rule extends along the axis that you provide a range for, and is positioned at the single points you specify for the other two axes.

For example, the following `Chart3D` shows three rule marks. Each mark extends along one axis and is fixed at `0` on the other two.

Chart3D {
// A rule that extends along the x-axis
RuleMark(
x: .value("x", -0.5..<0.5),
y: .value("y", 0),
z: .value("z", 0)
)
.foregroundStyle(.red)

// A rule that extends along the y-axis
RuleMark(
x: .value("x", 0),
y: .value("y", -0.5..<0.5),
z: .value("z", 0)
)
.foregroundStyle(.green)

// A rule that extends along the z-axis
RuleMark(
x: .value("x", 0),
y: .value("y", 0),
z: .value("z", -0.5..<0.5)
)
.foregroundStyle(.blue)
}

## Topics

### Initializers

Creates a horizontal or vertical rule mark for a 3D chart.

Beta

Creates a vertical rule mark with an x encoding and y interval encoding.

Creates a vertical rule mark with value plotted with x.

Creates a vertical rule mark with a fixed x position and y interval encoding.

Creates a horizontal rule mark that plots values on its x interval and on y.

Creates a horizontal rule mark that plots a value on y.

Creates a horizontal rule mark that plots values on its x interval.

## Relationships

### Conforms To

- `Chart3DContent`
- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Marks

`struct AreaMark`

Chart content that represents data using the area of one or more regions.

`struct LineMark`

Chart content that represents data using a sequence of connected line segments.

`struct PointMark`

Chart content that represents data using points.

`struct RectangleMark`

Chart content that represents data using rectangles.

`struct BarMark`

Chart content that represents data using bars.

`struct SectorMark`

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

---

# https://developer.apple.com/documentation/charts/barmark

- Swift Charts
- BarMark

Structure

# BarMark

Chart content that represents data using bars.

@MainActor @preconcurrency
struct BarMark

## Mentioned in

Creating a chart using Swift Charts

## Overview

You can create different kinds of bar charts using the `BarMark` chart content. To create a simple vertical bar chart that plots categories with x positions and numbers with y positions, use `init(x:y:width:height:stacking:)`. For example, you can display profit by department:

struct Profit {
let department: String
let profit: Double
}

let data: [Profit] = [\
Profit(department: "Production", profit: 15000),\
Profit(department: "Marketing", profit: 8000),\
Profit(department: "Finance", profit: 10000)\
]

var body: some View {
Chart(data) {
BarMark(
x: .value("Department", $0.department),
y: .value("Profit", $0.profit)
)
}
}

Swift Charts provides several other initializers for `BarMark`. Below are a few more examples using them. For a full list of initializers see the topic section.

### Stacked Bar Chart

`BarkMark` automatically stacks content when more than one bar maps to the same location. You can see this if you split the profit data up by category:

struct ProfitByCategory {
let department: String
let profit: Double
let productCategory: String
}

let data: [ProfitByCategory] = [\
ProfitByCategory(department: "Production", profit: 4000, productCategory: "Gizmos"),\
ProfitByCategory(department: "Production", profit: 5000, productCategory: "Gadgets"),\
ProfitByCategory(department: "Production", profit: 6000, productCategory: "Widgets"),\
ProfitByCategory(department: "Marketing", profit: 2000, productCategory: "Gizmos"),\
ProfitByCategory(department: "Marketing", profit: 1000, productCategory: "Gadgets"),\
ProfitByCategory(department: "Marketing", profit: 5000, productCategory: "Widgets"),\
ProfitByCategory(department: "Finance", profit: 2000, productCategory: "Gizmos"),\
ProfitByCategory(department: "Finance", profit: 3000, productCategory: "Gadgets"),\
ProfitByCategory(department: "Finance", profit: 5000, productCategory: "Widgets")\
]

var body: some View {
Chart(data) {
BarMark(
x: .value("Category", $0.department),
y: .value("Profit", $0.profit)
)
}
}

This results in a chart that looks identical to the chart seen in the Overview section because the bars with the same department category are stacked on top of each other. To differentiate the product categories, add a `foregroundStyle(by:)` modifer that specifies a visual encoding for the `productCategory`:

Chart(data) {
BarMark(
x: .value("Category", $0.department),
y: .value("Profit", $0.profit)
)
.foregroundStyle(by: .value("Product Category", $0.productCategory))
}

You can use the optional `stacking:` parameter in the `BarMark` initializer to modify the stacking mechanism. See `MarkStackingMethod` for the stacking options.

### 1D Bar Chart

To build a one dimensional chart, use one of the initializers that only requires a `PlottableValue` for one dimension, like `init(x:yStart:yEnd:width:stacking:)` for plotting with x. The example below reuses the data from the previous example to get the production department values:

Chart(data) { // Get the Production values.
BarMark(
x: .value("Profit", $0.profit)
)
.foregroundStyle(by: .value("Product Category", $0.productCategory))
}

### Interval Bar Chart

Use `BarMark` to represent intervals by using the `init(xStart:xEnd:y:height:)`, `init(xStart:xEnd:y:height:stacking:)`, `init(x:yStart:yEnd:width:)` or `init(x:yStart:yEnd:width:stacking:)`. The example below displays a Gantt chart by plotting the `start` and `end` properties to x positions and the `task` property to y positions:

struct Job {
let job: String
let start: Double
let end: Double
}

let data: [Job] = [\
Job(job: "Job 1", start: 0, end: 15),\
Job(job: "Job 2", start: 5, end: 25),\
Job(job: "Job 1", start: 20, end: 35),\
Job(job: "Job 1", start: 40, end: 55),\
Job(job: "Job 2", start: 30, end: 60),\
Job(job: "Job 2", start: 30, end: 60)\
]

var body: some View {
Chart(data) {
BarMark(
xStart: .value("Start Time", $0.start),
xEnd: .value("End Time", $0.end),
y: .value("Job", $0.job)
)
}
}

## Topics

### Creating a bar mark

Creates a bar mark that plots values with x and its y interval.

Creates a bar mark that plots values with its x interval and y.

Creates a bar mark that plots values with x and y.

Creates a bar mark that plots a value on x with fixed y interval.

Creates a bar mark that plots values on y with fixed x interval.

### Initializers

Creates a bar mark with fixed x interval that plots values with its y interval.

Creates a bar mark that plots values with its x interval and fixed y position.

## Relationships

### Conforms To

- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Marks

`struct AreaMark`

Chart content that represents data using the area of one or more regions.

`struct LineMark`

Chart content that represents data using a sequence of connected line segments.

`struct PointMark`

Chart content that represents data using points.

`struct RectangleMark`

Chart content that represents data using rectangles.

`struct RuleMark`

Chart content that represents data using a single horizontal or vertical rule.

`struct SectorMark`

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

---

# https://developer.apple.com/documentation/charts/sectormark

- Swift Charts
- SectorMark

Structure

# SectorMark

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

@MainActor @preconcurrency
struct SectorMark

## Overview

The relative size of per-category values that make up the total value are mapped to the angular sizes of the sectors.

To ensure that the visualization is easy to read, design pie or donut charts with no more than 5-7 sectors. Sum any remaining values into an “Other” group if necessary, or consider horizontal bar charts, which can scale to many bars, are easy to label with categories, and let users compare items more accurately.

Make sure that your data contains only positive values. Also, very small proportions may not be discernible in the chart, especially if an angular inset is specified.

### Create a pie chart with sector marks

To visualize the ratio of values to the total that they collectively add up to, specify the values, most often ordered by decreasing value. If needed, add an “Other” group as the last item.

let data = [\
(name: "Cachapa", sales: 9631),\
(name: "Crêpe", sales: 6959),\
(name: "Injera", sales: 4891),\
(name: "Jian Bing", sales: 2506),\
(name: "American", sales: 1777),\
(name: "Dosa", sales: 625),\
]

var body: some View {
Chart(data, id: \.name) { name, sales in
SectorMark(angle: .value("Value", sales))
.foregroundStyle(by: .value("Product category", name))
}
}

### Create and style a donut chart with sector marks

The inner and outer radii can be customized for your design. A non-zero inner radius yields a donut chart. A small angular inset helps accessibility and readability by adding contrast between sectors, which is useful for pie and donut charts. Limit the size of the angular inset and corner radius to small values to avoid distorting the shape and relative size of the sectors.

var body: some View {
Chart(data, id: \.name) { name, sales in
SectorMark(
angle: .value("Value", sales),
innerRadius: .ratio(0.618),
outerRadius: .inset(10),
angularInset: 1
)
.cornerRadius(4)
.foregroundStyle(by: .value("Product category", name))
}
}

## Topics

### Initializers

Creates a sector mark, which uses the angular size to represent the proportion of the value to the sum of all values.

## Relationships

### Conforms To

- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Marks

`struct AreaMark`

Chart content that represents data using the area of one or more regions.

`struct LineMark`

Chart content that represents data using a sequence of connected line segments.

`struct PointMark`

Chart content that represents data using points.

`struct RectangleMark`

Chart content that represents data using rectangles.

`struct RuleMark`

Chart content that represents data using a single horizontal or vertical rule.

`struct BarMark`

Chart content that represents data using bars.

---

# https://developer.apple.com/documentation/charts/creating-a-data-visualization-dashboard-with-swift-charts

- Swift Charts
- Creating a data visualization dashboard with Swift Charts

Sample Code

# Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

Download

Xcode 16.0+

## Overview

This sample shows how to visualize a dataset using a variety of chart types including histograms, scatterplots, heatmaps, and more. The sample takes advantage of vectorized plots to enable efficient plotting data of an entire `RandomAccessCollection`, and function plotting to visualize meaningful trends in that data. The app is a dashboard that visualizes large-scale solar photovoltaic facilities in the contiguous United States by consuming data from the U.S. Geological Survey and Lawrence Berkeley National Laboratory.

### Plot entire collections with vectorized plots

The `Scatterplot` view displays a scatterplot that maps the capacity density of each facility by its location. The sample app allows toggling between using longitude or latitude as the basis for location.

The scatterplot uses the `PointPlot` type to plot the data efficiently, enabling a smooth animation in the chart as the underlying data changes.

PointPlot(
data,
x: .value("Longitude", xKeyPath),
y: .value("Capacity density", \.capacityDensity)
)
.foregroundStyle(by: .value("Breakdown", model.breakdownField.keyPath))
.symbolSize(4)

### Visualize data trends with function plotting

The `Scatterplot` view displays a scatterplot that maps the capacity density (the ratio of power-generating capacity to the area) of each facility by its location. The sample applies quadratic regression to the data to generate the regression equation:

let regression = QuadraticRegression(data, x: xKeyPath, y: \.capacityDensity)

The scatterplot uses the `LinePlot` type to draw the regression equation as a trend line on top of the datapoints:

LinePlot(x: "x", y: "y") { x in
regression(x)
}
.foregroundStyle(colorScheme == .dark ? .white : .black)
.lineStyle(.init(lineWidth: colorScheme == .dark ? 1.5 : 1))

### Add custom shapes to a chart

The `ThematicMap` view displays a chart that shows the datapoints in an outline of a map of the contiguous United States.

The sample uses `LinePlot` to draw the outline of a simple thematic map, connecting longitude and latitude points of the federal borders of the contiguous United States:

LinePlot(
contiguousUSABorderCoordinates,
x: .value("Longitude", \.mapProjection.x),
y: .value("Latitude", \.mapProjection.y)
)
.interpolationMethod(.catmullRom)
.lineStyle(.init(lineWidth: 1, lineCap: .round, lineJoin: .round))
.foregroundStyle(.gray)

The sample uses `PointPlot` to plot the location of each facility on the thematic map, using color to distinguish categorical data. The point size correlates with each facility’s capacity:

PointPlot(
model.filteredData,
x: .value("Longitude", \.mapProjection.x),
y: .value("Latitude", \.mapProjection.y)
)
.symbolSize(by: .value("Capacity", \.capacityDC))
.foregroundStyle(by: .value("Breakdown", model.breakdownField.keyPath))

## See Also

### Vectorized plots

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

---

# https://developer.apple.com/documentation/charts/areaplot

- Swift Charts
- AreaPlot

Structure

# AreaPlot

Chart content that represents a function or a collection of data using the area of one or more regions.

## Overview

Use `AreaPlot` when you want to visualize data in the same way as with `AreaMark`, but you want to plot a function or visualize an entire data collection with a single plot.

### Plotting areas from a collection

You can initialize and style the plot with simple values or key paths. Add modifiers with `KeyPath` before adding modifiers with simple values.

Chart {
AreaPlot(
portfolioElements,
x: .value("Date", \.date),
y: .value("Asset value", \.assetValue),
series: .value("Asset", \.asset),
stacking: .standard
)
.foregroundStyle(by: .value("Asset", \.asset))
}

### Plotting functions

In addition to providing data points, you can provide a function to an `AreaPlot` to plot a function. For example, you can plot the area between y = x and y = x^2 - 1 with:

Chart {
AreaPlot(x: "x", yStart: "x", yEnd: "x^2 - 1") { x in (yStart: x, yEnd: x * x - 1) }
}
.chartXScale(domain: -2 ... 2)
.chartYScale(domain: -4 ... 4)

You can also provide a single function to an `AreaPlot`. In this case it will plot the area between zero and the given function.

Chart {
AreaPlot(x: "x", y: "x^2 - 1") { x in x * x - 1 }
}
.chartXScale(domain: -2 ... 2)
.chartYScale(domain: -4 ... 4)

## Topics

### Supporting types

`struct VectorizedAreaPlotContent`

An opaque vectorized chart content type.

`struct FunctionAreaPlotContent`

### Initializers

Creates a mark that fills the area between zero and the given function.

Creates a mark that fills the area between two functions (yStart, yEnd) = f(x).

## Relationships

### Conforms To

- `ChartContent`
Conforms when `Content` conforms to `ChartContent`.

- `Copyable`
- `VectorizedChartContent`
Conforms when `Content` conforms to `VectorizedChartContent`.

## See Also

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

---

# https://developer.apple.com/documentation/charts/lineplot

- Swift Charts
- LinePlot

Structure

# LinePlot

Chart content that represents a function or a collection of data using a sequence of connected line segments.

## Overview

Use `LinePlot` when you want to visualize data in the same way as with `LineMark`, but you want to plot a function or visualize an entire data collection with a single plot.

### Plotting lines from a collection

You can initialize and style the plot with simple values or key paths. Add modifiers with `KeyPath` before adding modifiers with simple values.

Chart {
LinePlot(
stocks,
x: .value("Date", \.date),
y: .value("Price", \.price),
series: .value("Asset", \.symbol)
)
.foregroundStyle(by: .value("Asset", \.symbol))
}

### Plotting functions

In addition to providing data points, you can provide a function to a `LinePlot` to plot a function. For example, you can plot the function y = x^2 with:

Chart {
LinePlot(x: "x", y: "y") { x in x * x }
}
.chartXScale(-10 ... 10)
.chartYScale(-10 ... 10)

You can add multiple function plots in a chart and use different foreground styles to distinguish among them.

Chart {
LinePlot(x: "x", y: "y = sin(x)") { sin($0) }
.foregroundStyle(by: .value("expression", "y=sin(x)"))
.lineStyle(StrokeStyle(lineWidth: 5, lineCap: .round))
.opacity(0.8)

LinePlot(x: "x", y: "y = cos(x)") { cos($0) }
.foregroundStyle(by: .value("expression", "y=cos(x)")
.lineStyle(StrokeStyle(lineWidth: 5, lineCap: .round))
.opacity(0.8)
}
.chartXScale(-10 ... 10)
.chartYScale(-10 ... 10)

You can plot a parametric function with the constructor with `x`, `y`, and `t`:

Chart {
LinePlot(x: "x", y: "y", t: "t", domain: 0 ... .pi * 2) {
t in (x: 10 * cos(5 * t) * cos(t), y: 10 * cos(5 * t) * sin(t))
}
}
.chartXScale(domain: -10 ... 10)
.chartYScale(domain: -10 ... 10)

## Topics

### Supporting types

`struct VectorizedLinePlotContent`

An opaque vectorized chart content type.

`struct FunctionLinePlotContent`

### Initializers

Creates a mark that graphs a function y = f(x).

Creates a mark that graphs a parametric function (x, y) = f(t).

## Relationships

### Conforms To

- `ChartContent`
Conforms when `Content` conforms to `ChartContent`.

- `Copyable`
- `VectorizedChartContent`
Conforms when `Content` conforms to `VectorizedChartContent`.

## See Also

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

---

# https://developer.apple.com/documentation/charts/pointplot

- Swift Charts
- PointPlot

Structure

# PointPlot

Chart content that represents a collection of data using points.

## Overview

Use `PointPlot` when you want to visualize data in the same way as with `PointMark`, but you want to visualize an entire data collection with a single plot.

You can initialize and style the plot with simple values or key paths. Add modifiers with `KeyPath` before adding modifiers with simple values.

Chart {
PointPlot(
flightDelays,
x: .value("Flight Distance", \.distance),
y: .value("Flight Delay", \.delay)
)
.foregroundStyle(by: .value("Airline", \.airline))
.opacity(\.opacity)
.symbolSize(by: .value("Capacity", \.passengerCount))
.symbol(.circle)
}

## Topics

### Supporting types

`struct VectorizedPointPlotContent`

An opaque vectorized chart content type.

## Relationships

### Conforms To

- `ChartContent`
Conforms when `Content` conforms to `ChartContent`.

- `Copyable`
- `VectorizedChartContent`
Conforms when `Content` conforms to `VectorizedChartContent`.

## See Also

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

---

# https://developer.apple.com/documentation/charts/rectangleplot

- Swift Charts
- RectanglePlot

Structure

# RectanglePlot

Chart content that represents a collection of data using rectangles.

## Overview

Use `RectanglePlot` when you want to visualize data in the same way as with `RectangleMark`, but you want to visualize an entire data collection with a single plot.

You can initialize and style the plot with simple values or key paths. Add modifiers with `KeyPath` before adding modifiers with simple values.

Chart {
RectanglePlot(
tasks,
x: .value("Time", \.startTime, \.endTime),
y: .value("Project", \.project)
)
.foregroundStyle(by: .value("Status", \.status))
.cornerRadius(4)
}

## Topics

### Supporting types

`struct VectorizedRectanglePlotContent`

An opaque vectorized chart content type.

## Relationships

### Conforms To

- `ChartContent`
Conforms when `Content` conforms to `ChartContent`.

- `Copyable`
- `VectorizedChartContent`
Conforms when `Content` conforms to `VectorizedChartContent`.

## See Also

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

---

# https://developer.apple.com/documentation/charts/ruleplot

- Swift Charts
- RulePlot

Structure

# RulePlot

Chart content that represents a collection of data using a single horizontal or vertical rule.

## Overview

Use `RulePlot` when you want to visualize data in the same way as with `RuleMark`, but you want to visualize an entire data collection with a single plot.

You can initialize and style the plot with simple values or key paths. Add modifiers with `KeyPath` before adding modifiers with simple values.

Chart {
RulePlot(
tasks,
xStart: .value("Start time", \.startTime),
xEnd: .value("End time", \.endTime),
y: .value("Project", \.project)
)
.foregroundStyle(by: .value("Status", \.status))
.opacity(\.opacity)
.lineStyle(StrokeStyle(lineWidth: 8, lineCap: .round))
}

## Topics

### Supporting types

`struct VectorizedRulePlotContent`

An opaque vectorized chart content type.

## Relationships

### Conforms To

- `ChartContent`
Conforms when `Content` conforms to `ChartContent`.

- `Copyable`
- `VectorizedChartContent`
Conforms when `Content` conforms to `VectorizedChartContent`.

## See Also

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

---

# https://developer.apple.com/documentation/charts/barplot

- Swift Charts
- BarPlot

Structure

# BarPlot

Chart content that represents a collection of data using bars.

## Overview

Use `BarPlot` when you want to visualize data in the same way as with `BarMark`, but you want to visualize an entire data collection with a single plot.

You can initialize and style the plot with simple values or key paths. Add modifiers with `KeyPath` before adding modifiers with simple values.

BarPlot(
votes,
x: .value("Party", \.party),
y: .value("Vote count", \.voteCount)
)
.foregroundStyle(by: \.partyShapeStyle)
.cornerRadius(4)

## Topics

### Supporting types

`struct VectorizedBarPlotContent`

An opaque vectorized chart content type.

## Relationships

### Conforms To

- `ChartContent`
Conforms when `Content` conforms to `ChartContent`.

- `Copyable`
- `VectorizedChartContent`
Conforms when `Content` conforms to `VectorizedChartContent`.

## See Also

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

---

# https://developer.apple.com/documentation/charts/sectorplot

- Swift Charts
- SectorPlot

Structure

# SectorPlot

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

## Overview

Use `SectorPlot` when you want to visualize data in the same way as with `SectorMark`, but you want to visualize an entire data collection with a single plot.

You can initialize and style the plot with simple values or key paths. Add modifiers with `KeyPath` before adding modifiers with simple values.

SectorPlot(
votes,
angle: .value("Vote count", \.voteCount),
angularInset: 1
)
.foregroundStyle(by: .value("Party", \.party))
.cornerRadius(4)

## Topics

### Supporting types

`struct VectorizedSectorPlotContent`

An opaque vectorized chart content type.

## Relationships

### Conforms To

- `ChartContent`
Conforms when `Content` conforms to `ChartContent`.

- `Copyable`
- `VectorizedChartContent`
Conforms when `Content` conforms to `VectorizedChartContent`.

## See Also

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

---

# https://developer.apple.com/documentation/charts/vectorizedchartcontent

- Swift Charts
- VectorizedChartContent

Protocol

# VectorizedChartContent

A generic type that represents content conveyed via a chart.

## Overview

Its primary associated type represents the data element, sometimes called _data point_, _observation_ or _aggregate_.

Usually, `DataElement` has properties to determine visual attributes directly, or indirectly by encoding `Plottable` values through a chart scale.

## Topics

### Styling marks

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/foregroundstyle(_:))

Represents data using a foreground style.

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/opacity(_:))

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/linestyle(_:))

Represents data using line styles.

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/position(by:axis:span:))

### Setting symbol appearance

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/symbol(by:))

Represents data using different kinds of symbols.

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/symbolsize(_:)-12tl1)

Sets the plotting symbol size for the chart content.

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/symbolsize(_:)-3nwop)

Sets the plotting symbol size for the chart content according to a perceived area.

### Encoding data into mark characteristics

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/foregroundstyle(by:))

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/linestyle(by:))

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/symbolsize(by:))

Represents data using symbol sizes.

### Configuring accessibility

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/accessibilityhidden(_:))

Specifies whether to hide this chart content from system accessibility features.

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/accessibilityidentifier(_:))

Adds an identifier string to the chart content.

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/accessibilitylabel(_:)-8zoay)

Adds a label to the chart content that describes its contents.

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/accessibilityvalue(_:)-2rv8b)

Adds a description of the value that the chart content contains.

### Supporting types

`struct PlottableProjection`

### Associated Types

`associatedtype DataElement`

**Required**

### Instance Methods

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/accessibilitylabel(_:)-46jbt)

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/accessibilitylabel(_:)-5r0pw)

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/accessibilityvalue(_:)-3dei8)

`](https://developer.apple.com/documentation/charts/vectorizedchartcontent/accessibilityvalue(_:)-pylk)

## Relationships

### Inherits From

- `ChartContent`

### Conforming Types

- `AreaPlot`
Conforms when `Content` conforms to `VectorizedChartContent`.

- `BarPlot`
Conforms when `Content` conforms to `VectorizedChartContent`.

- `LinePlot`
Conforms when `Content` conforms to `VectorizedChartContent`.

- `PointPlot`
Conforms when `Content` conforms to `VectorizedChartContent`.

- `RectanglePlot`
Conforms when `Content` conforms to `VectorizedChartContent`.

- `RulePlot`
Conforms when `Content` conforms to `VectorizedChartContent`.

- `SectorPlot`
Conforms when `Content` conforms to `VectorizedChartContent`.

- `VectorizedAreaPlotContent`
- `VectorizedBarPlotContent`
- `VectorizedLinePlotContent`
- `VectorizedPointPlotContent`
- `VectorizedRectanglePlotContent`
- `VectorizedRulePlotContent`
- `VectorizedSectorPlotContent`

## See Also

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

---

# https://developer.apple.com/documentation/charts/markstackingmethod

- Swift Charts
- MarkStackingMethod

Structure

# MarkStackingMethod

The ways in which you can stack marks in a chart.

@frozen
struct MarkStackingMethod

## Topics

### Type Properties

`static var center: MarkStackingMethod`

Stack marks using a center offset.

`static var normalized: MarkStackingMethod`

Create normalized stacked bar and area charts.

`static var standard: MarkStackingMethod`

Stack marks starting at zero.

`static var unstacked: MarkStackingMethod`

Don’t stack marks.

## Relationships

### Conforms To

- `BitwiseCopyable`
- `Copyable`
- `CustomStringConvertible`
- `Equatable`
- `Sendable`
- `SendableMetatype`

## See Also

### Mark configuration

`struct MarkDimension`

An individual dimension representing a mark’s width or height.

`struct InterpolationMethod`

The ways in which line or area marks interpolate their data.

`struct BasicChartSymbolShape`

A basic chart symbol shape.

`protocol ChartSymbolShape`

A type that can act as a shape for the marks that you add to a chart.

`struct AnyChartSymbolShape`

A type-erased plotting shape.

---

# https://developer.apple.com/documentation/charts/markdimension

- Swift Charts
- MarkDimension

Structure

# MarkDimension

An individual dimension representing a mark’s width or height.

@frozen
struct MarkDimension

## Topics

### Supporting types

`struct MarkDimensions`

### Initializers

`init(floatLiteral: Double)`

Creates a constant width or height from a floating point value.

`init(integerLiteral: Int)`

Creates a constant width or height from an integer.

### Type Properties

`static var automatic: MarkDimension`

A dimension that determines its value automatically.

### Type Methods

A constant dimension.

A dimension that’s the step size minus the specified inset value on each side.

A dimension that’s proportional to the scale step size, using the specified ratio.

## Relationships

### Conforms To

- `BitwiseCopyable`
- `Copyable`
- `CustomStringConvertible`
- `ExpressibleByFloatLiteral`
- `ExpressibleByIntegerLiteral`
- `Sendable`
- `SendableMetatype`

## See Also

### Mark configuration

`struct MarkStackingMethod`

The ways in which you can stack marks in a chart.

`struct InterpolationMethod`

The ways in which line or area marks interpolate their data.

`struct BasicChartSymbolShape`

A basic chart symbol shape.

`protocol ChartSymbolShape`

A type that can act as a shape for the marks that you add to a chart.

`struct AnyChartSymbolShape`

A type-erased plotting shape.

---

# https://developer.apple.com/documentation/charts/interpolationmethod

- Swift Charts
- InterpolationMethod

Structure

# InterpolationMethod

The ways in which line or area marks interpolate their data.

@frozen
struct InterpolationMethod

## Topics

### Type Properties

`static var cardinal: InterpolationMethod`

Interpolate data points with cardinal spline.

`static var catmullRom: InterpolationMethod`

Interpolate data points with Catmull-Rom spline.

`static var linear: InterpolationMethod`

Interpolate data points linearly.

`static var monotone: InterpolationMethod`

Interpolate data points with a cubic spline that preserves monotonicity of the data.

`static var stepCenter: InterpolationMethod`

Interpolate data points with a step, or piece-wise constant function, where the data point is at the center of the step.

`static var stepEnd: InterpolationMethod`

Interpolate data points with a step, or piece-wise constant function, where the data point is at the end of the step.

`static var stepStart: InterpolationMethod`

Interpolate data points with a step, or piece-wise constant function, where the data point is at the start of the step.

### Type Methods

Interpolate data points with cardinal spline, using the given tension parameter.

Interpolate data points with Catmull-Rom spline, using the given alpha parameter.

## Relationships

### Conforms To

- `BitwiseCopyable`
- `Copyable`
- `CustomStringConvertible`
- `Sendable`
- `SendableMetatype`

## See Also

### Mark configuration

`struct MarkStackingMethod`

The ways in which you can stack marks in a chart.

`struct MarkDimension`

An individual dimension representing a mark’s width or height.

`struct BasicChartSymbolShape`

A basic chart symbol shape.

`protocol ChartSymbolShape`

A type that can act as a shape for the marks that you add to a chart.

`struct AnyChartSymbolShape`

A type-erased plotting shape.

---

# https://developer.apple.com/documentation/charts/basicchartsymbolshape

- Swift Charts
- BasicChartSymbolShape

Structure

# BasicChartSymbolShape

A basic chart symbol shape.

struct BasicChartSymbolShape

## Topics

### Instance Methods

Creates a stroked symbol shape by inner-stroking the basic symbol shape.

## Relationships

### Conforms To

- `Animatable`
- `ChartSymbolShape`
- `Sendable`
- `SendableMetatype`
- `Shape`
- `View`

## See Also

### Mark configuration

`struct MarkStackingMethod`

The ways in which you can stack marks in a chart.

`struct MarkDimension`

An individual dimension representing a mark’s width or height.

`struct InterpolationMethod`

The ways in which line or area marks interpolate their data.

`protocol ChartSymbolShape`

A type that can act as a shape for the marks that you add to a chart.

`struct AnyChartSymbolShape`

A type-erased plotting shape.

---

# https://developer.apple.com/documentation/charts/chartsymbolshape

- Swift Charts
- ChartSymbolShape

Protocol

# ChartSymbolShape

A type that can act as a shape for the marks that you add to a chart.

protocol ChartSymbolShape : Shape

## Topics

### Instance Properties

`var perceptualUnitRect: CGRect`

Returns a rectangle that bounds the shape in such a way that viewers perceive it as having the same size and position as a unit rectangle.

**Required**

### Type Properties

`static var asterisk: BasicChartSymbolShape`

Asterisk symbol.

`static var circle: BasicChartSymbolShape`

Circle symbol.

`static var cross: BasicChartSymbolShape`

Cross symbol.

`static var diamond: BasicChartSymbolShape`

Diamond symbol.

`static var pentagon: BasicChartSymbolShape`

Pentagon symbol.

`static var plus: BasicChartSymbolShape`

Plus symbol.

`static var square: BasicChartSymbolShape`

Square symbol.

`static var triangle: BasicChartSymbolShape`

Triangle symbol.

## Relationships

### Inherits From

- `Animatable`
- `Sendable`
- `SendableMetatype`
- `Shape`
- `View`

### Conforming Types

- `AnyChartSymbolShape`
- `BasicChartSymbolShape`

## See Also

### Mark configuration

`struct MarkStackingMethod`

The ways in which you can stack marks in a chart.

`struct MarkDimension`

An individual dimension representing a mark’s width or height.

`struct InterpolationMethod`

The ways in which line or area marks interpolate their data.

`struct BasicChartSymbolShape`

A basic chart symbol shape.

`struct AnyChartSymbolShape`

A type-erased plotting shape.

---

# https://developer.apple.com/documentation/charts/anychartsymbolshape

- Swift Charts
- AnyChartSymbolShape

Structure

# AnyChartSymbolShape

A type-erased plotting shape.

@frozen
struct AnyChartSymbolShape

## Topics

### Initializers

`init(any ChartSymbolShape)`

## Relationships

### Conforms To

- `Animatable`
- `ChartSymbolShape`
- `Sendable`
- `SendableMetatype`
- `Shape`
- `View`

## See Also

### Mark configuration

`struct MarkStackingMethod`

The ways in which you can stack marks in a chart.

`struct MarkDimension`

An individual dimension representing a mark’s width or height.

`struct InterpolationMethod`

The ways in which line or area marks interpolate their data.

`struct BasicChartSymbolShape`

A basic chart symbol shape.

`protocol ChartSymbolShape`

A type that can act as a shape for the marks that you add to a chart.

---

# https://developer.apple.com/documentation/charts/plottablevalue

- Swift Charts
- PlottableValue

Structure

# PlottableValue

Labeled data that you plot in a chart using marks.

## Overview

Provide a `PlottableValue` to a `Mark` property (e.g., x, y, foregroundStyle) to plot data values with the mark property.

You can use the `.value("Category", \.category)` shorthand to create a `PlottableValue`. The example below plots category, value, and group with the bar mark’s x, y, and foregroundStyle.

struct Bar {
let category: String
let value: Double
let group: String
}

let data: [Bar] = [\
Bar(category: "A", value: 20, group: "Group 1"),\
Bar(category: "A", value: 30, group: "Group 2"),\
Bar(category: "A", value: 10, group: "Group 3"),\
Bar(category: "B", value: 40, group: "Group 1"),\
Bar(category: "B", value: 20, group: "Group 2"),\
Bar(category: "B", value: 10, group: "Group 3"),\
//...\
]

var body: some View {
Chart(data) {
BarMark(
x: .value("Category", $0.category),
y: .value("Quantity", $0.value)
)
.foregroundStyle(.value("Group", $0.group))
}
}

## Topics

### Type Methods

Creates a parameter value with label and value.

Creates a parameter value with label key and value.

## See Also

### Labeled data

`protocol Plottable`

A type that can serve as data to plot in a chart.

---

# https://developer.apple.com/documentation/charts/plottable

- Swift Charts
- Plottable

Protocol

# Plottable

A type that can serve as data to plot in a chart.

protocol Plottable

## Overview

You create `PlottableValue` items from data that conforms to `Plottable` using a method like `value(_:_:)`. You then use those items as the values in a chart, like for the `BarMark` chart in the following example:

BarMark(
x: .value("Category", "A")
y: .value("Value", 100)
)
.foregroundStyle(by: .value("Series", "Series 1"))

You can create a custom plottable type by conforming it to this protocol. For example:

// Make `SomeValue` conform to `Plottable` and act as a categorical value in Swift Charts.
struct SomeValue: Plottable {
var primitivePlottable: String { ... }
init?(primitivePlottable: String) { ... }
}

In addition, you can make an enum work as a categorical data value by using `String` as its raw value and conforming the type to Plottable. The string values will be used as localized string keys when the categories are displayed as text in a chart (for example, on an axis).

enum Status: String, Plottable {
case active = "Active"
case inactive = "Inactive"
}

## Topics

### Supporting types

`protocol PrimitivePlottableProtocol`

A type that represents the primitive plottable types supported by the framework. Don’t use this type directly.

### Associated Types

`associatedtype PrimitivePlottable : PrimitivePlottableProtocol`

A primitive plottable type.

**Required**

### Initializers

`init?(primitivePlottable: Self.PrimitivePlottable)`

Creates the plottable value for the underlying type, if any, that corresponds to the primitive plottable value.

**Required** Default implementations provided.

### Instance Properties

`var primitivePlottable: Self.PrimitivePlottable`

The primitive plottable value that corresponds to the plottable value of the underlying type.

## Relationships

### Inherited By

- `PrimitivePlottableProtocol`

## See Also

### Labeled data

`struct PlottableValue`

Labeled data that you plot in a chart using marks.

---

# https://developer.apple.com/documentation/charts/scalerange

- Swift Charts
- ScaleRange

Protocol

# ScaleRange

A type that you can use to configure the range of a chart.

protocol ScaleRange

## Topics

### Associated Types

`associatedtype VisualValue`

**Required**

## Relationships

### Inherited By

- `PositionScaleRange`

### Conforming Types

- `PlotDimensionScaleRange`

## See Also

### Scales

`protocol PositionScaleRange`

A type that configures the x-axis and y-axis values.

`struct PlotDimensionScaleRange`

A range that represents the plot area’s width or height.

`protocol ScaleDomain`

A type that you can use to configure the domain of a chart.

`struct AutomaticScaleDomain`

A domain that the chart infers from its data.

`struct ScaleType`

The ways you can scale the domain or range of a plot.

---

# https://developer.apple.com/documentation/charts/positionscalerange

- Swift Charts
- PositionScaleRange

Protocol

# PositionScaleRange

A type that configures the x-axis and y-axis values.

protocol PositionScaleRange : ScaleRange where Self.VisualValue == CGFloat

## Topics

### Type Properties

`static var plotDimension: PlotDimensionScaleRange`

A scale range that fills the plot area.

### Type Methods

A scale range that fills the plot area with the given padding value at start and end.

A scale range that fills the plot area with the given padding values at start and end, respectively.

## Relationships

### Inherits From

- `ScaleRange`

### Conforming Types

- `PlotDimensionScaleRange`

## See Also

### Scales

`protocol ScaleRange`

A type that you can use to configure the range of a chart.

`struct PlotDimensionScaleRange`

A range that represents the plot area’s width or height.

`protocol ScaleDomain`

A type that you can use to configure the domain of a chart.

`struct AutomaticScaleDomain`

A domain that the chart infers from its data.

`struct ScaleType`

The ways you can scale the domain or range of a plot.

---

# https://developer.apple.com/documentation/charts/plotdimensionscalerange

- Swift Charts
- PlotDimensionScaleRange

Structure

# PlotDimensionScaleRange

A range that represents the plot area’s width or height.

struct PlotDimensionScaleRange

## Relationships

### Conforms To

- `PositionScaleRange`
- `ScaleRange`

## See Also

### Scales

`protocol ScaleRange`

A type that you can use to configure the range of a chart.

`protocol PositionScaleRange`

A type that configures the x-axis and y-axis values.

`protocol ScaleDomain`

A type that you can use to configure the domain of a chart.

`struct AutomaticScaleDomain`

A domain that the chart infers from its data.

`struct ScaleType`

The ways you can scale the domain or range of a plot.

---

# https://developer.apple.com/documentation/charts/scaledomain

- Swift Charts
- ScaleDomain

Protocol

# ScaleDomain

A type that you can use to configure the domain of a chart.

protocol ScaleDomain

## Topics

### Type Properties

`static var automatic: AutomaticScaleDomain`

Creates a scale domain configuration that infers the scale domain from data.

### Type Methods

## Relationships

### Conforming Types

- `AutomaticScaleDomain`

## See Also

### Scales

`protocol ScaleRange`

A type that you can use to configure the range of a chart.

`protocol PositionScaleRange`

A type that configures the x-axis and y-axis values.

`struct PlotDimensionScaleRange`

A range that represents the plot area’s width or height.

`struct AutomaticScaleDomain`

A domain that the chart infers from its data.

`struct ScaleType`

The ways you can scale the domain or range of a plot.

---

# https://developer.apple.com/documentation/charts/automaticscaledomain

- Swift Charts
- AutomaticScaleDomain

Structure

# AutomaticScaleDomain

A domain that the chart infers from its data.

struct AutomaticScaleDomain

## Overview

Use `automatic` to get an instance of this type.

## Relationships

### Conforms To

- `ScaleDomain`

## See Also

### Scales

`protocol ScaleRange`

A type that you can use to configure the range of a chart.

`protocol PositionScaleRange`

A type that configures the x-axis and y-axis values.

`struct PlotDimensionScaleRange`

A range that represents the plot area’s width or height.

`protocol ScaleDomain`

A type that you can use to configure the domain of a chart.

`struct ScaleType`

The ways you can scale the domain or range of a plot.

---

# https://developer.apple.com/documentation/charts/scaletype

- Swift Charts
- ScaleType

Structure

# ScaleType

The ways you can scale the domain or range of a plot.

struct ScaleType

## Overview

Use this type with the `type:` parameter of `.chartXScale` view modifiers to customize scale types.

## Topics

### Type Properties

`static var category: ScaleType`

A scale that has discrete domain values as inputs.

`static var date: ScaleType`

A date scale where each range value y can be expressed as a function of the domain value x’s timestamp, with `y = a * x.timeIntervalSinceReferenceDate + b`.

`static var linear: ScaleType`

A number scale where each range value y can be expressed as a linear function of the domain value x, with `y = a * x + b`.

`static var log: ScaleType`

A number scale where each range value y can be expressed as a logarithmic function of the domain value x, with `y = a * log(x) + b`.

`static var squareRoot: ScaleType`

A number scale where each range value y can be expressed as a square root function of the domain value x, with `y = a * sqrt(x) + b`. This is equivalent to a power scale with exponent 0.5.

`static var symmetricLog: ScaleType`

A number scale where each range value y can be expressed as a symmetric log function of the domain value x, with `y = a * sign(x) * log(1 + |x * slopeAtZero|) + b`. The constant `slopeAtZero` defaults to 1. You can configure it with `symmetricLog(slopeAtZero:)`.

### Type Methods

A number scale where each range value y can be expressed as a power function of the domain value x, with `y = a * pow(x, exponent) + b`.

A number scale where each range value y can be expressed as a symmetric log function of the domain value x, with `y = a * sign(x) * log(1 + |x * slopeAtZero|) + b`.

## See Also

### Scales

`protocol ScaleRange`

A type that you can use to configure the range of a chart.

`protocol PositionScaleRange`

A type that configures the x-axis and y-axis values.

`struct PlotDimensionScaleRange`

A range that represents the plot area’s width or height.

`protocol ScaleDomain`

A type that you can use to configure the domain of a chart.

`struct AutomaticScaleDomain`

A domain that the chart infers from its data.

---

# https://developer.apple.com/documentation/charts/customizing-axes-in-swift-charts

- Swift Charts
- Customizing axes in Swift Charts

Article

# Customizing axes in Swift Charts

Improve the clarity of your chart by configuring the appearance of its axes.

## Overview

Swift Charts automatically configures the axes in your charts based on the data that you specify. Sometimes you can communicate the data more clearly by customizing the axis configuration. For example, you can:

- Specify a range for an axis.

- Choose the specific values — like categories, dates, or numbers — the axes display.

- Set the visual style of grid lines, ticks, or labels that represent each value.

This article demonstrates how to use these features to create the following chart that displays battery levels over the course of a day:

For design guidance about charts and their axes, see the Charts section in the Human Interface Guidelines.

### Start with default axes

Generating a chart using the framework default axis configuration typically provides a good foundation to start from. For example, the following code creates a basic battery chart from an array of data points:

struct BatteryData {
let date: Date
let level: Double

static let data: [BatteryData] = /* Array of BatteryData instances */
}

Chart(BatteryData.data, id: \.date) {
BarMark(
// Create one bar for every 1800 seconds (30 minutes).
x: .value("Time", $0.date ..< $0.date.advanced(by: 1800)),
y: .value("Battery Level", $0.level)
)
.foregroundStyle(.green)
}

The framework chooses a default axis configuration that’s sensible for the data. The data fills the available space without overflowing in any dimension. Both axes have labels that indicate the values that the chart’s content represents. The following chart displays the default axis configuration:

However, given that batteries have a maximum capacity of 100 percent and that people typically charge their phones once per day, you can improve this chart by configuring the axes.

### Set the domain of an axis

Battery levels always fall within a range of 0 to 100 percent. Being able to visually compare a given value against the whole range helps people to better understand how the current battery state compares to a full battery. So it makes sense to fix the range of the y-axis to the full possible range, regardless of the range of the data in the current data set.

Set a range for the y-axis using the `chartYScale(domain:type:)` view modifier:

.chartYScale(domain: [0, 100])

### Specify axis values

Swift Charts chooses a default number of grid lines and labels to display on each axis. You can specify a different number of values by using the `chartYAxis(content:)` modifier, which takes one or more `AxisMarks` instances in its `content` parameter. Request a specific number of values by initializing the axis marks instance with the `automatic(desiredCount:roundLowerBound:roundUpperBound:)` value. For example, you can request that the axis have three values:

.chartYAxis {
AxisMarks(values: .automatic(desiredCount: 3))
}

For the battery chart, this creates labels at `0`, `50`, and `100`:

Alternatively, you can indicate exact values to mark on the axis using an array of values:

.chartYAxis {
AxisMarks(values: [0, 50, 100])
}

### Format values

You can add clarity to any chart by properly formatting its axis values. The values on the y-axis in the battery chart represent percentages, so you can pass the `format` parameter to the axis marks initializer to apply an appropriate formatting:

.chartYAxis {
AxisMarks(
format: Decimal.FormatStyle.Percent.percent.scale(1),
values: [0, 50, 100]
)
}

### Compose axis marks

To add more complex styling, compose axis marks inside the modifier’s `content` closure. For example, to add more horizontal grid lines without adding more labels, use two separate `AxisMarks` instances to render the grid lines and labels separately:

.chartYAxis {
AxisMarks(
values: [0, 50, 100]
) {
AxisValueLabel(format: Decimal.FormatStyle.Percent.percent.scale(1))
}

AxisMarks(
values: [0, 25, 50, 75, 100]
) {
AxisGridLine()
}
}

The `AxisMarks` initializers in the above code each take a `content` parameter that’s an axis builder indicating which elements the marks apply to. Use the builder to compose `AxisGridLine`, `AxisTick`, and `AxisValueLabel` elements. The above example renders grid lines at `0`, `25`, `50`, `75`, and `100`, but places labels only at `0`, `50`, and `100`:

For additional customization, apply the styling methods that `AxisMark` provides. For example, you can adjust the font of the value labels by applying the `font(_:)` method to the `AxisValueLabel` instance.

### Conditionally format labels

For the specified data, the battery chart marks every sixth hour along the x-axis and includes the AM or PM indicator with each hour by default. You can make the chart more readable by including a mark every three hours, and displaying the AM or PM indicator only when it changes.

Use the `chartXAxis(content:)` view modifier to configure the x-axis, much like you use the `chartYAxis(content:)` modifier for the y-axis. The following code passes a `stride(by:count:roundLowerBound:roundUpperBound:calendar:)` value to an `AxisMarks` instance to control the frequency of marks, and uses conditional formatting to show AM or PM only at noon and midnight:

.chartXAxis {
AxisMarks(values: .stride(by: .hour, count: 3)) { value in
if let date = value.as(Date.self) {
let hour = Calendar.current.component(.hour, from: date)
switch hour {
case 0, 12:
AxisValueLabel(format: .dateTime.hour())
default:
AxisValueLabel(format: .dateTime.hour(.defaultDigits(amPM: .omitted)))
}

AxisGridLine()
AxisTick()
}
}

### Style grid lines and ticks

You can provide people reading this chart with additional context by displaying the date below the first value label and for subsequent labels where the date changes. Create a stack of text views in the `AxisValueLabel` builder, and use the value’s index combined with the hour to conditionally display the date:

.chartXAxis {
AxisMarks(values: .stride(by: .hour, count: 3)) { value in
if let date = value.as(Date.self) {
let hour = Calendar.current.component(.hour, from: date)
AxisValueLabel {
VStack(alignment: .leading) {
switch hour {
case 0, 12:
Text(date, format: .dateTime.hour())
default:
Text(date, format: .dateTime.hour(.defaultDigits(amPM: .omitted)))
}
if value.index == 0 || hour == 0 {
Text(date, format: .dateTime.month().day())
}
}
}

if hour == 0 {
AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
AxisTick(stroke: StrokeStyle(lineWidth: 0.5))
} else {
AxisGridLine()
AxisTick()
}
}
}
}

The above code also helps to clarify the date boundaries by using a solid grid line and tick at midnight, including at both the beginning and end of the chart:

Compare this chart with the one at the beginning of this article that uses the default axis configuration.

## See Also

### Axes

`struct ChartAxisContent`

A view that represents a chart’s axis.

`protocol AxisContent`

A type that represents the elements you use to build a chart’s axes.

`struct AxisMarks`

A group of visual marks that a chart draws to indicate the composition of a chart’s axes.

`struct AnyAxisContent`

A type-erased element of a chart’s axis.

`struct AxisContentBuilder`

A result builder that constructs axis content.

---

# https://developer.apple.com/documentation/charts/chartaxiscontent

- Swift Charts
- ChartAxisContent

Structure

# ChartAxisContent

A view that represents a chart’s axis.

@MainActor @preconcurrency
struct ChartAxisContent

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Axes

Customizing axes in Swift Charts

Improve the clarity of your chart by configuring the appearance of its axes.

`protocol AxisContent`

A type that represents the elements you use to build a chart’s axes.

`struct AxisMarks`

A group of visual marks that a chart draws to indicate the composition of a chart’s axes.

`struct AnyAxisContent`

A type-erased element of a chart’s axis.

`struct AxisContentBuilder`

A result builder that constructs axis content.

---

# https://developer.apple.com/documentation/charts/axiscontent

- Swift Charts
- AxisContent

Protocol

# AxisContent

A type that represents the elements you use to build a chart’s axes.

protocol AxisContent

## Topics

### Instance Methods

Creates a compositing layer for the axis content.

Creates a compositing layer for the axis content, and apply view modifiers to the compositing layer.

## Relationships

### Conforming Types

- `AnyAxisContent`
- `AxisMarks`
- `BuilderConditional`
Conforms when `TrueContent` conforms to `AxisContent` and `FalseContent` conforms to `AxisContent`.

## See Also

### Axes

Customizing axes in Swift Charts

Improve the clarity of your chart by configuring the appearance of its axes.

`struct ChartAxisContent`

A view that represents a chart’s axis.

`struct AxisMarks`

A group of visual marks that a chart draws to indicate the composition of a chart’s axes.

`struct AnyAxisContent`

A type-erased element of a chart’s axis.

`struct AxisContentBuilder`

A result builder that constructs axis content.

---

# https://developer.apple.com/documentation/charts/axismarks

- Swift Charts
- AxisMarks

Structure

# AxisMarks

A group of visual marks that a chart draws to indicate the composition of a chart’s axes.

## Mentioned in

Customizing axes in Swift Charts

## Topics

### Supporting types

`struct AxisMarkPreset`

Describes preset styles for axis markers.

`struct AxisMarkValues`

Describes the values the axis markers will present (one for each value).

`struct AxisMarkPosition`

Describes the position of axis markers.

### Initializers

Creates axis markers with the given properties, will override default markers. Default content will be used for the axis markers.

Creates axis markers with the given properties, will override default markers.

Creates axis markers with the given properties,will override default markers.

`init(preset: AxisMarkPreset, position: AxisMarkPosition, values: AxisMarkValues, stroke: StrokeStyle?)`

## Relationships

### Conforms To

- `AxisContent`

## See Also

### Axes

Improve the clarity of your chart by configuring the appearance of its axes.

`struct ChartAxisContent`

A view that represents a chart’s axis.

`protocol AxisContent`

A type that represents the elements you use to build a chart’s axes.

`struct AnyAxisContent`

A type-erased element of a chart’s axis.

`struct AxisContentBuilder`

A result builder that constructs axis content.

---

# https://developer.apple.com/documentation/charts/anyaxiscontent

- Swift Charts
- AnyAxisContent

Structure

# AnyAxisContent

A type-erased element of a chart’s axis.

@frozen
struct AnyAxisContent

## Topics

### Initializers

`init(any AxisContent)`

`init(erasing: some AxisContent)`

## Relationships

### Conforms To

- `AxisContent`

## See Also

### Axes

Customizing axes in Swift Charts

Improve the clarity of your chart by configuring the appearance of its axes.

`struct ChartAxisContent`

A view that represents a chart’s axis.

`protocol AxisContent`

A type that represents the elements you use to build a chart’s axes.

`struct AxisMarks`

A group of visual marks that a chart draws to indicate the composition of a chart’s axes.

`struct AxisContentBuilder`

A result builder that constructs axis content.

---

# https://developer.apple.com/documentation/charts/axiscontentbuilder

- Swift Charts
- AxisContentBuilder

Structure

# AxisContentBuilder

A result builder that constructs axis content.

@resultBuilder
struct AxisContentBuilder

## Topics

### Type Methods

Builds a result from a single component.

Builds a result from multiple components.

Provides support for “if-else” statements in multi-statement closures, producing conditional content for the “then” branch.

Provides support for “if-else” statements in multi-statement closures, producing conditional content for the “else” branch.

Provides support for “if” statements in multi-statement closures, producing an optional axis content that is visible only when the condition evaluates to `true`.

Provides support for “if” statements with `#available()` clauses in multi-statement closures, producing conditional content for the “then” branch, i.e. the conditionally-available branch.

## See Also

### Axes

Customizing axes in Swift Charts

Improve the clarity of your chart by configuring the appearance of its axes.

`struct ChartAxisContent`

A view that represents a chart’s axis.

`protocol AxisContent`

A type that represents the elements you use to build a chart’s axes.

`struct AxisMarks`

A group of visual marks that a chart draws to indicate the composition of a chart’s axes.

`struct AnyAxisContent`

A type-erased element of a chart’s axis.

---

# https://developer.apple.com/documentation/charts/axismark

- Swift Charts
- AxisMark

Protocol

# AxisMark

A type that serves as the basic building block for the elements of an axis.

protocol AxisMark

## Mentioned in

Customizing axes in Swift Charts

## Topics

### Instance Methods

Sets the default font for text in this axis content.

Sets the axis content’s foreground elements to use a given style.

## Relationships

### Conforming Types

- `AnyAxisMark`
- `AxisGridLine`
- `AxisTick`
- `AxisValueLabel`
- `BuilderConditional`
Conforms when `TrueContent` conforms to `AxisMark` and `FalseContent` conforms to `AxisMark`.

## See Also

### Axis marks

`struct AxisTick`

A mark that a chart draws on an axis to indicate a reference point along that axis.

`struct AxisGridLine`

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

`struct AxisValueLabel`

A label that describes the value for an axis mark.

`struct AxisValue`

A value for an axis mark.

`struct AnyAxisMark`

A type-erased axis mark.

`struct AxisMarkBuilder`

A result builder that constructs axis marks and overrides default marks.

---

# https://developer.apple.com/documentation/charts/axistick

- Swift Charts
- AxisTick

Structure

# AxisTick

A mark that a chart draws on an axis to indicate a reference point along that axis.

struct AxisTick

## Mentioned in

Customizing axes in Swift Charts

## Topics

### Structures

`struct Length`

Describes the length of a tick.

### Initializers

`init(centered: Bool?, length: CGFloat, stroke: StrokeStyle?)`

Creates an axis tick with the given properties.

`init(centered: Bool?, length: AxisTick.Length, stroke: StrokeStyle?)`

## Relationships

### Conforms To

- `AxisMark`

## See Also

### Axis marks

`protocol AxisMark`

A type that serves as the basic building block for the elements of an axis.

`struct AxisGridLine`

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

`struct AxisValueLabel`

A label that describes the value for an axis mark.

`struct AxisValue`

A value for an axis mark.

`struct AnyAxisMark`

A type-erased axis mark.

`struct AxisMarkBuilder`

A result builder that constructs axis marks and overrides default marks.

---

# https://developer.apple.com/documentation/charts/axisgridline

- Swift Charts
- AxisGridLine

Structure

# AxisGridLine

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

struct AxisGridLine

## Mentioned in

Customizing axes in Swift Charts

## Topics

### Initializers

`init(centered: Bool?, stroke: StrokeStyle?)`

Creates an axis grid line with the given properties.

## Relationships

### Conforms To

- `AxisMark`

## See Also

### Axis marks

`protocol AxisMark`

A type that serves as the basic building block for the elements of an axis.

`struct AxisTick`

A mark that a chart draws on an axis to indicate a reference point along that axis.

`struct AxisValueLabel`

A label that describes the value for an axis mark.

`struct AxisValue`

A value for an axis mark.

`struct AnyAxisMark`

A type-erased axis mark.

`struct AxisMarkBuilder`

A result builder that constructs axis marks and overrides default marks.

---

# https://developer.apple.com/documentation/charts/axisvaluelabel

- Swift Charts
- AxisValueLabel

Structure

# AxisValueLabel

A label that describes the value for an axis mark.

## Mentioned in

Customizing axes in Swift Charts

## Topics

### Supporting types

`struct AxisValueLabelOrientation`

Describes the orientation of a label.

`struct AxisValueLabelCollisionResolution`

### Initializers

`init(LocalizedStringResource, centered: Bool?, anchor: UnitPoint?, multiLabelAlignment: Alignment?, collisionResolution: AxisValueLabelCollisionResolution, offsetsMarks: Bool?, orientation: AxisValueLabelOrientation, horizontalSpacing: CGFloat?, verticalSpacing: CGFloat?)`

Constructs an axis value label with the given properties to display the given string.

`init(LocalizedStringKey, centered: Bool?, anchor: UnitPoint?, multiLabelAlignment: Alignment?, collisionResolution: AxisValueLabelCollisionResolution, offsetsMarks: Bool?, orientation: AxisValueLabelOrientation, horizontalSpacing: CGFloat?, verticalSpacing: CGFloat?)`

`init(centered: Bool?, anchor: UnitPoint?, multiLabelAlignment: Alignment?, collisionResolution: AxisValueLabelCollisionResolution, offsetsMarks: Bool?, orientation: AxisValueLabelOrientation, horizontalSpacing: CGFloat?, verticalSpacing: CGFloat?)`

Constructs axis value labels with the given properties and default text.

Constructs an axis value label with the given properties to display the given content.

## Relationships

### Conforms To

- `AxisMark`

## See Also

### Axis marks

`protocol AxisMark`

A type that serves as the basic building block for the elements of an axis.

`struct AxisTick`

A mark that a chart draws on an axis to indicate a reference point along that axis.

`struct AxisGridLine`

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

`struct AxisValue`

A value for an axis mark.

`struct AnyAxisMark`

A type-erased axis mark.

`struct AxisMarkBuilder`

A result builder that constructs axis marks and overrides default marks.

---

# https://developer.apple.com/documentation/charts/axisvalue

- Swift Charts
- AxisValue

Structure

# AxisValue

A value for an axis mark.

struct AxisValue

## Topics

### Instance Properties

`var count: Int`

The number of values on this axis.

`var index: Int`

The index of the value along the axis.

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`

## See Also

### Axis marks

`protocol AxisMark`

A type that serves as the basic building block for the elements of an axis.

`struct AxisTick`

A mark that a chart draws on an axis to indicate a reference point along that axis.

`struct AxisGridLine`

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

`struct AxisValueLabel`

A label that describes the value for an axis mark.

`struct AnyAxisMark`

A type-erased axis mark.

`struct AxisMarkBuilder`

A result builder that constructs axis marks and overrides default marks.

---

# https://developer.apple.com/documentation/charts/anyaxismark

- Swift Charts
- AnyAxisMark

Structure

# AnyAxisMark

A type-erased axis mark.

@frozen
struct AnyAxisMark

## Topics

### Initializers

`init(any AxisMark)`

`init(erasing: some AxisMark)`

## Relationships

### Conforms To

- `AxisMark`

## See Also

### Axis marks

`protocol AxisMark`

A type that serves as the basic building block for the elements of an axis.

`struct AxisTick`

A mark that a chart draws on an axis to indicate a reference point along that axis.

`struct AxisGridLine`

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

`struct AxisValueLabel`

A label that describes the value for an axis mark.

`struct AxisValue`

A value for an axis mark.

`struct AxisMarkBuilder`

A result builder that constructs axis marks and overrides default marks.

---

# https://developer.apple.com/documentation/charts/axismarkbuilder

- Swift Charts
- AxisMarkBuilder

Structure

# AxisMarkBuilder

A result builder that constructs axis marks and overrides default marks.

@resultBuilder
struct AxisMarkBuilder

## Topics

### Type Methods

Builds a result from a single component.

Builds a result from multiple components.

Provides support for “if-else” statements in multi-statement closures, producing conditional content for the “then” branch.

Provides support for “if-else” statements in multi-statement closures, producing conditional content for the “else” branch.

Provides support for “if” statements in multi-statement closures, producing an optional axis content that is visible only when the condition evaluates to `true`.

Provides support for “if” statements with `#available()` clauses in multi-statement closures, producing conditional content for the “then” branch, i.e. the conditionally-available branch.

## See Also

### Axis marks

`protocol AxisMark`

A type that serves as the basic building block for the elements of an axis.

`struct AxisTick`

A mark that a chart draws on an axis to indicate a reference point along that axis.

`struct AxisGridLine`

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

`struct AxisValueLabel`

A label that describes the value for an axis mark.

`struct AxisValue`

A value for an axis mark.

`struct AnyAxisMark`

A type-erased axis mark.

---

# https://developer.apple.com/documentation/charts/annotationcontext

- Swift Charts
- AnnotationContext

Structure

# AnnotationContext

Information about an item that you add an annotation to.

struct AnnotationContext

## Topics

### Instance Properties

`let targetSize: CGSize`

Gets the bounding box of the items being annotated.

## See Also

### Annotations

`struct AnnotationPosition`

The position of an annotation.

`struct AnnotationOverflowResolution`

---

# https://developer.apple.com/documentation/charts/annotationposition

- Swift Charts
- AnnotationPosition

Structure

# AnnotationPosition

The position of an annotation.

struct AnnotationPosition

## Topics

### Type Properties

`static let automatic: AnnotationPosition`

Place the annotation automatically.

`static let bottom: AnnotationPosition`

Place the annotation on the bottom of the item.

`static let bottomLeading: AnnotationPosition`

Place the annotation on the bottom leading corner of the item.

`static let bottomTrailing: AnnotationPosition`

Place the annotation on the bottom trailing corner of the item.

`static let leading: AnnotationPosition`

Place the annotation on the leading edge of the item.

`static let overlay: AnnotationPosition`

Place the annotation as an overlay of the item.

`static let top: AnnotationPosition`

Place the annotation on the top of the item.

`static let topLeading: AnnotationPosition`

Place the annotation on the top leading corner of the item.

`static let topTrailing: AnnotationPosition`

Place the annotation on the top trailing corner of the item.

`static let trailing: AnnotationPosition`

Place the annotation on the trailing edge of the item.

## Relationships

### Conforms To

- `Equatable`

## See Also

### Annotations

`struct AnnotationContext`

Information about an item that you add an annotation to.

`struct AnnotationOverflowResolution`

---

# https://developer.apple.com/documentation/charts/annotationoverflowresolution

- Swift Charts
- AnnotationOverflowResolution

Structure

# AnnotationOverflowResolution

struct AnnotationOverflowResolution

## Topics

### Structures

`struct Boundary`

Describes a boundary of a chart for overflow resolution.

`struct Strategy`

Strategies for annotation overflow resolution.

### Initializers

`init(x: AnnotationOverflowResolution.Strategy, y: AnnotationOverflowResolution.Strategy)`

Creates an AnnotationOverflowResolution with strategies for the X and Y dimensions.

### Type Properties

`static let automatic: AnnotationOverflowResolution`

Automatically resolves overflow in each dimension.

## See Also

### Annotations

`struct AnnotationContext`

Information about an item that you add an annotation to.

`struct AnnotationPosition`

The position of an annotation.

---

# https://developer.apple.com/documentation/charts/numberbins

- Swift Charts
- NumberBins

Structure

# NumberBins

A collection of bins for a chart that plots data against numbers.

## Topics

### Initializers

[`init(data: [Value], desiredCount: Int?, minimumStride: Value)`](https://developer.apple.com/documentation/charts/numberbins/init(data:desiredcount:minimumstride:)-3txi5)

Automatically determine the bins from data.

[`init(data: [Value], desiredCount: Int?, minimumStride: Value)`](https://developer.apple.com/documentation/charts/numberbins/init(data:desiredcount:minimumstride:)-8pvv7)

Creates the given number of bins for the range. Expects that the range length is a multiple of `count` to allow uniform integer bins.

Creates the given number of bins for the range.

Automatically determine the bins from a range of data.

Creates uniform bins covering the given range.

[`init(thresholds: [Value])`](https://developer.apple.com/documentation/charts/numberbins/init(thresholds:))

Creates N-1 bins with the given N `thresholds`.

### Instance Properties

[`var thresholds: [Value]`](https://developer.apple.com/documentation/charts/numberbins/thresholds)

Find the bin thresholds.

### Instance Methods

Returns the bin index for the given value.

## Relationships

### Conforms To

- `Collection`
- `Copyable`
- `Equatable`
- `Sequence`

## See Also

### Data bins

`struct DateBins`

A collection of bins for a chart that plots data against dates.

`struct ChartBinRange`

The range of data that a single bin of a chart represents.

---

# https://developer.apple.com/documentation/charts/datebins

- Swift Charts
- DateBins

Structure

# DateBins

A collection of bins for a chart that plots data against dates.

struct DateBins

## Topics

### Initializers

[`init(data: [Date], desiredCount: Int?, calendar: Calendar)`](https://developer.apple.com/documentation/charts/datebins/init(data:desiredcount:calendar:))

Automatically determine the bins from data.

Automatically determine the bins from a range of data.

[`init(thresholds: [Date])`](https://developer.apple.com/documentation/charts/datebins/init(thresholds:))

Creates N-1 bins with the given N `thresholds`.

Creates uniform bins covering the given range. The first bin starts at the lower bound of the range.

Creates uniform bins covering the given range.

### Instance Properties

[`var thresholds: [Date]`](https://developer.apple.com/documentation/charts/datebins/thresholds)

Find the bin thresholds.

### Instance Methods

Returns the bin index for the given value.

## Relationships

### Conforms To

- `Collection`
- `Copyable`
- `Equatable`
- `Sequence`

## See Also

### Data bins

`struct NumberBins`

A collection of bins for a chart that plots data against numbers.

`struct ChartBinRange`

The range of data that a single bin of a chart represents.

---

# https://developer.apple.com/documentation/charts/chartbinrange

- Swift Charts
- ChartBinRange

Structure

# ChartBinRange

The range of data that a single bin of a chart represents.

## Overview

All bins except the last for a particular chart represent an open range, meaning that the range doesn’t include the upper bound. The last range of the last bin is closed, so that it does include the upper bound. The system keeps track of the open or closed state of a particular range.

## Topics

### Instance Properties

`let lowerBound: Bound`

`let upperBound: Bound`

## Relationships

### Conforms To

- `RangeExpression`

## See Also

### Data bins

`struct NumberBins`

A collection of bins for a chart that plots data against numbers.

`struct DateBins`

A collection of bins for a chart that plots data against dates.

---

# https://developer.apple.com/documentation/charts/chartplotcontent

- Swift Charts
- ChartPlotContent

Structure

# ChartPlotContent

A view that represents a chart’s plot area.

@MainActor @preconcurrency
struct ChartPlotContent

## Relationships

### Conforms To

- `Sendable`
- `SendableMetatype`
- `View`

## See Also

### Chart management

`struct ChartProxy`

A proxy that you use to access the scales and plot area of a chart.

---

# https://developer.apple.com/documentation/charts/chartproxy

- Swift Charts
- ChartProxy

Structure

# ChartProxy

A proxy that you use to access the scales and plot area of a chart.

struct ChartProxy

## Overview

You get a chart proxy from the `chartOverlay(alignment:content:)` and `chartBackground(alignment:content:)` modifiers. You can use the chart proxy to convert data values to screen coordinates or vice-versa.

Below is an example where we convert the screen coordinates from a drag gesture to data values.

Chart(data) {
LineMark(
x: .value("date", $0.date),
y: .value("price", $0.price)
)
}
.chartOverlay { proxy in
GeometryReader { geometry in
Rectangle().fill(.clear).contentShape(Rectangle())
.gesture(
DragGesture()
.onChanged { value in
// Convert the gesture location to the coordinate space of the plot area.
let origin = geometry[proxy.plotAreaFrame].origin
let location = CGPoint(
x: value.location.x - origin.x,
y: value.location.y - origin.y
)
// Get the x (date) and y (price) value from the location.
let (date, price) = proxy.value(at: location, as: (Date, Double).self)
print("Location: \(date), \(price)")
}
)
}
}

## Topics

### Instance Properties

An anchor to the frame of the chart’s plot.

`var plotAreaSize: CGSize`

The size of the plot in the chart.

An anchor to the frame of the chart’s plot container, or `nil` if there is no chart in the context of the chart proxy.

An anchor to the frame of the chart’s plot, or `nil` if there is no chart in the context of the chart proxy.

`var plotSize: CGSize`

### Instance Methods

Returns the angle relative to the plot area center, where the 12 o’clock position is interpreted as zero degrees, increasing clockwise.

Returns the foreground style for the given data value. Returns `nil` if the foreground style scale is unavailable, or the value is invalid.

Returns the line style for the given data value. Returns `nil` if the line style scale is unavailable, or the value is invalid.

Returns the x and y positions as a `CGPoint` for the given data values, or `nil` if either the X or the y scale is unavailable or if any data value is invalid. The returned position is relative to the plot.

Returns the x position for the given data value, or `nil` if the x scale is unavailable or if the data value is invalid. The returned position is relative to the plot.

Returns the y position for the given data value, or `nil` if the y scale is unavailable or if the data value is invalid. The returned position is relative to the plot.

Returns the range of x and y positions for the given pair of data values, or `nil` if the y scale is unavailable or if the value is invalid.

Returns the range of x position for the given data value, or `nil` if the x scale is unavailable or if the value is invalid. The returned position range is relative to the plot.

Returns the range of y position for the given data value, or `nil` if the x scale is unavailable or if the value is invalid. The returned position range is relative to the plot.

`func selectAngleValue(at: Angle)`

`func selectXRange(from: CGFloat, to: CGFloat)`

`func selectXValue(at: CGFloat)`

`func selectYRange(from: CGFloat, to: CGFloat)`

`func selectYValue(at: CGFloat)`

Returns the symbol for the given data value. Returns `nil` if the symbol scale is unavailable, or the value is invalid.

Returns the symbol size for the given data value. Returns `nil` if the symbol size scale is unavailable, or the value is invalid.

Returns the data values at the given position, or `nil` if the position does not correspond to a valid Y value.

Returns the data value at the given angle, or `nil` if the angle does not correspond to a valid data value.

Returns the data value at the given x position, or `nil` if the position does not correspond to a valid X value.

Returns the data value at the given y position, or `nil` if the position does not correspond to a valid Y value.

## See Also

### Chart management

`struct ChartPlotContent`

A view that represents a chart’s plot area.

---

# https://developer.apple.com/documentation/charts/chartscrolltargetbehavior

- Swift Charts
- ChartScrollTargetBehavior

Protocol

# ChartScrollTargetBehavior

A type that configures the scroll behavior of charts.

protocol ChartScrollTargetBehavior : ScrollTargetBehavior

## Topics

### Supporting types

`struct MajorValueAlignment`

A type that defines how the valigned aligned chart scroll target behavior aligns to major values on swipe.

`struct ValueAlignedLimitBehavior`

A type that defines the amount of marks that can be scrolled at a time.

`struct ValueAlignedChartScrollTargetBehavior`

A scroll target behavior that aligns to values spaced at regular intervals along the scrollable axes.

### Instance Methods

`func updateTarget(inout ScrollTarget, context: ChartScrollTargetBehaviorContext)`

**Required** Default implementation provided.

### Type Methods

Creates a scroll target behavior that aligns to values spaced at regular intervals along the scrollable axes.

## Relationships

### Inherits From

- `ScrollTargetBehavior`

### Conforming Types

- `ValueAlignedChartScrollTargetBehavior`

## See Also

### Scrolling

`struct ChartScrollTargetBehaviorContext`

Contextual information that you can use to determine how to best adjust how charts scroll.

---

# https://developer.apple.com/documentation/charts/chartscrolltargetbehaviorcontext

- Swift Charts
- ChartScrollTargetBehaviorContext

Structure

# ChartScrollTargetBehaviorContext

Contextual information that you can use to determine how to best adjust how charts scroll.

@dynamicMemberLookup
struct ChartScrollTargetBehaviorContext

## Topics

### Instance Properties

`var chartProxy: ChartProxy`

The chart proxy that you use to access the scales and plot area of the chart.

## See Also

### Scrolling

`protocol ChartScrollTargetBehavior`

A type that configures the scroll behavior of charts.

---

# https://developer.apple.com/documentation/charts/chart3drenderingstyle

- Swift Charts
- Chart3DRenderingStyle Beta

Structure

# Chart3DRenderingStyle

struct Chart3DRenderingStyle

## Topics

### Type Properties

`static var automatic: Chart3DRenderingStyle`

Sets the rendering style automatically.

`static var flat: Chart3DRenderingStyle`

Renders the chart onto a plane.

`static var volumetric: Chart3DRenderingStyle`

Renders the chart volumetrically for binocular vision.

## Relationships

### Conforms To

- `Equatable`
- `Hashable`

Beta Software

This documentation contains preliminary information about an API or technology in development. This information is subject to change, and software implemented according to this documentation should be tested with final operating system software.

Learn more about using Apple's beta software

---

# https://developer.apple.com/documentation/charts/creating-a-chart-using-swift-charts)



---

# https://developer.apple.com/documentation/charts/visualizing_your_app_s_data)



---

# https://developer.apple.com/documentation/charts/chart)



---

# https://developer.apple.com/documentation/charts/chartcontent)



---

# https://developer.apple.com/documentation/charts/chartcontentbuilder)



---

# https://developer.apple.com/documentation/charts/plot)



---

# https://developer.apple.com/documentation/charts/chart3d)



---

# https://developer.apple.com/documentation/charts/chart3dcontent)



---

# https://developer.apple.com/documentation/charts/chart3dcontentbuilder)



---

# https://developer.apple.com/documentation/charts/surfaceplot)



---

# https://developer.apple.com/documentation/charts/areamark)



---

# https://developer.apple.com/documentation/charts/linemark)



---

# https://developer.apple.com/documentation/charts/pointmark)



---

# https://developer.apple.com/documentation/charts/rectanglemark)



---

# https://developer.apple.com/documentation/charts/rulemark)



---

# https://developer.apple.com/documentation/charts/barmark)



---

# https://developer.apple.com/documentation/charts/sectormark)



---

# https://developer.apple.com/documentation/charts/creating-a-data-visualization-dashboard-with-swift-charts)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/charts/areaplot)



---

# https://developer.apple.com/documentation/charts/lineplot)



---

# https://developer.apple.com/documentation/charts/pointplot)



---

# https://developer.apple.com/documentation/charts/rectangleplot)



---

# https://developer.apple.com/documentation/charts/ruleplot)



---

# https://developer.apple.com/documentation/charts/barplot)



---

# https://developer.apple.com/documentation/charts/sectorplot)



---

# https://developer.apple.com/documentation/charts/vectorizedchartcontent)



---

# https://developer.apple.com/documentation/charts/markstackingmethod)



---

# https://developer.apple.com/documentation/charts/markdimension)



---

# https://developer.apple.com/documentation/charts/interpolationmethod)



---

# https://developer.apple.com/documentation/charts/basicchartsymbolshape)



---

# https://developer.apple.com/documentation/charts/chartsymbolshape)



---

# https://developer.apple.com/documentation/charts/anychartsymbolshape)



---

# https://developer.apple.com/documentation/charts/plottablevalue)



---

# https://developer.apple.com/documentation/charts/plottable)



---

# https://developer.apple.com/documentation/charts/scalerange)



---

# https://developer.apple.com/documentation/charts/positionscalerange)



---

# https://developer.apple.com/documentation/charts/plotdimensionscalerange)



---

# https://developer.apple.com/documentation/charts/scaledomain)



---

# https://developer.apple.com/documentation/charts/automaticscaledomain)



---

# https://developer.apple.com/documentation/charts/scaletype)



---

# https://developer.apple.com/documentation/charts/customizing-axes-in-swift-charts)



---

# https://developer.apple.com/documentation/charts/chartaxiscontent)



---

# https://developer.apple.com/documentation/charts/axiscontent)



---

# https://developer.apple.com/documentation/charts/axismarks)



---

# https://developer.apple.com/documentation/charts/anyaxiscontent)



---

# https://developer.apple.com/documentation/charts/axiscontentbuilder)



---

# https://developer.apple.com/documentation/charts/axismark)



---

# https://developer.apple.com/documentation/charts/axistick)



---

# https://developer.apple.com/documentation/charts/axisgridline)



---

# https://developer.apple.com/documentation/charts/axisvaluelabel)



---

# https://developer.apple.com/documentation/charts/axisvalue)



---

# https://developer.apple.com/documentation/charts/anyaxismark)



---

# https://developer.apple.com/documentation/charts/axismarkbuilder)



---

# https://developer.apple.com/documentation/charts/annotationcontext)



---

# https://developer.apple.com/documentation/charts/annotationposition)



---

# https://developer.apple.com/documentation/charts/annotationoverflowresolution)



---

# https://developer.apple.com/documentation/charts/numberbins)



---

# https://developer.apple.com/documentation/charts/datebins)



---

# https://developer.apple.com/documentation/charts/chartbinrange)



---

# https://developer.apple.com/documentation/charts/chartplotcontent)



---

# https://developer.apple.com/documentation/charts/chartproxy)



---

# https://developer.apple.com/documentation/charts/chartscrolltargetbehavior)



---

# https://developer.apple.com/documentation/charts/chartscrolltargetbehaviorcontext)



---

# https://developer.apple.com/documentation/charts/chart3drenderingstyle)



---

# https://developer.apple.com/documentation/charts

Framework

# Swift Charts

Construct and customize charts on every Apple platform.

## Overview

Swift Charts is a powerful and concise SwiftUI framework you can use to transform your data into informative visualizations. With Swift Charts, you can build effective and customizable charts with minimal code. This framework provides marks, scales, axes, and legends as building blocks that you can combine to develop a broad range of data-driven charts.

There are many ways you can use Swift Charts to communicate patterns or trends in your data. You can create a variety of charts including line charts, bar charts, and scatter plots as shown above. When you create a chart using this framework, it automatically generates scales and axes that fit your data.

Swift Charts supports localization and accessibility features. You can also override default behavior to customize your charts by using chart modifiers. For example, you can create a dynamic experience by adding animations to your charts.

## Topics

### Essentials

Swift Charts updates

Learn about important changes to Swift Charts.

### Charts

Creating a chart using Swift Charts

Make a chart by combining chart building blocks in SwiftUI.

Visualizing your app’s data

Build complex and interactive charts using Swift Charts.

`struct Chart`

A SwiftUI view that displays a chart.

`protocol ChartContent`

A type that represents the content that you draw on a chart.

`struct ChartContentBuilder`

A result builder that you use to compose the contents of a chart.

`struct Plot`

A mechanism for grouping chart contents into a single entity.

### 3D charts

`struct Chart3D`

A SwiftUI view that displays interactive 3D charts and visualizations.

Beta

`protocol Chart3DContent`

A type that represents the three-dimensional content that you draw on a chart.

`struct Chart3DContentBuilder`

A result builder that you use to compose the three-dimensional contents of a chart.

`struct SurfacePlot`

Chart content that represents a mathematical function of two variables using a 3D surface.

### Marks

`struct AreaMark`

Chart content that represents data using the area of one or more regions.

`struct LineMark`

Chart content that represents data using a sequence of connected line segments.

`struct PointMark`

Chart content that represents data using points.

`struct RectangleMark`

Chart content that represents data using rectangles.

`struct RuleMark`

Chart content that represents data using a single horizontal or vertical rule.

`struct BarMark`

Chart content that represents data using bars.

`struct SectorMark`

A sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

### Vectorized plots

Creating a data visualization dashboard with Swift Charts

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift Charts.

`struct AreaPlot`

Chart content that represents a function or a collection of data using the area of one or more regions.

`struct LinePlot`

Chart content that represents a function or a collection of data using a sequence of connected line segments.

`struct PointPlot`

Chart content that represents a collection of data using points.

`struct RectanglePlot`

Chart content that represents a collection of data using rectangles.

`struct RulePlot`

Chart content that represents a collection of data using a single horizontal or vertical rule.

`struct BarPlot`

Chart content that represents a collection of data using bars.

`struct SectorPlot`

Chart content that represents a collection of data using a sector of a pie or donut chart, which shows how individual categories make up a meaningful total.

`protocol VectorizedChartContent`

A generic type that represents content conveyed via a chart.

### Mark configuration

`struct MarkStackingMethod`

The ways in which you can stack marks in a chart.

`struct MarkDimension`

An individual dimension representing a mark’s width or height.

`struct InterpolationMethod`

The ways in which line or area marks interpolate their data.

`struct BasicChartSymbolShape`

A basic chart symbol shape.

`protocol ChartSymbolShape`

A type that can act as a shape for the marks that you add to a chart.

`struct AnyChartSymbolShape`

A type-erased plotting shape.

### Labeled data

`struct PlottableValue`

Labeled data that you plot in a chart using marks.

`protocol Plottable`

A type that can serve as data to plot in a chart.

### Scales

`protocol ScaleRange`

A type that you can use to configure the range of a chart.

`protocol PositionScaleRange`

A type that configures the x-axis and y-axis values.

`struct PlotDimensionScaleRange`

A range that represents the plot area’s width or height.

`protocol ScaleDomain`

A type that you can use to configure the domain of a chart.

`struct AutomaticScaleDomain`

A domain that the chart infers from its data.

`struct ScaleType`

The ways you can scale the domain or range of a plot.

### Axes

Customizing axes in Swift Charts

Improve the clarity of your chart by configuring the appearance of its axes.

`struct ChartAxisContent`

A view that represents a chart’s axis.

`protocol AxisContent`

A type that represents the elements you use to build a chart’s axes.

`struct AxisMarks`

A group of visual marks that a chart draws to indicate the composition of a chart’s axes.

`struct AnyAxisContent`

A type-erased element of a chart’s axis.

`struct AxisContentBuilder`

A result builder that constructs axis content.

### Axis marks

`protocol AxisMark`

A type that serves as the basic building block for the elements of an axis.

`struct AxisTick`

A mark that a chart draws on an axis to indicate a reference point along that axis.

`struct AxisGridLine`

A line that a chart draws across its plot area to indicate a reference point along a particular axis.

`struct AxisValueLabel`

A label that describes the value for an axis mark.

`struct AxisValue`

A value for an axis mark.

`struct AnyAxisMark`

A type-erased axis mark.

`struct AxisMarkBuilder`

A result builder that constructs axis marks and overrides default marks.

### Annotations

`struct AnnotationContext`

Information about an item that you add an annotation to.

`struct AnnotationPosition`

The position of an annotation.

`struct AnnotationOverflowResolution`

### Data bins

`struct NumberBins`

A collection of bins for a chart that plots data against numbers.

`struct DateBins`

A collection of bins for a chart that plots data against dates.

`struct ChartBinRange`

The range of data that a single bin of a chart represents.

### Chart management

`struct ChartPlotContent`

A view that represents a chart’s plot area.

`struct ChartProxy`

A proxy that you use to access the scales and plot area of a chart.

### Scrolling

`protocol ChartScrollTargetBehavior`

A type that configures the scroll behavior of charts.

`struct ChartScrollTargetBehaviorContext`

Contextual information that you can use to determine how to best adjust how charts scroll.

### Structures

`struct Chart3DRenderingStyle` Beta

---

# https://developer.apple.com/documentation/charts/chartcontent/foregroundstyle(_:)

#app-main)

- Swift Charts
- ChartContent
- foregroundStyle(\_:)

Instance Method

# foregroundStyle(\_:)

Sets the foreground style for the chart content.

nonisolated

## Parameters

`style`

The shape style.

## See Also

### Styling marks

Sets the opacity for the chart content.

Sets the corner radius of the chart content.

Sets the style for line marks.

Plots line and area marks with the interpolation method that you specify.

---

# https://developer.apple.com/documentation/charts/chartcontent/opacity(_:)

#app-main)

- Swift Charts
- ChartContent
- opacity(\_:)

Instance Method

# opacity(\_:)

Sets the opacity for the chart content.

nonisolated

## See Also

### Styling marks

Sets the foreground style for the chart content.

Sets the corner radius of the chart content.

Sets the style for line marks.

Plots line and area marks with the interpolation method that you specify.

---

# https://developer.apple.com/documentation/charts/chartcontent/cornerradius(_:style:)

#app-main)

- Swift Charts
- ChartContent
- cornerRadius(\_:style:)

Instance Method

# cornerRadius(\_:style:)

Sets the corner radius of the chart content.

nonisolated
func cornerRadius(
_ radius: CGFloat,
style: RoundedCornerStyle = .continuous

## Parameters

`radius`

The corner radius.

`style`

The style of the rounded corners.

## See Also

### Styling marks

Sets the foreground style for the chart content.

Sets the opacity for the chart content.

Sets the style for line marks.

Plots line and area marks with the interpolation method that you specify.

---

# https://developer.apple.com/documentation/charts/chartcontent/linestyle(_:)

#app-main)

- Swift Charts
- ChartContent
- lineStyle(\_:)

Instance Method

# lineStyle(\_:)

Sets the style for line marks.

nonisolated

## Parameters

`style`

The stroke style.

## Discussion

## See Also

### Styling marks

Sets the foreground style for the chart content.

Sets the opacity for the chart content.

Sets the corner radius of the chart content.

Plots line and area marks with the interpolation method that you specify.

---

# https://developer.apple.com/documentation/charts/chartcontent/interpolationmethod(_:)

#app-main)

- Swift Charts
- ChartContent
- interpolationMethod(\_:)

Instance Method

# interpolationMethod(\_:)

Plots line and area marks with the interpolation method that you specify.

nonisolated

## Parameters

`method`

An interpolation method.

## See Also

### Styling marks

Sets the foreground style for the chart content.

Sets the opacity for the chart content.

Applies a Gaussian blur to this chart content.

Sets the corner radius of the chart content.

Sets the style for line marks.

A chart content that adds a shadow to this chart content.

---

# https://developer.apple.com/documentation/charts/chartcontent/offset(_:)

#app-main)

- Swift Charts
- ChartContent
- offset(\_:)

Instance Method

# offset(\_:)

Applies an offset that you specify as a size to the chart content.

nonisolated

## Parameters

`value`

The offset distance in screen coordinates.

## See Also

### Positioning marks

Applies a vertical and horizontal offset to the chart content.

Applies an offset to the chart content.

Aligns this item’s styles with the chart’s plot area.

---

# https://developer.apple.com/documentation/charts/chartcontent/offset(x:y:)

#app-main)

- Swift Charts
- ChartContent
- offset(x:y:)

Instance Method

# offset(x:y:)

Applies a vertical and horizontal offset to the chart content.

nonisolated
func offset(
x: CGFloat = 0,
y: CGFloat = 0

## Parameters

`x`

The horizontal offset in screen coordinates.

`y`

The vertical offset in screen coordinates.

## See Also

### Positioning marks

Applies an offset that you specify as a size to the chart content.

Applies an offset to the chart content.

Aligns this item’s styles with the chart’s plot area.

---

# https://developer.apple.com/documentation/charts/chartcontent/offset(x:ystart:yend:)

#app-main)

- Swift Charts
- ChartContent
- offset(x:yStart:yEnd:)

Instance Method

# offset(x:yStart:yEnd:)

Applies an offset to the chart content.

nonisolated
func offset(
x: CGFloat = 0,
yStart: CGFloat = 0,
yEnd: CGFloat = 0

## Parameters

`x`

The horizontal offset in screen coordinates.

`yStart`

The starting vertical offset in screen coordinates.

`yEnd`

The ending vertical offset in screen coordinates.

## Discussion

The `yStart` and `yEnd` offset values apply only to marks that have such properties, like bar marks and line segment marks.

## See Also

### Positioning marks

Applies an offset that you specify as a size to the chart content.

Applies a vertical and horizontal offset to the chart content.

Aligns this item’s styles with the chart’s plot area.

---

# https://developer.apple.com/documentation/charts/chartcontent/offset(xstart:xend:y:)

#app-main)

- Swift Charts
- ChartContent
- offset(xStart:xEnd:y:)

Instance Method

# offset(xStart:xEnd:y:)

Applies an offset to the chart content.

nonisolated
func offset(
xStart: CGFloat = 0,
xEnd: CGFloat = 0,
y: CGFloat = 0

## Parameters

`xStart`

The starting horizontal offset in screen coordinates.

`xEnd`

The ending horizontal offset in screen coordinates.

`y`

The vertical offset in screen coordinates.

## Discussion

The `xStart` and `xEnd` offset values apply only to marks that have such properties, like bar marks and line segment marks.

## See Also

### Positioning marks

Applies an offset that you specify as a size to the chart content.

Applies a vertical and horizontal offset to the chart content.

Aligns this item’s styles with the chart’s plot area.

---

# https://developer.apple.com/documentation/charts/chartcontent/offset(xstart:xend:ystart:yend:)

#app-main)

- Swift Charts
- ChartContent
- offset(xStart:xEnd:yStart:yEnd:)

Instance Method

# offset(xStart:xEnd:yStart:yEnd:)

Applies an offset to the chart content.

nonisolated
func offset(
xStart: CGFloat = 0,
xEnd: CGFloat = 0,
yStart: CGFloat = 0,
yEnd: CGFloat = 0

## Parameters

`xStart`

The starting horizontal offset in screen coordinates.

`xEnd`

The ending horizontal offset in screen coordinates.

`yStart`

The starting vertical offset in screen coordinates.

`yEnd`

The ending vertical offset in screen coordinates.

## Discussion

The `xStart`, `xEnd`, `yStart`, and `yEnd` offset values apply only to marks that have such properties, like bar marks and line segment marks.

## See Also

### Positioning marks

Applies an offset that you specify as a size to the chart content.

Applies a vertical and horizontal offset to the chart content.

Aligns this item’s styles with the chart’s plot area.

---

# https://developer.apple.com/documentation/charts/chartcontent/alignsmarkstyleswithplotarea(_:)

#app-main)

- Swift Charts
- ChartContent
- alignsMarkStylesWithPlotArea(\_:)

Instance Method

# alignsMarkStylesWithPlotArea(\_:)

Aligns this item’s styles with the chart’s plot area.

nonisolated

## Parameters

`aligns`

A Boolean value that indicates whether to align this item’s styles with the plotting area.

## Discussion

Marks map unit-point coordinates within the plot area’s bounds.

## See Also

### Positioning marks

Applies an offset that you specify as a size to the chart content.

Applies a vertical and horizontal offset to the chart content.

Applies an offset to the chart content.

---

# https://developer.apple.com/documentation/charts/chartcontent/symbol(_:)

#app-main)

- Swift Charts
- ChartContent
- symbol(\_:)

Instance Method

# symbol(\_:)

Sets a plotting symbol type for the chart content.

nonisolated

## Parameters

`symbol`

The symbol.

## See Also

### Setting symbol appearance

Sets a SwiftUI view to use as the symbol for the chart content.

Sets the plotting symbol size for the chart content.

Sets the plotting symbol size for the chart content according to a perceived area.

---

# https://developer.apple.com/documentation/charts/chartcontent/symbol(symbol:)

#app-main)

- Swift Charts
- ChartContent
- symbol(symbol:)

Instance Method

# symbol(symbol:)

Sets a SwiftUI view to use as the symbol for the chart content.

nonisolated

## Parameters

`symbol`

The view to use as the plotting symbol.

## See Also

### Setting symbol appearance

Sets a plotting symbol type for the chart content.

Sets the plotting symbol size for the chart content.

Sets the plotting symbol size for the chart content according to a perceived area.

---

# https://developer.apple.com/documentation/charts/chartcontent/symbolsize(_:)-7s0vk

-7s0vk#app-main)

- Swift Charts
- ChartContent
- symbolSize(\_:)

Instance Method

# symbolSize(\_:)

Sets the plotting symbol size for the chart content.

nonisolated

## Parameters

`size`

The symbol’s bounding box’s dimensions.

## See Also

### Setting symbol appearance

Sets a plotting symbol type for the chart content.

Sets a SwiftUI view to use as the symbol for the chart content.

Sets the plotting symbol size for the chart content according to a perceived area.

---

# https://developer.apple.com/documentation/charts/chartcontent/symbolsize(_:)-8dtyt

-8dtyt#app-main)

- Swift Charts
- ChartContent
- symbolSize(\_:)

Instance Method

# symbolSize(\_:)

Sets the plotting symbol size for the chart content according to a perceived area.

nonisolated

## Parameters

`area`

The perceived area in square points. For example, a square with 10 points on each side has an area of 100 square points.

## See Also

### Setting symbol appearance

Sets a plotting symbol type for the chart content.

Sets a SwiftUI view to use as the symbol for the chart content.

Sets the plotting symbol size for the chart content.

---

# https://developer.apple.com/documentation/charts/chartcontent/foregroundstyle(by:)

#app-main)

- Swift Charts
- ChartContent
- foregroundStyle(by:)

Instance Method

# foregroundStyle(by:)

Represents data using a foreground style.

nonisolated

## Parameters

`value`

The data value to encode using foreground style.

## Mentioned in

Creating a chart using Swift Charts

## See Also

### Encoding data into mark characteristics

Represents data using line styles.

Represents data using position.

Represents data using different kinds of symbols.

Represents data using symbol sizes.

---

# https://developer.apple.com/documentation/charts/chartcontent/linestyle(by:)

#app-main)

- Swift Charts
- ChartContent
- lineStyle(by:)

Instance Method

# lineStyle(by:)

Represents data using line styles.

nonisolated

## Parameters

`value`

The data value.

## See Also

### Encoding data into mark characteristics

Represents data using a foreground style.

Represents data using position.

Represents data using different kinds of symbols.

Represents data using symbol sizes.

---

# https://developer.apple.com/documentation/charts/chartcontent/position(by:axis:span:)

#app-main)

- Swift Charts
- ChartContent
- position(by:axis:span:)

Instance Method

# position(by:axis:span:)

Represents data using position.

nonisolated

axis: Axis? = nil,
span: MarkDimension = .automatic

## Parameters

`value`

The data used for positioning marks.

`axis`

The axis to position marks along. Set this to `nil` to use a default configuration.

`span`

The span of the positioned marks. Use this to control the total amount space available to the marks.

## Discussion

The code below creates a grouped bar chart that positions marks with the same “product” along the horizontal axis by their “type”.

Chart(cars) {
BarMark(
x: .value("product", $0.product),
y: .value("price", $0.price)
)
.position(by: .value("type", $0.type), axis: .horizontal)
}

## See Also

### Encoding data into mark characteristics

Represents data using a foreground style.

Represents data using line styles.

Represents data using different kinds of symbols.

Represents data using symbol sizes.

---

# https://developer.apple.com/documentation/charts/chartcontent/symbol(by:)

#app-main)

- Swift Charts
- ChartContent
- symbol(by:)

Instance Method

# symbol(by:)

Represents data using different kinds of symbols.

nonisolated

## Parameters

`value`

The data value. `value` must be categorial, such as `String`.

## See Also

### Encoding data into mark characteristics

Represents data using a foreground style.

Represents data using line styles.

Represents data using position.

Represents data using symbol sizes.

---

# https://developer.apple.com/documentation/charts/chartcontent/symbolsize(by:)

#app-main)

- Swift Charts
- ChartContent
- symbolSize(by:)

Instance Method

# symbolSize(by:)

Represents data using symbol sizes.

nonisolated

## Parameters

`value`

The data value to encode by size.

## See Also

### Encoding data into mark characteristics

Represents data using a foreground style.

Represents data using line styles.

Represents data using position.

Represents data using different kinds of symbols.

---

# https://developer.apple.com/documentation/charts/chartcontent/annotation(position:alignment:spacing:content:)-65emh

-65emh#app-main)

- Swift Charts
- ChartContent
- annotation(position:alignment:spacing:content:)

Instance Method

# annotation(position:alignment:spacing:content:)

Annotates this mark or collection of marks with a view positioned relative to its bounds.

nonisolated

position: AnnotationPosition = .automatic,
alignment: Alignment = .center,
spacing: CGFloat? = nil,

## Parameters

`position`

The location relative to the item being annotated at which the annotation will be placed.

`alignment`

The guide for aligning the annotation in the specified position.

`spacing`

Distance between the annotation and the annotated content, or `nil` if you want to use the default distance.

`content`

A view builder that creates the annotation. The builder takes one input which provides information regarding the item being annotated such as its size.

## See Also

### Annotating marks

---

# https://developer.apple.com/documentation/charts/chartcontent/annotation(position:alignment:spacing:content:)-26b2f

-26b2f#app-main)

- Swift Charts
- ChartContent
- annotation(position:alignment:spacing:content:)

Instance Method

# annotation(position:alignment:spacing:content:)

Annotates this mark or collection of marks with a view positioned relative to its bounds.

nonisolated

position: AnnotationPosition = .automatic,
alignment: Alignment = .center,
spacing: CGFloat? = nil,

## Parameters

`position`

The location relative to the item being annotated at which the annotation will be placed.

`alignment`

The guide for aligning the annotation in the specified position.

`spacing`

Distance between the annotation and the annotated content, or `nil` if you want to use the default distance.

`content`

A view builder that creates the annotation.

## See Also

### Annotating marks

---

# https://developer.apple.com/documentation/charts/chartcontent/mask(content:)

#app-main)

- Swift Charts
- ChartContent
- mask(content:)

Instance Method

# mask(content:)

Masks chart content using the alpha channel of the specified content.

nonisolated

## Discussion

Parameter content: The content whose alpha will be applied to this item.

## See Also

### Masking and clipping

Sets a clip shape for the chart content.

---

# https://developer.apple.com/documentation/charts/chartcontent/clipshape(_:style:)

#app-main)

- Swift Charts
- ChartContent
- clipShape(\_:style:)

Instance Method

# clipShape(\_:style:)

Sets a clip shape for the chart content.

nonisolated
func clipShape(
_ shape: some Shape,
style: FillStyle = FillStyle()

## Parameters

`shape`

The clip shape. The shape fills each mark’s frame.

`style`

The fill to use when rasterizing the shape.

## See Also

### Masking and clipping

Masks chart content using the alpha channel of the specified content.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilityhidden(_:)

#app-main)

- Swift Charts
- ChartContent
- accessibilityHidden(\_:)

Instance Method

# accessibilityHidden(\_:)

Specifies whether to hide this chart content from system accessibility features.

nonisolated

## See Also

### Configuring accessibility

Adds an identifier string to the chart content.

Adds a label to the chart content that describes its contents.

Adds a description of the value that the chart content contains.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilityidentifier(_:)

#app-main)

- Swift Charts
- ChartContent
- accessibilityIdentifier(\_:)

Instance Method

# accessibilityIdentifier(\_:)

Adds an identifier string to the chart content.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds a label to the chart content that describes its contents.

Adds a description of the value that the chart content contains.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilitylabel(_:)-40zjp

-40zjp#app-main)

- Swift Charts
- ChartContent
- accessibilityLabel(\_:)

Instance Method

# accessibilityLabel(\_:)

Adds a label to the chart content that describes its contents.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a description of the value that the chart content contains.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilitylabel(_:)-5gk8d

-5gk8d#app-main)

- Swift Charts
- ChartContent
- accessibilityLabel(\_:)

Instance Method

# accessibilityLabel(\_:)

Adds a label to the chart content that describes its contents.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a description of the value that the chart content contains.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilitylabel(_:)-28985

-28985#app-main)

- Swift Charts
- ChartContent
- accessibilityLabel(\_:)

Instance Method

# accessibilityLabel(\_:)

Adds a label to the chart content that describes its contents.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a description of the value that the chart content contains.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilityvalue(_:)-33c0e

-33c0e#app-main)

- Swift Charts
- ChartContent
- accessibilityValue(\_:)

Instance Method

# accessibilityValue(\_:)

Adds a description of the value that the chart content contains.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a label to the chart content that describes its contents.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilityvalue(_:)-4k545

-4k545#app-main)

- Swift Charts
- ChartContent
- accessibilityValue(\_:)

Instance Method

# accessibilityValue(\_:)

Adds a description of the value that the chart content contains.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a label to the chart content that describes its contents.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilityvalue(_:)-5g7o4

-5g7o4#app-main)

- Swift Charts
- ChartContent
- accessibilityValue(\_:)

Instance Method

# accessibilityValue(\_:)

Adds a description of the value that the chart content contains.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a label to the chart content that describes its contents.

---

# https://developer.apple.com/documentation/charts/chartcontent/body-swift.property

- Swift Charts
- ChartContent
- body

Instance Property

# body

The content and behavior of the chart content.

@ChartContentBuilder @MainActor @preconcurrency
var body: Self.Body { get }

**Required**

## See Also

### Implementing chart content

`associatedtype Body : ChartContent`

The type of chart content contained in the body of this instance.

---

# https://developer.apple.com/documentation/charts/chartcontent/body-swift.associatedtype

- Swift Charts
- ChartContent
- Body

Associated Type

# Body

The type of chart content contained in the body of this instance.

associatedtype Body : ChartContent

**Required**

## See Also

### Implementing chart content

`var body: Self.Body`

The content and behavior of the chart content.

---

# https://developer.apple.com/documentation/charts/anychartcontent

- Swift Charts
- AnyChartContent

Structure

# AnyChartContent

A type-erased chart content.

@MainActor @frozen @preconcurrency
struct AnyChartContent

## Topics

### Initializers

`init(any ChartContent)`

`init(erasing: some ChartContent)`

## Relationships

### Conforms To

- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilitylabel(_:)-9tbjv

-9tbjv#app-main)

- Swift Charts
- ChartContent
- accessibilityLabel(\_:)

Instance Method

# accessibilityLabel(\_:)

Adds a label to the chart content that describes its contents.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a description of the value that the chart content contains.

---

# https://developer.apple.com/documentation/charts/chartcontent/accessibilityvalue(_:)-4f8vo

-4f8vo#app-main)

- Swift Charts
- ChartContent
- accessibilityValue(\_:)

Instance Method

# accessibilityValue(\_:)

Adds a description of the value that the chart content contains.

nonisolated

## See Also

### Configuring accessibility

Specifies whether to hide this chart content from system accessibility features.

Adds an identifier string to the chart content.

Adds a label to the chart content that describes its contents.

---

# https://developer.apple.com/documentation/charts/chartcontent/annotation(position:alignment:spacing:overflowresolution:content:)-1kiow

-1kiow#app-main)

- Swift Charts
- ChartContent
- annotation(position:alignment:spacing:overflowResolution:content:)

Instance Method

# annotation(position:alignment:spacing:overflowResolution:content:)

Annotates this mark or collection of marks with a view positioned relative to its bounds.

nonisolated

position: AnnotationPosition = .automatic,
alignment: Alignment = .center,
spacing: CGFloat? = nil,
overflowResolution: AnnotationOverflowResolution,

## Parameters

`position`

The location relative to the item being annotated at which the annotation will be placed.

`alignment`

The guide for aligning the annotation in the specified position.

`spacing`

Distance between the annotation and the annotated content, or `nil` if you want to use the default distance.

`overflowResolution`

How to resolve the annotation exceeding the boundary of the plot.

`content`

A view builder that creates the annotation. The builder takes one input which provides information regarding the item being annotated such as its size.

## See Also

### Annotating marks

---

# https://developer.apple.com/documentation/charts/chartcontent/annotation(position:alignment:spacing:overflowresolution:content:)-6w4p3



---

# https://developer.apple.com/documentation/charts/chartcontent/blur(radius:)

#app-main)

- Swift Charts
- ChartContent
- blur(radius:)

Instance Method

# blur(radius:)

Applies a Gaussian blur to this chart content.

nonisolated

## Parameters

`radius`

The radial size of the blur. A blur is more diffuse when its radius is large.

## See Also

### Styling marks

Sets the foreground style for the chart content.

Sets the opacity for the chart content.

Sets the corner radius of the chart content.

Sets the style for line marks.

A chart content that adds a shadow to this chart content.

Plots line and area marks with the interpolation method that you specify.

---

# https://developer.apple.com/documentation/charts/chartcontent/compositinglayer()

#app-main)

- Swift Charts
- ChartContent
- compositingLayer()

Instance Method

# compositingLayer()

nonisolated

## See Also

### Layering chart content

Controls the display order of overlapping chart content.

---

# https://developer.apple.com/documentation/charts/chartcontent/compositinglayer(style:)

#app-main)

- Swift Charts
- ChartContent
- compositingLayer(style:)

Instance Method

# compositingLayer(style:)

nonisolated

## See Also

### Layering chart content

Controls the display order of overlapping chart content.

---

# https://developer.apple.com/documentation/charts/chartcontent/shadow(color:radius:x:y:)

#app-main)

- Swift Charts
- ChartContent
- shadow(color:radius:x:y:)

Instance Method

# shadow(color:radius:x:y:)

A chart content that adds a shadow to this chart content.

nonisolated
func shadow(
color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33),
radius: CGFloat,
x: CGFloat = 0,
y: CGFloat = 0

## Parameters

`color`

The shadow’s color.

`radius`

A measure of how much to blur the shadow. Larger values result in more blur.

`x`

An amount to offset the shadow horizontally.

`y`

An amount to offset the shadow vertically.

## See Also

### Styling marks

Sets the foreground style for the chart content.

Sets the opacity for the chart content.

Applies a Gaussian blur to this chart content.

Sets the corner radius of the chart content.

Sets the style for line marks.

Plots line and area marks with the interpolation method that you specify.

---

# https://developer.apple.com/documentation/charts/chartcontent/zindex(_:)

#app-main)

- Swift Charts
- ChartContent
- zIndex(\_:)

Instance Method

# zIndex(\_:)

Controls the display order of overlapping chart content.

nonisolated

## Parameters

`value`

A relative front-to-back ordering for this view; the default is `0`.

## See Also

---

# https://developer.apple.com/documentation/charts/builderconditional

- Swift Charts
- BuilderConditional

Structure

# BuilderConditional

A conditional result from a result builder.

@frozen

## Overview

Don’t use this type directly. The result builders defined by the framework, like `ChartContentBuilder` and `AxisContentBuilder`, use it as part of the building process.

## Relationships

### Conforms To

- `AxisContent`
Conforms when `TrueContent` conforms to `AxisContent` and `FalseContent` conforms to `AxisContent`.

- `AxisMark`
Conforms when `TrueContent` conforms to `AxisMark` and `FalseContent` conforms to `AxisMark`.

- `Chart3DContent`
Conforms when `TrueContent` conforms to `Chart3DContent` and `FalseContent` conforms to `Chart3DContent`.

- `ChartContent`
Conforms when `TrueContent` conforms to `ChartContent` and `FalseContent` conforms to `ChartContent`.

- `Copyable`

---

# https://developer.apple.com/documentation/charts/functionareaplotcontent

- Swift Charts
- FunctionAreaPlotContent

Structure

# FunctionAreaPlotContent

@MainActor @preconcurrency
struct FunctionAreaPlotContent

## Relationships

### Conforms To

- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Supporting types

`struct VectorizedAreaPlotContent`

An opaque vectorized chart content type.

---

# https://developer.apple.com/documentation/charts/functionlineplotcontent

- Swift Charts
- FunctionLinePlotContent

Structure

# FunctionLinePlotContent

@MainActor @preconcurrency
struct FunctionLinePlotContent

## Relationships

### Conforms To

- `ChartContent`
- `Copyable`
- `Sendable`
- `SendableMetatype`

## See Also

### Supporting types

`struct VectorizedLinePlotContent`

An opaque vectorized chart content type.

---

# https://developer.apple.com/documentation/charts/vectorizedareaplotcontent

- Swift Charts
- VectorizedAreaPlotContent

Structure

# VectorizedAreaPlotContent

An opaque vectorized chart content type.

@MainActor @preconcurrency

## Overview

Don’t use this type directly. Swift Charts automatically instantiates and consumes values of this type.

## Relationships

### Conforms To

- `ChartContent`
- `Sendable`
- `SendableMetatype`
- `VectorizedChartContent`

## See Also

### Supporting types

`struct FunctionAreaPlotContent`

---

# https://developer.apple.com/documentation/charts/vectorizedbarplotcontent

- Swift Charts
- VectorizedBarPlotContent

Structure

# VectorizedBarPlotContent

An opaque vectorized chart content type.

@MainActor @preconcurrency

## Overview

Don’t use this type directly. Swift Charts automatically instantiates and consumes values of this type.

## Relationships

### Conforms To

- `ChartContent`
- `Sendable`
- `SendableMetatype`
- `VectorizedChartContent`

---

# https://developer.apple.com/documentation/charts/vectorizedlineplotcontent

- Swift Charts
- VectorizedLinePlotContent

Structure

# VectorizedLinePlotContent

An opaque vectorized chart content type.

@MainActor @preconcurrency

## Overview

Don’t use this type directly. Swift Charts automatically instantiates and consumes values of this type.

## Relationships

### Conforms To

- `ChartContent`
- `Sendable`
- `SendableMetatype`
- `VectorizedChartContent`

## See Also

### Supporting types

`struct FunctionLinePlotContent`

---

# https://developer.apple.com/documentation/charts/vectorizedpointplotcontent

- Swift Charts
- VectorizedPointPlotContent

Structure

# VectorizedPointPlotContent

An opaque vectorized chart content type.

@MainActor @preconcurrency

## Overview

Don’t use this type directly. Swift Charts automatically instantiates and consumes values of this type.

## Relationships

### Conforms To

- `ChartContent`
- `Sendable`
- `SendableMetatype`
- `VectorizedChartContent`

---

# https://developer.apple.com/documentation/charts/vectorizedrectangleplotcontent

- Swift Charts
- VectorizedRectanglePlotContent

Structure

# VectorizedRectanglePlotContent

An opaque vectorized chart content type.

@MainActor @preconcurrency

## Overview

Don’t use this type directly. Swift Charts automatically instantiates and consumes values of this type.

## Relationships

### Conforms To

- `ChartContent`
- `Sendable`
- `SendableMetatype`
- `VectorizedChartContent`

---

# https://developer.apple.com/documentation/charts/vectorizedruleplotcontent

- Swift Charts
- VectorizedRulePlotContent

Structure

# VectorizedRulePlotContent

An opaque vectorized chart content type.

@MainActor @preconcurrency

## Overview

Don’t use this type directly. Swift Charts automatically instantiates and consumes values of this type.

## Relationships

### Conforms To

- `ChartContent`
- `Sendable`
- `SendableMetatype`
- `VectorizedChartContent`

---

# https://developer.apple.com/documentation/charts/vectorizedsectorplotcontent

- Swift Charts
- VectorizedSectorPlotContent

Structure

# VectorizedSectorPlotContent

An opaque vectorized chart content type.

@MainActor @preconcurrency

## Overview

Don’t use this type directly. Swift Charts automatically instantiates and consumes values of this type.

## Relationships

### Conforms To

- `ChartContent`
- `Sendable`
- `SendableMetatype`
- `VectorizedChartContent`

---

