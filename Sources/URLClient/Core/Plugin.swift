//
//  Plugin.swift
//  
//
//  Created by Kota Kawanishi on 2023/02/21.
//

import Foundation

public typealias RequestPrepareClosure<RequestType: HTTPRequestType> = (URLRequest, RequestType) -> Request

public typealias WillSendClosure<RequestType: HTTPRequestType> = (URLRequest, RequestType) -> Void

public typealias DidReceiveClosure<RequestType: HTTPRequestType> = (Result<URLResponse, Error>, RequestType) -> Void

public typealias ProcessClosure<RequestType: HTTPRequestType> = (Result<URLResponse, Error>, RequestType) -> Result<URLResponse, Error>

/// A Moya Plugin receives callbacks to perform side effects wherever a request is sent or received.
///
/// for example, a plugin may be used to
///     - log network requests
///     - hide and show a network activity indicator
///     - inject additional information into a request
public protocol PluginType {
    associatedtype Request: HTTPRequestType
    /// Called to modify a request before sending.
    var prepareHandler: RequestPrepareClosure<Request>? { get }

    /// Called immediately before a request is sent over the network (or stubbed).
    var willSendHandler: WillSendClosure<Request>? { get }

    /// Called after a response has been received, but before the MoyaProvider has invoked its completion handler.
    var didReceiveHandler: DidReceiveClosure<Request>? { get }

    /// Called to modify a result before completion.
    var processHandler: ProcessClosure<Request>? { get }
}

