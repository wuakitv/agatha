# Agatha

[![CI Status](http://img.shields.io/travis/wuakitv/Agatha.svg?style=flat)](https://travis-ci.org/wuakitv/Agatha)
[![Version](https://img.shields.io/cocoapods/v/Agatha.svg?style=flat)](http://cocoapods.org/pods/Agatha)
[![License](https://img.shields.io/cocoapods/l/Agatha.svg?style=flat)](http://cocoapods.org/pods/Agatha)
[![Platform](https://img.shields.io/cocoapods/p/Agatha.svg?style=flat)](http://cocoapods.org/pods/Agatha)

Agatha is a set of [Nimble](https://github.com/Quick/Nimble) matchers used to test the events received by a `RxSwift` `TestObserver`.

The name comes from Agatha in the [Minority Report film](https://en.wikipedia.org/wiki/Minority_Report_%28film%29).

![Agatha's predicting events](readme-files/agatha.gif)

She is a [precog](https://en.wikipedia.org/wiki/Precognition) able to predict
future events. As Agatha, you should be able to predict the events produced by
your `Observable`s in your unit tests, or face an unforeseeable future plagued by bugs.

![Plagued by bugs](readme-files/bugs.gif)

## Installation

Agatha is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following lines to your Podfile:

```ruby
source "https://github.com/wuakitv/ios-specs.git"

pod 'Agatha'
```

## Compatibility

`Agatha` currently needs Swift >= 3.2 and supports Swift 4.0.

## Usage

`Agatha` must be used in combination with [RxSwift and RxTest](https://github.com/ReactiveX/RxSwift).
Of course, if you are using `Agatha` you will be using [Quick](https://github.com/Quick/Quick) and
[Nimble](https://github.com/Quick/Nimble), so here you have a possible setup will all these
great frameworks to test an `Observable`'s output:

```swift
import Foundation
import Quick
import Nimble

import RxSwift
import RxTest

class SomeObservableSpec: QuickSpec {
    override func spec() {
        describe("SomeObservable") {
            var scheduler: TestScheduler!
            var observable: SomeObservable!

            beforeEach {
                scheduler = TestScheduler(initialClock: 0)
                observable = ...
            }

            it("emit the expected events") {
                let observer = scheduler.start { observable.observableProperty }
                expect(observer).to(receive(events: [next(TestScheduler.Defaults.subscribed, "some value")]))
            }
        }
    }
}

```

## Matchers

You may use the following matchers with `Agatha`, they are equivalent:

```swift
expect(testableObserver.events).to(match(events: [next(100, "value")]))
expect(testableObserver).to(receive(events: [next(100, "value")]))
```

## Contributing to `Agatha`

In order to contribute to `Agatha`, clone the repo and follow the steps outlined below:

1. Clone the project
1. Install the development tools using `bundle`

        $ bundle install --path vendor/bundle

1. Install dependencies and initialize the Xcode workspace

        $ bundle exec fastlane pods

1. Open the generated `Agatha.workspace` in the `Example` folder

Always base your branches on the `develop` branch, preferably naming them as
`feature/TICKET-NAME_Description`, following the
[git flow branching model](http://nvie.com/posts/a-successful-git-branching-model/).
Once finished make a *pull request* to integrate your changes into the
`develop` branch.

And of course, being a unit test library, don't forget to include unit tests covering
your contributions! You can get an HTML coverage report running the following command:

    $ bundle exec fastlane test show_coverage:true

## Author

José González, jose.gonzalez@rakuten.com

## License

Agatha is available under the MIT license. See the LICENSE file for more info.
