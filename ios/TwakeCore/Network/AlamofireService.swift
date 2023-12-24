import Foundation
import Alamofire

class AlamofireService {
    static let shared: AlamofireService = AlamofireService()
    
    func post<T: Codable>(
        url: String,
        payloadData: Data?,
        headers: HTTPHeaders? = nil,
        onSuccess: @escaping (T) -> Void,
        onFailure: @escaping (Error) -> Void
    ) {
        guard let baseUrl = URL(string: url),
              var request = try? URLRequest(url: baseUrl, method: .post, headers: headers) else {
            return onFailure(NetworkExceptions.requestUrlInvalid)
        }
        
        request.httpBody = payloadData
        
        AF.request(request).responseDecodable(of: T.self) { response in
            switch(response.result) {
            case .success(let data):
                onSuccess(data)
            case .failure(let error):
                onFailure(NetworkExceptions(value: "\(error.localizedDescription)"))
            }
        }
    }
}
