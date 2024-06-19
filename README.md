# Progress-bar

The progress bar component is used to display the length and your progression inside the process, or to express a waiting time. This waiting time can be either determinate or indeterminate.
- **Determinate progress bar**: We use this variant when the progress of a process is known.
- **Indeterminate progress bar**: We use this variant when the progress of a process is unknown.

## Specifications
The progress bar specifications on Zeroheight is [here](https://zeroheight.com/1186e1705/v/latest/p/89544a-progress-bar).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-progress-bar/blob/main/.github/assets/anatomy.png)

## Usage
Progress bar is available in SwiftUI.

### ProgressBarView

#### Progress Bar Single

Properties:
* `theme`: The current Spark-Theme. [You can always define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The progress bar intent, e.g. main, support.
* `shape`: The progress bar shape, e.g. rounded, square.
* `value`: The indicator value of the progress bar. Value **MUST** be into 0 (for 0 %) and 1 (for 100%).

#### Progress Bar Indeterminate

Properties:
* `theme`: The current Spark-Theme. [You can always define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The progress bar intent, e.g. main, support.
* `shape`: The progress bar shape, e.g. rounded, square.
* `isAnimating`: The progress bar is animating.

## Initialization

### SwiftUI

#### Progress Bar Single

```swift
// Initialize a new progress bar view.
ProgressBarView(
    theme: theme,
    intent: .main,
    shape: .square,
    value: 0.7,
)
```

#### Progress Bar Indeterminate

```swift
// Initialize a new progress bar indeterminate view.
ProgressBarIndeterminateView(
    theme: theme,
    intent: .main,
    shape: .square,
    isAnimating: true,
)
```

## License

```
MIT License

Copyright (c) 2024 Adevinta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```