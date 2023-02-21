
public protocol URLClientType: AnyObject {
    func request<Request: HTTPRequestType>(_ request: Request,
                                           callBackQue: DispatchQue?,
                                           progressHandler: ,
                                            ) -> Cancellable
}

public class URLClient {
    

    public init() {
    }
}
