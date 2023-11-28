import Foundation
import FoundationNetworking

// URL session provides async and callback API to upload Data
// Use continuations to convert existing callback API into an async
// https://developer.apple.com/documentation/foundation/url_loading_system/uploading_data_to_a_website

// You can POST to the /register endpoint of this API https://movie-api-ybwl.koyeb.app/api-docs/

struct User: Codable {
    let email: String
    let password: String
    let firstname: String
    let lastname: String
}

func uploadData(request: URLRequest, requestBody: Data, completion: @escaping (_ isSuccessful: Bool) -> Void) {
    print("calling url", request)
    let uploadTask = URLSession.shared.uploadTask(with: request, from: requestBody) { data, _, _ in
        print("inside callback")
        guard data != nil else {
            print("no response body")
            completion(false)
            return
        }
        print("got response body")
        completion(true)
    }
    uploadTask.resume()
}

func uploadDataAsync() async -> Bool {
    guard let url = URL(string: "https://movie-api-ybwl.koyeb.app/user/register") else {
        return false
    }
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "accept")
    request.httpMethod = "POST"
    
    let user = User(email: "email@email.com", password: "password", firstname: "John", lastname: "Doe")
    guard let encoded = try? JSONEncoder().encode(user) else {
        return false
    }
    
    return await withCheckedContinuation { continuation in
        uploadData(request: request, requestBody: encoded) { isSuccessful in
            continuation.resume(returning: isSuccessful)
        }
    }
}

let isSuccessful = await uploadDataAsync()
print("is successul ?", isSuccessful)
