import Foundation

public protocol URLClientType: AnyObject {
    func request<Request: HTTPRequestType>(_ request: Request,
                                           callBackQue: DispatchQueue?,
                                           progressHandler: ProgressHandler?,
                                           CompletionHandler: CompletionHandler?) -> Cancellable
}

public typealias CompletionHandler = (_ result: Result<URLResponse, Error>) -> Void

/// Closure to be executed when progress changes.
public typealias ProgressHandler = (_ progress: ProgressResponse) -> Void

/// A type representing the progress of a request.
public struct ProgressResponse {

    /// The optional response of the request.
    public let response: URLResponse?

    /// An object that conveys ongoing progress for a given request.
    public let progressObject: Progress?

    /// Initializes a `ProgressResponse`.
    public init(progress: Progress? = nil, response: URLResponse? = nil) {
        self.progressObject = progress
        self.response = response
    }

    /// The fraction of the overall work completed by the progress object.
    public var progress: Double {
        if completed {
            return 1.0
        } else if let progressObject = progressObject, progressObject.totalUnitCount > 0 {
            // if the Content-Length is specified we can rely on `fractionCompleted`
            return progressObject.fractionCompleted
        } else {
            // if the Content-Length is not specified, return progress 0.0 until it's completed
            return 0.0
        }
    }

    /// A Boolean value stating whether the request is completed.
    public var completed: Bool { response != nil }
}

open class URLClient: URLClientType {
    
    public init() {
    }
    
    @discardableResult
    public func request<Request>(_ request: Request,
                                 callBackQue: DispatchQueue?,
                                 progressHandler: ProgressHandler?,
                                 CompletionHandler: CompletionHandler?) -> Cancellable where Request : HTTPRequestType {
        <#code#>
    }
    
    @discardableResult
    public func stubRequest<Request>(_ request: Request,
                                     callBackQue: DispatchQueue?,
                                     progressHandler: ProgressHandler?,
                                     CompletionHandler: CompletionHandler?) -> Cancellable where Request : HTTPRequestType {
    }
   
}
    
    

