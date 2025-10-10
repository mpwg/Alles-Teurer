<!--
Downloaded via https://llm.codes by @steipete on September 24, 2025 at 07:55 PM
Source URL: https://developer.apple.com/documentation/Symbols
Total pages processed: 162
URLs filtered: Yes
Content de-duplicated: Yes
Availability strings filtered: Yes
Code blocks only: No
-->

# https://developer.apple.com/documentation/Symbols

Framework

# Symbols

Apply universal animations to symbol-based images.

## Overview

The Symbols framework provides access to symbol effects you can use to animate SF Symbols in your AppKit, UIKit, and SwiftUI apps. These animations exhibit different behaviors:

Discrete

An effect that runs from start to finish.

Indefinite

An effect that lasts until you remove or disable it.

Transition

An effect that animates a symbol in or out of visibility.

Content Transition

An effect that replaces one symbol with another symbol, or with a different configuration of itself.

A symbol effect can exhibit multiple types of behavior. For instance, you can add a pulse effect with an option to occur a finite number of times — a discrete behavior. You can also add a pulse effect with an option to loop forever — an indefinite behavior.

// Add an effect in SwiftUI.
Image(systemName: "globe")
// Add effect with discrete behavior to image view.
.symbolEffect(.pulse, options: .repeat(3))

Image(systemName: "globe")
// Add effect with indefinite behavior to image view.
.symbolEffect(.pulse)

You can apply universal animation effects to symbol-based images that you display in image views. The Symbols framework provides a consistent set of effects to use regardless of your UI framework or langauge choices.

Consider a SwiftUI app that displays a variable color effect on a Wi-Fi symbol while the system searches for Wi-Fi networks.

// Add an effect in SwiftUI.
Image(systemName: "wifi")
.symbolEffect(.variableColor.reversing)

Now consider an AppKit or UIKit version of the app. You can apply the same effect to animate the search for Wi-Fi networks.

// Add an effect in AppKit and UIKit.
imageView.addSymbolEffect(.variableColor.reversing)

// Add an effect in AppKit and UIKit.
[self.imageView\
addSymbolEffect:[[NSSymbolVariableColorEffect effect] effectWithReversing]];

## Topics

### Symbol effects

`static var appear: AppearSymbolEffect`

An animation that makes the layers of a symbol-based image appear separately or as a whole.

`static var bounce: BounceSymbolEffect`

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`static var disappear: DisappearSymbolEffect`

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

`static var pulse: PulseSymbolEffect`

An animation that fades the opacity of some or all layers in a symbol-based image.

`static var scale: ScaleSymbolEffect`

An animation that scales the layers in a symbol-based image separately or as a whole.

`static var variableColor: VariableColorSymbolEffect`

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

### Symbol content transitions

`static var replace: ReplaceSymbolEffect`

An animation that replaces the layers of one symbol-based image with those of another.

`static var automatic: AutomaticSymbolEffect`

A transition that applies the default animation to a symbol-based image in a context-sensitive manner.

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

### Symbol effect options

`struct SymbolEffectOptions`

Options that configure how effects apply to symbol-based images.

### Symbol effect protocols

`protocol SymbolEffect`

A presentation effect that you apply to a symbol-based image.

`protocol DiscreteSymbolEffect`

An effect that performs a transient animation.

`protocol IndefiniteSymbolEffect`

An animation that continually affects a symbol until it’s disabled or removed.

`protocol ContentTransitionSymbolEffect`

An effect that animates between symbols or different configurations of the same symbol.

`protocol TransitionSymbolEffect`

An effect that animates a symbol in or out.

### Structures

`struct DrawOffSymbolEffect`

A symbol effect that applies the DrawOff animation to symbol images.

`struct DrawOnSymbolEffect`

A symbol effect that applies the DrawOn animation to symbol images.

---

# https://developer.apple.com/documentation/symbols/symboleffect/appear

- Symbols
- SymbolEffect
- appear

Type Property

# appear

An animation that makes the layers of a symbol-based image appear separately or as a whole.

Mac Catalyst

static var appear: AppearSymbolEffect { get }

Available when `Self` is `AppearSymbolEffect`.

## See Also

### Symbol effects

`static var bounce: BounceSymbolEffect`

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`static var disappear: DisappearSymbolEffect`

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

`static var pulse: PulseSymbolEffect`

An animation that fades the opacity of some or all layers in a symbol-based image.

`static var scale: ScaleSymbolEffect`

An animation that scales the layers in a symbol-based image separately or as a whole.

`static var variableColor: VariableColorSymbolEffect`

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

---

# https://developer.apple.com/documentation/symbols/symboleffect/bounce

- Symbols
- SymbolEffect
- bounce

Type Property

# bounce

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

Mac Catalyst

static var bounce: BounceSymbolEffect { get }

Available when `Self` is `BounceSymbolEffect`.

## See Also

### Symbol effects

`static var appear: AppearSymbolEffect`

An animation that makes the layers of a symbol-based image appear separately or as a whole.

`static var disappear: DisappearSymbolEffect`

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

`static var pulse: PulseSymbolEffect`

An animation that fades the opacity of some or all layers in a symbol-based image.

`static var scale: ScaleSymbolEffect`

An animation that scales the layers in a symbol-based image separately or as a whole.

`static var variableColor: VariableColorSymbolEffect`

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

---

# https://developer.apple.com/documentation/symbols/symboleffect/disappear

- Symbols
- SymbolEffect
- disappear

Type Property

# disappear

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

Mac Catalyst

static var disappear: DisappearSymbolEffect { get }

Available when `Self` is `DisappearSymbolEffect`.

## See Also

### Symbol effects

`static var appear: AppearSymbolEffect`

An animation that makes the layers of a symbol-based image appear separately or as a whole.

`static var bounce: BounceSymbolEffect`

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`static var pulse: PulseSymbolEffect`

An animation that fades the opacity of some or all layers in a symbol-based image.

`static var scale: ScaleSymbolEffect`

An animation that scales the layers in a symbol-based image separately or as a whole.

`static var variableColor: VariableColorSymbolEffect`

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

---

# https://developer.apple.com/documentation/symbols/symboleffect/pulse

- Symbols
- SymbolEffect
- pulse

Type Property

# pulse

An animation that fades the opacity of some or all layers in a symbol-based image.

Mac Catalyst

static var pulse: PulseSymbolEffect { get }

Available when `Self` is `PulseSymbolEffect`.

## See Also

### Symbol effects

`static var appear: AppearSymbolEffect`

An animation that makes the layers of a symbol-based image appear separately or as a whole.

`static var bounce: BounceSymbolEffect`

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`static var disappear: DisappearSymbolEffect`

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

`static var scale: ScaleSymbolEffect`

An animation that scales the layers in a symbol-based image separately or as a whole.

`static var variableColor: VariableColorSymbolEffect`

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

---

# https://developer.apple.com/documentation/symbols/symboleffect/scale

- Symbols
- SymbolEffect
- scale

Type Property

# scale

An animation that scales the layers in a symbol-based image separately or as a whole.

Mac Catalyst

static var scale: ScaleSymbolEffect { get }

Available when `Self` is `ScaleSymbolEffect`.

## See Also

### Symbol effects

`static var appear: AppearSymbolEffect`

An animation that makes the layers of a symbol-based image appear separately or as a whole.

`static var bounce: BounceSymbolEffect`

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`static var disappear: DisappearSymbolEffect`

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

`static var pulse: PulseSymbolEffect`

An animation that fades the opacity of some or all layers in a symbol-based image.

`static var variableColor: VariableColorSymbolEffect`

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

---

# https://developer.apple.com/documentation/symbols/symboleffect/variablecolor

- Symbols
- SymbolEffect
- variableColor

Type Property

# variableColor

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

Mac Catalyst

static var variableColor: VariableColorSymbolEffect { get }

Available when `Self` is `VariableColorSymbolEffect`.

## See Also

### Symbol effects

`static var appear: AppearSymbolEffect`

An animation that makes the layers of a symbol-based image appear separately or as a whole.

`static var bounce: BounceSymbolEffect`

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`static var disappear: DisappearSymbolEffect`

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

`static var pulse: PulseSymbolEffect`

An animation that fades the opacity of some or all layers in a symbol-based image.

`static var scale: ScaleSymbolEffect`

An animation that scales the layers in a symbol-based image separately or as a whole.

---

# https://developer.apple.com/documentation/symbols/symboleffect/replace

- Symbols
- SymbolEffect
- replace

Type Property

# replace

An animation that replaces the layers of one symbol-based image with those of another.

Mac Catalyst

static var replace: ReplaceSymbolEffect { get }

Available when `Self` is `ReplaceSymbolEffect`.

## See Also

### Symbol content transitions

`static var automatic: AutomaticSymbolEffect`

A transition that applies the default animation to a symbol-based image in a context-sensitive manner.

---

# https://developer.apple.com/documentation/symbols/symboleffect/automatic

- Symbols
- SymbolEffect
- automatic

Type Property

# automatic

A transition that applies the default animation to a symbol-based image in a context-sensitive manner.

Mac Catalyst

static var automatic: AutomaticSymbolEffect { get }

Available when `Self` is `AutomaticSymbolEffect`.

## See Also

### Symbol content transitions

`static var replace: ReplaceSymbolEffect`

An animation that replaces the layers of one symbol-based image with those of another.

---

# https://developer.apple.com/documentation/symbols/appearsymboleffect

- Symbols
- AppearSymbolEffect

Structure

# AppearSymbolEffect

A type that makes the layers of a symbol-based image appear separately or as a whole.

Mac Catalyst

struct AppearSymbolEffect

## Overview

An appear transition causes a symbol to become visible using a scaling animation. You can choose to scale the image up or down and to animate the symbol by individual layers or as a whole.

## Topics

### Accessing symbol effects

`var down: AppearSymbolEffect`

An effect that makes the symbol scale down as it appears.

`var up: AppearSymbolEffect`

An effect that makes the symbol scale up as it appears.

### Determining effect scope

`var byLayer: AppearSymbolEffect`

An effect that makes each layer appear separately.

`var wholeSymbol: AppearSymbolEffect`

An effect that makes all layers appear simultaneously.

### Accessing the configuration

`var configuration: SymbolEffectConfiguration`

The configuration for the effect.

## Relationships

### Conforms To

- `Copyable`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`
- `TransitionSymbolEffect`

## See Also

### Symbol effect types

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/automaticsymboleffect

- Symbols
- AutomaticSymbolEffect

Structure

# AutomaticSymbolEffect

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

Mac Catalyst

struct AutomaticSymbolEffect

## Topics

### Accessing the configuration

`var configuration: SymbolEffectConfiguration`

The configuration for the effect.

## Relationships

### Conforms To

- `ContentTransitionSymbolEffect`
- `Copyable`
- `Equatable`
- `Hashable`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`
- `TransitionSymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/bouncesymboleffect



---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect

- Symbols
- DisappearSymbolEffect

Structure

# DisappearSymbolEffect

A type that makes the layers of a symbol-based image disappear separately or as a whole.

Mac Catalyst

struct DisappearSymbolEffect

## Overview

A disappear transition causes a symbol to become invisible using a scaling animation. You can choose to scale the image up or down and to animate the symbol by individual layers or as a whole.

## Topics

### Accessing symbol effects

`var down: DisappearSymbolEffect`

An effect that scales the symbol down as it disappears.

`var up: DisappearSymbolEffect`

An effect that scales the symbol up as it disappears.

### Determining effect scope

`var byLayer: DisappearSymbolEffect`

An effect that makes each layer disappear separately.

`var wholeSymbol: DisappearSymbolEffect`

An effect that makes all layers disappear simultaneously.

### Accessing the configuration

`var configuration: SymbolEffectConfiguration`

The configuration for the effect.

## Relationships

### Conforms To

- `Copyable`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`
- `TransitionSymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/pulsesymboleffect

- Symbols
- PulseSymbolEffect

Structure

# PulseSymbolEffect

A type that fades the opacity of some or all layers in a symbol-based image.

Mac Catalyst

struct PulseSymbolEffect

## Overview

A pulse animation applies an opacity ramp to the layers in a symbol. You can choose to animate only layers marked as “always-pulses” or all layers simultaneously. Participating layers reduce their opacity to a minimum value before returning to fully opaque.

// Add an effect in SwiftUI.
@State private var value1 = 0
@State private var value2 = 0
var body: some View {
HStack {
Image(systemName: "person.text.rectangle")
// Pulse only layers marked as "always-pulse."
.symbolEffect(.pulse, value: value1)
.onTapGesture {
value1 += 1
}
Image(systemName: "person.text.rectangle")
// Pulse all layers three times simultaneously.
.symbolEffect(.pulse.wholeSymbol, options: .repeat(3), value: value2)
.onTapGesture {
value2 += 1
}
}
}

// Add an effect in AppKit and UIKit.
// Pulse only layers marked as "always-pulse."
imageView1.addSymbolEffect(.pulse.byLayer, options: .nonRepeating)

// Pulse all layers three times simultaneously.
imageView2.addSymbolEffect(.pulse.wholeSymbol, options: .repeat(3))

## Topics

### Determining effect scope

`var byLayer: PulseSymbolEffect`

An effect requesting an animation that pulses only the layers marked to always pulse.

`var wholeSymbol: PulseSymbolEffect`

An effect requesting an animation that pulses all layers simultaneously.

### Accessing the configuration

`var configuration: SymbolEffectConfiguration`

The configuration for the effect.

## Relationships

### Conforms To

- `Copyable`
- `DiscreteSymbolEffect`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect

- Symbols
- ReplaceSymbolEffect

Structure

# ReplaceSymbolEffect

A type that replaces the layers of one symbol-based image with those of another.

Mac Catalyst

struct ReplaceSymbolEffect

## Overview

A replace transition animates the change from one symbol image to another. You choose from one of the predefined scaling animations: Down-Up, Off-Up, and Up-Up.

Down-Up

The initial symbol scales down as it’s removed, and the new symbol scales up as it’s added.

Off-Up

The initial symbol is removed with no animation, and the new symbol scales up as it’s added.

Up-Up

The initial symbol scales up as it’s removed, and the new symbol scales up as it’s added.

## Topics

### Accessing symbol effects

`var downUp: ReplaceSymbolEffect`

An effect that replaces a symbol by scaling it down, and scaling a different symbol up.

`var offUp: ReplaceSymbolEffect`

An effect that replaces a symbol by removing it, and scaling a different symbol up.

`var upUp: ReplaceSymbolEffect`

An effect that replaces a symbol by scaling it up, and scaling a different symbol up.

### Determining effect scope

`var byLayer: ReplaceSymbolEffect`

An effect that replaces each layer separately.

`var wholeSymbol: ReplaceSymbolEffect`

An effect that replaces all layers simultaneously.

### Accessing the configuration

`var configuration: SymbolEffectConfiguration`

The configuration for the effect.

### Structures

`struct MagicReplace`

### Type Properties

`static var downUp: ReplaceSymbolEffect`

`static var offUp: ReplaceSymbolEffect`

`static var upUp: ReplaceSymbolEffect`

## Relationships

### Conforms To

- `ContentTransitionSymbolEffect`
- `Copyable`
- `Equatable`
- `Hashable`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/scalesymboleffect

- Symbols
- ScaleSymbolEffect

Structure

# ScaleSymbolEffect

A type that scales the layers in a symbol-based image separately or as a whole.

Mac Catalyst

struct ScaleSymbolEffect

## Overview

A scale animation draws attention to a symbol by changing the symbol’s scale indefinitely. You can choose to scale the symbol up or down.

## Topics

### Accessing symbol effects

`var down: ScaleSymbolEffect`

An effect that scales the symbol down.

`var up: ScaleSymbolEffect`

An effect that scales the symbol up.

### Determining effect scope

`var byLayer: ScaleSymbolEffect`

An effect that scales each layer separately.

`var wholeSymbol: ScaleSymbolEffect`

An effect that scales all layers simultaneously.

### Accessing the configuration

`var configuration: SymbolEffectConfiguration`

The configuration for the effect.

## Relationships

### Conforms To

- `Copyable`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/variablecolorsymboleffect

- Symbols
- VariableColorSymbolEffect

Structure

# VariableColorSymbolEffect

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

Mac Catalyst

struct VariableColorSymbolEffect

## Overview

A variable color animation draws attention to a symbol by changing the opacity of the symbol’s layers. You can choose to apply the effect to layers either cumulatively or iteratively. For cumulative animations, each layer’s opacity remains changed until the end of the animation cycle. For iterative animations, each layer’s opacity changes briefly before returning to its original state.

// Add an effect in SwiftUI.
@State private var value1 = 0
@State private var value2 = 0
var body: some View {
HStack {
Image(systemName: "cellularbars")
// Iteratively activates layers.
.symbolEffect(.variableColor.iterative, value: value1)
.onTapGesture {
value1 += 1
}
Image(systemName: "cellularbars")
// Cumulatively activates layers reversing and repeating three times.
.symbolEffect(.variableColor.hideInactiveLayers.reversing, options: .repeat(3), value: value2)
.onTapGesture {
value2 += 1
}
}
}

// Add an effect in AppKit and UIKit.
// Iteratively activates layers.
imageView1.addSymbolEffect(.variableColor.iterative, options: .nonRepeating)

// Cumulatively activates layers reversing and repeating three times.
imageView2.addSymbolEffect(.variableColor.hideInactiveLayers.cumulative, options: .repeat(3))

## Topics

### Controlling fill style

`var cumulative: VariableColorSymbolEffect`

An effect that enables each layer of a symbol-based image in sequence.

`var iterative: VariableColorSymbolEffect`

An effect that momentarily enables each layer of a symbol-based image in sequence.

### Changing playback style

`var nonReversing: VariableColorSymbolEffect`

An effect that doesn’t reverse each time it repeats.

`var reversing: VariableColorSymbolEffect`

An effect that reverses each time it repeats.

### Affecting inactive layers

`var dimInactiveLayers: VariableColorSymbolEffect`

An effect that dims inactive layers in a symbol-based image.

`var hideInactiveLayers: VariableColorSymbolEffect`

An effect that hides inactive layers in a symbol-based image.

### Accessing the configuration

`var configuration: SymbolEffectConfiguration`

The configuration for the effect.

## Relationships

### Conforms To

- `Copyable`
- `DiscreteSymbolEffect`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/breathesymboleffect

- Symbols
- BreatheSymbolEffect

Structure

# BreatheSymbolEffect

Mac Catalyst

struct BreatheSymbolEffect

## Topics

### Instance Properties

`var byLayer: BreatheSymbolEffect`

`var configuration: SymbolEffectConfiguration`

`var plain: BreatheSymbolEffect`

`var pulse: BreatheSymbolEffect`

`var wholeSymbol: BreatheSymbolEffect`

## Relationships

### Conforms To

- `Copyable`
- `DiscreteSymbolEffect`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect

- Symbols
- RotateSymbolEffect

Structure

# RotateSymbolEffect

Mac Catalyst

struct RotateSymbolEffect

## Topics

### Instance Properties

`var byLayer: RotateSymbolEffect`

`var clockwise: RotateSymbolEffect`

`var configuration: SymbolEffectConfiguration`

`var counterClockwise: RotateSymbolEffect`

`var wholeSymbol: RotateSymbolEffect`

## Relationships

### Conforms To

- `Copyable`
- `DiscreteSymbolEffect`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct WiggleSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect

- Symbols
- WiggleSymbolEffect

Structure

# WiggleSymbolEffect

Mac Catalyst

struct WiggleSymbolEffect

## Topics

### Instance Properties

`var backward: WiggleSymbolEffect`

`var byLayer: WiggleSymbolEffect`

`var clockwise: WiggleSymbolEffect`

`var configuration: SymbolEffectConfiguration`

`var counterClockwise: WiggleSymbolEffect`

`var down: WiggleSymbolEffect`

`var forward: WiggleSymbolEffect`

`var left: WiggleSymbolEffect`

`var right: WiggleSymbolEffect`

`var up: WiggleSymbolEffect`

`var wholeSymbol: WiggleSymbolEffect`

## Relationships

### Conforms To

- `Copyable`
- `DiscreteSymbolEffect`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`

## See Also

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/symboleffectoptions



---

# https://developer.apple.com/documentation/symbols/symboleffect

- Symbols
- SymbolEffect

Protocol

# SymbolEffect

A presentation effect that you apply to a symbol-based image.

Mac Catalyst

protocol SymbolEffect : Hashable, Sendable

## Topics

### Effects

`static var appear: AppearSymbolEffect`

An animation that makes the layers of a symbol-based image appear separately or as a whole.

`static var bounce: BounceSymbolEffect`

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`static var disappear: DisappearSymbolEffect`

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

`static var pulse: PulseSymbolEffect`

An animation that fades the opacity of some or all layers in a symbol-based image.

`static var scale: ScaleSymbolEffect`

An animation that scales the layers in a symbol-based image separately or as a whole.

`static var variableColor: VariableColorSymbolEffect`

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`static var breathe: BreatheSymbolEffect`

`static var rotate: RotateSymbolEffect`

`static var wiggle: WiggleSymbolEffect`

### Accessing the configuration

`var configuration: SymbolEffectConfiguration`

A configuration for a symbol effect.

**Required**

`struct SymbolEffectConfiguration`

A type that specifies the configuration of a symbol effect.

### Type Properties

`static var automatic: AutomaticSymbolEffect`

A transition that applies the default animation to a symbol-based image in a context-sensitive manner.

`static var drawOff: DrawOffSymbolEffect`

A symbol effect that applies the DrawOff animation to symbol images.

`static var drawOn: DrawOnSymbolEffect`

A symbol effect that applies the DrawOn animation to symbol images.

`static var replace: ReplaceSymbolEffect`

An animation that replaces the layers of one symbol-based image with those of another.

## Relationships

### Inherits From

- `Equatable`
- `Hashable`
- `Sendable`
- `SendableMetatype`

### Conforming Types

- `AppearSymbolEffect`
- `AutomaticSymbolEffect`
- `BounceSymbolEffect`
- `BreatheSymbolEffect`
- `DisappearSymbolEffect`
- `DrawOffSymbolEffect`
- `DrawOnSymbolEffect`
- `PulseSymbolEffect`
- `ReplaceSymbolEffect`
- `ReplaceSymbolEffect.MagicReplace`
- `RotateSymbolEffect`
- `ScaleSymbolEffect`
- `VariableColorSymbolEffect`
- `WiggleSymbolEffect`

## See Also

### Symbol effect protocols

`protocol DiscreteSymbolEffect`

An effect that performs a transient animation.

`protocol IndefiniteSymbolEffect`

An animation that continually affects a symbol until it’s disabled or removed.

`protocol ContentTransitionSymbolEffect`

An effect that animates between symbols or different configurations of the same symbol.

`protocol TransitionSymbolEffect`

An effect that animates a symbol in or out.

---

# https://developer.apple.com/documentation/symbols/discretesymboleffect

- Symbols
- DiscreteSymbolEffect

Protocol

# DiscreteSymbolEffect

An effect that performs a transient animation.

Mac Catalyst

protocol DiscreteSymbolEffect

## Relationships

### Conforming Types

- `BounceSymbolEffect`
- `BreatheSymbolEffect`
- `PulseSymbolEffect`
- `RotateSymbolEffect`
- `VariableColorSymbolEffect`
- `WiggleSymbolEffect`

## See Also

### Symbol effect protocols

`protocol SymbolEffect`

A presentation effect that you apply to a symbol-based image.

`protocol IndefiniteSymbolEffect`

An animation that continually affects a symbol until it’s disabled or removed.

`protocol ContentTransitionSymbolEffect`

An effect that animates between symbols or different configurations of the same symbol.

`protocol TransitionSymbolEffect`

An effect that animates a symbol in or out.

---

# https://developer.apple.com/documentation/symbols/indefinitesymboleffect

- Symbols
- IndefiniteSymbolEffect

Protocol

# IndefiniteSymbolEffect

An animation that continually affects a symbol until it’s disabled or removed.

Mac Catalyst

protocol IndefiniteSymbolEffect

## Relationships

### Conforming Types

- `AppearSymbolEffect`
- `BounceSymbolEffect`
- `BreatheSymbolEffect`
- `DisappearSymbolEffect`
- `DrawOffSymbolEffect`
- `DrawOnSymbolEffect`
- `PulseSymbolEffect`
- `RotateSymbolEffect`
- `ScaleSymbolEffect`
- `VariableColorSymbolEffect`
- `WiggleSymbolEffect`

## See Also

### Symbol effect protocols

`protocol SymbolEffect`

A presentation effect that you apply to a symbol-based image.

`protocol DiscreteSymbolEffect`

An effect that performs a transient animation.

`protocol ContentTransitionSymbolEffect`

An effect that animates between symbols or different configurations of the same symbol.

`protocol TransitionSymbolEffect`

An effect that animates a symbol in or out.

---

# https://developer.apple.com/documentation/symbols/contenttransitionsymboleffect

- Symbols
- ContentTransitionSymbolEffect

Protocol

# ContentTransitionSymbolEffect

An effect that animates between symbols or different configurations of the same symbol.

Mac Catalyst

protocol ContentTransitionSymbolEffect

## Relationships

### Conforming Types

- `AutomaticSymbolEffect`
- `ReplaceSymbolEffect`
- `ReplaceSymbolEffect.MagicReplace`

## See Also

### Symbol effect protocols

`protocol SymbolEffect`

A presentation effect that you apply to a symbol-based image.

`protocol DiscreteSymbolEffect`

An effect that performs a transient animation.

`protocol IndefiniteSymbolEffect`

An animation that continually affects a symbol until it’s disabled or removed.

`protocol TransitionSymbolEffect`

An effect that animates a symbol in or out.

---

# https://developer.apple.com/documentation/symbols/transitionsymboleffect

- Symbols
- TransitionSymbolEffect

Protocol

# TransitionSymbolEffect

An effect that animates a symbol in or out.

Mac Catalyst

protocol TransitionSymbolEffect

## Relationships

### Conforming Types

- `AppearSymbolEffect`
- `AutomaticSymbolEffect`
- `DisappearSymbolEffect`
- `DrawOffSymbolEffect`
- `DrawOnSymbolEffect`

## See Also

### Symbol effect protocols

`protocol SymbolEffect`

A presentation effect that you apply to a symbol-based image.

`protocol DiscreteSymbolEffect`

An effect that performs a transient animation.

`protocol IndefiniteSymbolEffect`

An animation that continually affects a symbol until it’s disabled or removed.

`protocol ContentTransitionSymbolEffect`

An effect that animates between symbols or different configurations of the same symbol.

---

# https://developer.apple.com/documentation/symbols/drawoffsymboleffect



---

# https://developer.apple.com/documentation/symbols/drawonsymboleffect

- Symbols
- DrawOnSymbolEffect

Structure

# DrawOnSymbolEffect

A symbol effect that applies the DrawOn animation to symbol images.

Mac Catalyst

struct DrawOnSymbolEffect

## Overview

The DrawOn animation makes the symbol visible either as a whole, or one motion group at a time, animating parts of the symbol with draw data.

## Topics

### Instance Properties

`var byLayer: DrawOnSymbolEffect`

Returns a copy of the effect requesting an animation that applies separately to each motion group.

`var configuration: SymbolEffectConfiguration`

The configuration for the effect.

`var individually: DrawOnSymbolEffect`

Returns a copy of the effect requesting an animation that applies separately to each motion group, where only one motion group is active at a time.

`var wholeSymbol: DrawOnSymbolEffect`

Returns a copy of the effect requesting an animation that applies to all motion groups simultaneously.

## Relationships

### Conforms To

- `Copyable`
- `Equatable`
- `Hashable`
- `IndefiniteSymbolEffect`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`
- `TransitionSymbolEffect`

---

# https://developer.apple.com/documentation/symbols/symboleffect/appear)



---

# https://developer.apple.com/documentation/symbols/symboleffect/bounce)



---

# https://developer.apple.com/documentation/symbols/symboleffect/disappear)



---

# https://developer.apple.com/documentation/symbols/symboleffect/pulse)



---

# https://developer.apple.com/documentation/symbols/symboleffect/scale)



---

# https://developer.apple.com/documentation/symbols/symboleffect/variablecolor)



---

# https://developer.apple.com/documentation/symbols/symboleffect/replace)



---

# https://developer.apple.com/documentation/symbols/symboleffect/automatic)



---

# https://developer.apple.com/documentation/symbols/appearsymboleffect)



---

# https://developer.apple.com/documentation/symbols/automaticsymboleffect)



---

# https://developer.apple.com/documentation/symbols/bouncesymboleffect)



---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect)



---

# https://developer.apple.com/documentation/symbols/pulsesymboleffect)



---

# https://developer.apple.com/documentation/symbols/replacesymboleffect)



---

# https://developer.apple.com/documentation/symbols/scalesymboleffect)



---

# https://developer.apple.com/documentation/symbols/variablecolorsymboleffect)



---

# https://developer.apple.com/documentation/symbols/breathesymboleffect)



---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect)



---

# https://developer.apple.com/documentation/symbols/symboleffectoptions)



---

# https://developer.apple.com/documentation/symbols/symboleffect)



---

# https://developer.apple.com/documentation/symbols/discretesymboleffect)



---

# https://developer.apple.com/documentation/symbols/indefinitesymboleffect)



---

# https://developer.apple.com/documentation/symbols/contenttransitionsymboleffect)



---

# https://developer.apple.com/documentation/symbols/transitionsymboleffect)



---

# https://developer.apple.com/documentation/symbols/drawoffsymboleffect)



---

# https://developer.apple.com/documentation/symbols/drawonsymboleffect)



---

# https://developer.apple.com/documentation/symbols

Framework

# Symbols

Apply universal animations to symbol-based images.

## Overview

The Symbols framework provides access to symbol effects you can use to animate SF Symbols in your AppKit, UIKit, and SwiftUI apps. These animations exhibit different behaviors:

Discrete

An effect that runs from start to finish.

Indefinite

An effect that lasts until you remove or disable it.

Transition

An effect that animates a symbol in or out of visibility.

Content Transition

An effect that replaces one symbol with another symbol, or with a different configuration of itself.

A symbol effect can exhibit multiple types of behavior. For instance, you can add a pulse effect with an option to occur a finite number of times — a discrete behavior. You can also add a pulse effect with an option to loop forever — an indefinite behavior.

// Add an effect in SwiftUI.
Image(systemName: "globe")
// Add effect with discrete behavior to image view.
.symbolEffect(.pulse, options: .repeat(3))

Image(systemName: "globe")
// Add effect with indefinite behavior to image view.
.symbolEffect(.pulse)

You can apply universal animation effects to symbol-based images that you display in image views. The Symbols framework provides a consistent set of effects to use regardless of your UI framework or langauge choices.

Consider a SwiftUI app that displays a variable color effect on a Wi-Fi symbol while the system searches for Wi-Fi networks.

// Add an effect in SwiftUI.
Image(systemName: "wifi")
.symbolEffect(.variableColor.reversing)

Now consider an AppKit or UIKit version of the app. You can apply the same effect to animate the search for Wi-Fi networks.

// Add an effect in AppKit and UIKit.
imageView.addSymbolEffect(.variableColor.reversing)

// Add an effect in AppKit and UIKit.
[self.imageView\
addSymbolEffect:[[NSSymbolVariableColorEffect effect] effectWithReversing]];

## Topics

### Symbol effects

`static var appear: AppearSymbolEffect`

An animation that makes the layers of a symbol-based image appear separately or as a whole.

`static var bounce: BounceSymbolEffect`

An animation that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`static var disappear: DisappearSymbolEffect`

An animation that makes the layers of a symbol-based image disappear separately or as a whole.

`static var pulse: PulseSymbolEffect`

An animation that fades the opacity of some or all layers in a symbol-based image.

`static var scale: ScaleSymbolEffect`

An animation that scales the layers in a symbol-based image separately or as a whole.

`static var variableColor: VariableColorSymbolEffect`

An animation that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

### Symbol content transitions

`static var replace: ReplaceSymbolEffect`

An animation that replaces the layers of one symbol-based image with those of another.

`static var automatic: AutomaticSymbolEffect`

A transition that applies the default animation to a symbol-based image in a context-sensitive manner.

### Symbol effect types

`struct AppearSymbolEffect`

A type that makes the layers of a symbol-based image appear separately or as a whole.

`struct AutomaticSymbolEffect`

A type that applies the default animation to a symbol-based image in a context-sensitive manner.

`struct BounceSymbolEffect`

A type that applies a transitory scaling effect, or bounce, to the layers in a symbol-based image separately or as a whole.

`struct DisappearSymbolEffect`

A type that makes the layers of a symbol-based image disappear separately or as a whole.

`struct PulseSymbolEffect`

A type that fades the opacity of some or all layers in a symbol-based image.

`struct ReplaceSymbolEffect`

A type that replaces the layers of one symbol-based image with those of another.

`struct ScaleSymbolEffect`

A type that scales the layers in a symbol-based image separately or as a whole.

`struct VariableColorSymbolEffect`

A type that replaces the opacity of variable layers in a symbol-based image in a repeatable sequence.

`struct BreatheSymbolEffect`

`struct RotateSymbolEffect`

`struct WiggleSymbolEffect`

### Symbol effect options

`struct SymbolEffectOptions`

Options that configure how effects apply to symbol-based images.

### Symbol effect protocols

`protocol SymbolEffect`

A presentation effect that you apply to a symbol-based image.

`protocol DiscreteSymbolEffect`

An effect that performs a transient animation.

`protocol IndefiniteSymbolEffect`

An animation that continually affects a symbol until it’s disabled or removed.

`protocol ContentTransitionSymbolEffect`

An effect that animates between symbols or different configurations of the same symbol.

`protocol TransitionSymbolEffect`

An effect that animates a symbol in or out.

### Structures

`struct DrawOffSymbolEffect`

A symbol effect that applies the DrawOff animation to symbol images.

`struct DrawOnSymbolEffect`

A symbol effect that applies the DrawOn animation to symbol images.

---

# https://developer.apple.com/documentation/symbols/automaticsymboleffect/configuration

- Symbols
- AutomaticSymbolEffect
- configuration

Instance Property

# configuration

The configuration for the effect.

Mac Catalyst

var configuration: SymbolEffectConfiguration { get }

---

# https://developer.apple.com/documentation/symbols/automaticsymboleffect/configuration)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/down

- Symbols
- AppearSymbolEffect
- down

Instance Property

# down

An effect that makes the symbol scale down as it appears.

Mac Catalyst

var down: AppearSymbolEffect { get }

## See Also

### Accessing symbol effects

`var up: AppearSymbolEffect`

An effect that makes the symbol scale up as it appears.

---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/up



---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/bylayer

- Symbols
- AppearSymbolEffect
- byLayer

Instance Property

# byLayer

An effect that makes each layer appear separately.

Mac Catalyst

var byLayer: AppearSymbolEffect { get }

## See Also

### Determining effect scope

`var wholeSymbol: AppearSymbolEffect`

An effect that makes all layers appear simultaneously.

---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/wholesymbol

- Symbols
- AppearSymbolEffect
- wholeSymbol

Instance Property

# wholeSymbol

An effect that makes all layers appear simultaneously.

Mac Catalyst

var wholeSymbol: AppearSymbolEffect { get }

## See Also

### Determining effect scope

`var byLayer: AppearSymbolEffect`

An effect that makes each layer appear separately.

---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/configuration

- Symbols
- AppearSymbolEffect
- configuration

Instance Property

# configuration

The configuration for the effect.

Mac Catalyst

var configuration: SymbolEffectConfiguration { get }

---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/down)



---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/up)



---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/bylayer)



---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/wholesymbol)



---

# https://developer.apple.com/documentation/symbols/appearsymboleffect/configuration)



---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/down

- Symbols
- DisappearSymbolEffect
- down

Instance Property

# down

An effect that scales the symbol down as it disappears.

Mac Catalyst

var down: DisappearSymbolEffect { get }

## See Also

### Accessing symbol effects

`var up: DisappearSymbolEffect`

An effect that scales the symbol up as it disappears.

---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/up

- Symbols
- DisappearSymbolEffect
- up

Instance Property

# up

An effect that scales the symbol up as it disappears.

Mac Catalyst

var up: DisappearSymbolEffect { get }

## See Also

### Accessing symbol effects

`var down: DisappearSymbolEffect`

An effect that scales the symbol down as it disappears.

---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/bylayer

- Symbols
- DisappearSymbolEffect
- byLayer

Instance Property

# byLayer

An effect that makes each layer disappear separately.

Mac Catalyst

var byLayer: DisappearSymbolEffect { get }

## See Also

### Determining effect scope

`var wholeSymbol: DisappearSymbolEffect`

An effect that makes all layers disappear simultaneously.

---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/wholesymbol

- Symbols
- DisappearSymbolEffect
- wholeSymbol

Instance Property

# wholeSymbol

An effect that makes all layers disappear simultaneously.

Mac Catalyst

var wholeSymbol: DisappearSymbolEffect { get }

## See Also

### Determining effect scope

`var byLayer: DisappearSymbolEffect`

An effect that makes each layer disappear separately.

---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/configuration

- Symbols
- DisappearSymbolEffect
- configuration

Instance Property

# configuration

The configuration for the effect.

Mac Catalyst

var configuration: SymbolEffectConfiguration { get }

---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/down)



---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/up)



---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/bylayer)



---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/wholesymbol)



---

# https://developer.apple.com/documentation/symbols/disappearsymboleffect/configuration)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/bylayer

- Symbols
- BreatheSymbolEffect
- byLayer

Instance Property

# byLayer

Mac Catalyst

var byLayer: BreatheSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/configuration

- Symbols
- BreatheSymbolEffect
- configuration

Instance Property

# configuration

Mac Catalyst

var configuration: SymbolEffectConfiguration { get }

---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/plain

- Symbols
- BreatheSymbolEffect
- plain

Instance Property

# plain

Mac Catalyst

var plain: BreatheSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/pulse

- Symbols
- BreatheSymbolEffect
- pulse

Instance Property

# pulse

Mac Catalyst

var pulse: BreatheSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/wholesymbol

- Symbols
- BreatheSymbolEffect
- wholeSymbol

Instance Property

# wholeSymbol

Mac Catalyst

var wholeSymbol: BreatheSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/bylayer)



---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/configuration)



---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/plain)



---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/pulse)



---

# https://developer.apple.com/documentation/symbols/breathesymboleffect/wholesymbol)



---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/downup-swift.property

- Symbols
- ReplaceSymbolEffect
- downUp

Instance Property

# downUp

An effect that replaces a symbol by scaling it down, and scaling a different symbol up.

Mac Catalyst

var downUp: ReplaceSymbolEffect { get }

## Discussion

The initial symbol scales down as it’s removed, and the new symbol scales up as it’s added.

## See Also

### Accessing symbol effects

`var offUp: ReplaceSymbolEffect`

An effect that replaces a symbol by removing it, and scaling a different symbol up.

`var upUp: ReplaceSymbolEffect`

An effect that replaces a symbol by scaling it up, and scaling a different symbol up.

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/offup-swift.property

- Symbols
- ReplaceSymbolEffect
- offUp

Instance Property

# offUp

An effect that replaces a symbol by removing it, and scaling a different symbol up.

Mac Catalyst

var offUp: ReplaceSymbolEffect { get }

## Discussion

The initial symbol is removed with no animation, and the new symbol scales up as it’s added.

## See Also

### Accessing symbol effects

`var downUp: ReplaceSymbolEffect`

An effect that replaces a symbol by scaling it down, and scaling a different symbol up.

`var upUp: ReplaceSymbolEffect`

An effect that replaces a symbol by scaling it up, and scaling a different symbol up.

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/upup-swift.property

- Symbols
- ReplaceSymbolEffect
- upUp

Instance Property

# upUp

An effect that replaces a symbol by scaling it up, and scaling a different symbol up.

Mac Catalyst

var upUp: ReplaceSymbolEffect { get }

## Discussion

The initial symbol scales up as it’s removed, and the new symbol scales up as it’s added.

## See Also

### Accessing symbol effects

`var downUp: ReplaceSymbolEffect`

An effect that replaces a symbol by scaling it down, and scaling a different symbol up.

`var offUp: ReplaceSymbolEffect`

An effect that replaces a symbol by removing it, and scaling a different symbol up.

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/bylayer

- Symbols
- ReplaceSymbolEffect
- byLayer

Instance Property

# byLayer

An effect that replaces each layer separately.

Mac Catalyst

var byLayer: ReplaceSymbolEffect { get }

## See Also

### Determining effect scope

`var wholeSymbol: ReplaceSymbolEffect`

An effect that replaces all layers simultaneously.

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/wholesymbol

- Symbols
- ReplaceSymbolEffect
- wholeSymbol

Instance Property

# wholeSymbol

An effect that replaces all layers simultaneously.

Mac Catalyst

var wholeSymbol: ReplaceSymbolEffect { get }

## See Also

### Determining effect scope

`var byLayer: ReplaceSymbolEffect`

An effect that replaces each layer separately.

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/configuration

- Symbols
- ReplaceSymbolEffect
- configuration

Instance Property

# configuration

The configuration for the effect.

Mac Catalyst

var configuration: SymbolEffectConfiguration { get }

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/magicreplace

- Symbols
- ReplaceSymbolEffect
- ReplaceSymbolEffect.MagicReplace

Structure

# ReplaceSymbolEffect.MagicReplace

Mac Catalyst

struct MagicReplace

## Topics

### Instance Properties

`var configuration: SymbolEffectConfiguration`

## Relationships

### Conforms To

- `ContentTransitionSymbolEffect`
- `Copyable`
- `Equatable`
- `Hashable`
- `Sendable`
- `SendableMetatype`
- `SymbolEffect`

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/magic(fallback:)

#app-main)

- Symbols
- ReplaceSymbolEffect
- magic(fallback:)

Instance Method

# magic(fallback:)

Mac Catalyst

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/downup-swift.type.property

- Symbols
- ReplaceSymbolEffect
- downUp

Type Property

# downUp

Mac Catalyst

static var downUp: ReplaceSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/offup-swift.type.property

- Symbols
- ReplaceSymbolEffect
- offUp

Type Property

# offUp

Mac Catalyst

static var offUp: ReplaceSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/upup-swift.type.property

- Symbols
- ReplaceSymbolEffect
- upUp

Type Property

# upUp

Mac Catalyst

static var upUp: ReplaceSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/downup-swift.property)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/offup-swift.property)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/upup-swift.property)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/bylayer)



---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/wholesymbol)



---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/configuration)



---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/magicreplace)



---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/magic(fallback:))

)#app-main)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/downup-swift.type.property)



---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/offup-swift.type.property)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/replacesymboleffect/upup-swift.type.property)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/down



---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/up

- Symbols
- ScaleSymbolEffect
- up

Instance Property

# up

An effect that scales the symbol up.

Mac Catalyst

var up: ScaleSymbolEffect { get }

## See Also

### Accessing symbol effects

`var down: ScaleSymbolEffect`

An effect that scales the symbol down.

---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/bylayer

- Symbols
- ScaleSymbolEffect
- byLayer

Instance Property

# byLayer

An effect that scales each layer separately.

Mac Catalyst

var byLayer: ScaleSymbolEffect { get }

## See Also

### Determining effect scope

`var wholeSymbol: ScaleSymbolEffect`

An effect that scales all layers simultaneously.

---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/wholesymbol

- Symbols
- ScaleSymbolEffect
- wholeSymbol

Instance Property

# wholeSymbol

An effect that scales all layers simultaneously.

Mac Catalyst

var wholeSymbol: ScaleSymbolEffect { get }

## See Also

### Determining effect scope

`var byLayer: ScaleSymbolEffect`

An effect that scales each layer separately.

---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/configuration

- Symbols
- ScaleSymbolEffect
- configuration

Instance Property

# configuration

The configuration for the effect.

Mac Catalyst

var configuration: SymbolEffectConfiguration { get }

---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/down)



---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/up)



---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/bylayer)



---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/wholesymbol)



---

# https://developer.apple.com/documentation/symbols/scalesymboleffect/configuration)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/backward

- Symbols
- WiggleSymbolEffect
- backward

Instance Property

# backward

Mac Catalyst

var backward: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/bylayer

- Symbols
- WiggleSymbolEffect
- byLayer

Instance Property

# byLayer

Mac Catalyst

var byLayer: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/clockwise

- Symbols
- WiggleSymbolEffect
- clockwise

Instance Property

# clockwise

Mac Catalyst

var clockwise: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/configuration



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/counterclockwise

- Symbols
- WiggleSymbolEffect
- counterClockwise

Instance Property

# counterClockwise

Mac Catalyst

var counterClockwise: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/down

- Symbols
- WiggleSymbolEffect
- down

Instance Property

# down

Mac Catalyst

var down: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/forward

- Symbols
- WiggleSymbolEffect
- forward

Instance Property

# forward

Mac Catalyst

var forward: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/left



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/right

- Symbols
- WiggleSymbolEffect
- right

Instance Property

# right

Mac Catalyst

var right: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/up

- Symbols
- WiggleSymbolEffect
- up

Instance Property

# up

Mac Catalyst

var up: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/wholesymbol

- Symbols
- WiggleSymbolEffect
- wholeSymbol

Instance Property

# wholeSymbol

Mac Catalyst

var wholeSymbol: WiggleSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/custom(angle:)-1f09q

-1f09q#app-main)

- Symbols
- WiggleSymbolEffect
- custom(angle:)

Instance Method

# custom(angle:)

Mac Catalyst

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/custom(angle:)-cqpf

-cqpf#app-main)

- Symbols
- WiggleSymbolEffect
- custom(angle:)

Instance Method

# custom(angle:)

Mac Catalyst

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/backward)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/bylayer)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/clockwise)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/configuration)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/counterclockwise)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/down)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/forward)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/left)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/right)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/up)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/wholesymbol)



---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/custom(angle:)-1f09q)

-1f09q)#app-main)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/wigglesymboleffect/custom(angle:)-cqpf)

-cqpf)#app-main)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/bylayer

- Symbols
- RotateSymbolEffect
- byLayer

Instance Property

# byLayer

Mac Catalyst

var byLayer: RotateSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/clockwise

- Symbols
- RotateSymbolEffect
- clockwise

Instance Property

# clockwise

Mac Catalyst

var clockwise: RotateSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/configuration

- Symbols
- RotateSymbolEffect
- configuration

Instance Property

# configuration

Mac Catalyst

var configuration: SymbolEffectConfiguration { get }

---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/counterclockwise

- Symbols
- RotateSymbolEffect
- counterClockwise

Instance Property

# counterClockwise

Mac Catalyst

var counterClockwise: RotateSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/wholesymbol

- Symbols
- RotateSymbolEffect
- wholeSymbol

Instance Property

# wholeSymbol

Mac Catalyst

var wholeSymbol: RotateSymbolEffect { get }

---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/bylayer)



---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/clockwise)



---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/configuration)



---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/counterclockwise)

# The page you're looking for can't be found.

Search developer.apple.comSearch Icon

---

# https://developer.apple.com/documentation/symbols/rotatesymboleffect/wholesymbol)



---

# https://developer.apple.com/documentation/symbols/variablecolorsymboleffect/cumulative

- Symbols
- VariableColorSymbolEffect
- cumulative

Instance Property

# cumulative

An effect that enables each layer of a symbol-based image in sequence.

Mac Catalyst

var cumulative: VariableColorSymbolEffect { get }

## Discussion

This effect enables each successive variable layer, and the layer remains enabled until the end of the animation cycle. This effect cancels the `iterative` variant.

## See Also

### Controlling fill style

`var iterative: VariableColorSymbolEffect`

An effect that momentarily enables each layer of a symbol-based image in sequence.

---

# https://developer.apple.com/documentation/symbols/variablecolorsymboleffect/iterative

- Symbols
- VariableColorSymbolEffect
- iterative

Instance Property

# iterative

An effect that momentarily enables each layer of a symbol-based image in sequence.

Mac Catalyst

var iterative: VariableColorSymbolEffect { get }

## Discussion

This effect enables each successive variable layer for a short period of time, and then disables the layer until the animation cycle ends. This effect cancels the `cumulative` variant.

## See Also

### Controlling fill style

`var cumulative: VariableColorSymbolEffect`

An effect that enables each layer of a symbol-based image in sequence.

---

# https://developer.apple.com/documentation/symbols/variablecolorsymboleffect/nonreversing

- Symbols
- VariableColorSymbolEffect
- nonReversing

Instance Property

# nonReversing

An effect that doesn’t reverse each time it repeats.

Mac Catalyst

var nonReversing: VariableColorSymbolEffect { get }

## See Also

### Changing playback style

`var reversing: VariableColorSymbolEffect`

An effect that reverses each time it repeats.

---

# https://developer.apple.com/documentation/symbols/variablecolorsymboleffect/reversing

- Symbols
- VariableColorSymbolEffect
- reversing

Instance Property

# reversing

An effect that reverses each time it repeats.

Mac Catalyst

var reversing: VariableColorSymbolEffect { get }

## See Also

### Changing playback style

`var nonReversing: VariableColorSymbolEffect`

An effect that doesn’t reverse each time it repeats.

---

# https://developer.apple.com/documentation/symbols/variablecolorsymboleffect/diminactivelayers

- Symbols
- VariableColorSymbolEffect
- dimInactiveLayers

Instance Property

# dimInactiveLayers

An effect that dims inactive layers in a symbol-based image.

Mac Catalyst

var dimInactiveLayers: VariableColorSymbolEffect { get }

## Discussion

This effect draws inactive layers with reduced, but nonzero, opacity.

## See Also

### Affecting inactive layers

`var hideInactiveLayers: VariableColorSymbolEffect`

An effect that hides inactive layers in a symbol-based image.

---

# https://developer.apple.com/documentation/symbols/variablecolorsymboleffect/hideinactivelayers

- Symbols
- VariableColorSymbolEffect
- hideInactiveLayers

Instance Property

# hideInactiveLayers

An effect that hides inactive layers in a symbol-based image.

Mac Catalyst

var hideInactiveLayers: VariableColorSymbolEffect { get }

## Discussion

This effect hides inactive layers completely, rather than drawing them with reduced, but nonzero, opacity.

## See Also

### Affecting inactive layers

`var dimInactiveLayers: VariableColorSymbolEffect`

An effect that dims inactive layers in a symbol-based image.

---

