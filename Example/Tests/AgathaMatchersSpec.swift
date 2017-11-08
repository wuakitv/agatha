//
//  AgathaMatchersSpec.swift
//  ios-commons-project
//
//  Created by Jose Gonzalez on 06/11/2017.
//  Copyright © 2017 Wuaki TV S.L. All rights reserved.
//

import Foundation
import RxSwift
import RxTest
import Quick
import Nimble
import Agatha


class AgathaMatchersSpec: QuickSpec {
    override func spec() {
        describe("Agatha matchers") {
            var scheduler: TestScheduler!

            beforeEach {
                scheduler = TestScheduler(initialClock: 0)
            }
            
            context("for equatable elements") {
                let expectedEvents = [next(250, "Hello"), next(300, ", "), next(350, "Worl"), next(425, "d!"), completed(450)]
                var observable: TestableObservable<String>!

                beforeEach {
                    observable = scheduler.createHotObservable(expectedEvents)
                }
                
                it("should properly match received events") {
                    let observer = scheduler.start { observable.asObservable() }
                    expect(observer).to(receive(events: expectedEvents))
                }
                
                it("should properly match events") {
                    let observer = scheduler.start { observable.asObservable() }
                    expect(observer.events).to(match(events: expectedEvents))
                }
            }
            
            context("for void elements") {
                let expectedEvents = [next(250, ()), next(300, ()), next(350, ()), next(425, ()), completed(450)]
                var observable: TestableObservable<Void>!

                beforeEach {
                    observable = scheduler.createHotObservable(expectedEvents)
                }
                
                it("should properly match received events") {
                    let observer = scheduler.start { observable.asObservable() }
                    expect(observer).to(receive(events: expectedEvents))
                }
                
                it("should properly match events") {
                    let observer = scheduler.start { observable.asObservable() }
                    expect(observer.events).to(match(events: expectedEvents))
                }
            }
        }
    }
}
