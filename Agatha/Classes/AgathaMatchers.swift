//
//  RxEventsMatcher.swift
//  ios-commons
//
//  Created by Jose Gonzalez on 06/11/2017.
//  Copyright © 2017 Wuaki TV S.L. All rights reserved.
//

import Foundation
import RxSwift
import RxTest
import Nimble


public func match<T: Equatable>(events expectedEvents: [Recorded<Event<T>>]) -> Predicate<Array<Recorded<Event<T>>>> {
    return Predicate.define { actualExpression in
        let actualEvents = try actualExpression.evaluate()
        let match: Bool = {
            guard let actualEvents = actualEvents else { return false }
            return actualEvents.count == expectedEvents.count &&
                zip(actualEvents, expectedEvents).reduce(true) { result, actualExpected in
                    let (actual, expected) = actualExpected
                    return result && actual == expected
            }
        }()
        let message = ExpectationMessage.expectedCustomValueTo("match \(expectedEvents)", "\(actualEvents ?? [])")
        return PredicateResult(bool: match, message: message)
    }
}


public func match(events expectedEvents: [Recorded<Event<Void>>]) -> Predicate<Array<Recorded<Event<Void>>>> {
    return Predicate.define { actualExpression in
        let actualEvents = try actualExpression.evaluate()
        let match: Bool = {
            guard let actualEvents = actualEvents else { return false }
            return actualEvents.count == expectedEvents.count &&
                zip(actualEvents, expectedEvents).reduce(true) { result, actualExpected in
                    let (actual, expected) = actualExpected
                    return result && actual.time == expected.time
            }
        }()
        let message = ExpectationMessage.expectedCustomValueTo("match \(expectedEvents)", "\(actualEvents ?? [])")
        return PredicateResult(bool: match, message: message)
    }
}


public func receive<T: Equatable>(events expectedEvents: [Recorded<Event<T>>]) -> Predicate<TestableObserver<T>> {
    return Predicate.define { actualExpression in
        let actualEvents = try actualExpression.evaluate()?.events
        let match: Bool = {
            guard let actualEvents = actualEvents else { return false }
            return actualEvents.count == expectedEvents.count &&
                zip(actualEvents, expectedEvents).reduce(true) { result, actualExpected in
                    let (actual, expected) = actualExpected
                    return result && actual == expected
            }
        }()
        let message = ExpectationMessage.expectedCustomValueTo("match \(expectedEvents)", "\(actualEvents ?? [])")
        return PredicateResult(bool: match, message: message)
    }
}


public func receive(events expectedEvents: [Recorded<Event<Void>>]) -> Predicate<TestableObserver<Void>> {
    return Predicate.define { actualExpression in
        let actualEvents = try actualExpression.evaluate()?.events
        let match: Bool = {
            guard let actualEvents = actualEvents else { return false }
            return actualEvents.count == expectedEvents.count &&
                zip(actualEvents, expectedEvents).reduce(true) { result, actualExpected in
                    let (actual, expected) = actualExpected
                    return result && actual.time == expected.time
            }
        }()
        let message = ExpectationMessage.expectedCustomValueTo("match \(expectedEvents)", "\(actualEvents ?? [])")
        return PredicateResult(bool: match, message: message)
    }
}
