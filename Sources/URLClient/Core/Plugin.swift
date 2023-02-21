//
//  Plugin.swift
//  
//
//  Created by Kota Kawanishi on 2023/02/21.
//

import Foundation

public typealias RequestPrepareClosure<Request: HTTPRequestType> = (_ request: Request) -> URLRequest
public typealias WillSendClosure<Request: HTTPRequestType> = (_ request: Request) -> Void
public typealias DidReceiveClosure<Request: HTTPRequestType> = (_ result: Result<URLResponse, Error>,,_ request: Request) -> Void
public typealias ProcessClosure<Request: HTTPRequestType> = (_ result: Result<URLResponse, Error>,,_ request: Request) -> Result<URLResponse, Error>

/// A Moya Plugin receives callbacks to perform side effects wherever a request is sent or received.
///
/// for example, a plugin may be used to
///     - log network requests
///     - hide and show a network activity indicator
///     - inject additional information into a request
public protocol PluginType {
    associatedtype Request: HTTPRequestType
    /// Called to modify a request before sending.
    var prepareHandler: RequestPrepareClosure<Request>?

    /// Called immediately before a request is sent over the network (or stubbed).
    var willSendHandler: WillSendClosure<Request>?

    /// Called after a response has been received, but before the MoyaProvider has invoked its completion handler.
    var didReceiveHandler: DidReceiveClosure<Request>?

    /// Called to modify a result before completion.
    var processHandler: ProcessClosure<Request>?
}

