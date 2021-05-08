# An app of Ice And Fire

This iOS project contains a simple app that lists all the houses of the [Ice And Fire API](https://anapioficeandfire.com). The app loads the data laizly with a page size of 25 items and does not store any downloaded data on the device. Therefore it requires an internet connection to function properly.

The project compiles with Xcode 12.5 and Swift 5.

## Testing
The whole project is tested with Unit and UI tests and has a test coverage of 88,3%. The untested code parts are the SwiftUI [PreviewProviders](https://developer.apple.com/documentation/swiftui/previewprovider) which cannot be excluded from the coverage gathering (at least it can't be excluded without any additional tools).

## Architecture
Though I designed the architecture in a MVVM kind of way, the detail view is the only one with a view model. That's because ["SwiftUI comes with MVVM built-in"](https://nalexn.github.io/clean-architecture-swiftui/) and it was the only view where it made things clearer to extract and process the data from the main model.

## Version Control System
Since I worked on this project alone and off and on, I didn't commit any changes while working on it.
