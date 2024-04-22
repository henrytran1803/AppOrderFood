//
//  CoinBaseMV.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//
import Foundation

class PaymentMV {
    let apiKey: String
    let baseURL = "https://api.commerce.coinbase.com/charges/"
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    func createCharge(data: NewPayment, completion: @escaping (Result<ResponseData, Error>) -> Void) {
        print("start \(data)")
        let url = URL(string: baseURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: "X-CC-Api-Key")
        
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(data)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let dataPayment = try decoder.decode(ResponseData.self, from: data)
                    print(dataPayment)
                    completion(.success(dataPayment))
                } catch {
                    print("fail")
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
            task.resume()
        } catch {
            completion(.failure(error))
        }
    }
}


//
//// Example usage
//let apiKey = "YOUR_API_KEY"
//let payment = Payment(apiKey: apiKey)
//
//let data: [String: Any] = [
//    "name": "The Human Fund",
//    "description": "Money For People",
//    "pricing_type": "fixed_price",
//    "local_price": [
//        "amount": "10.00",
//        "currency": "USD"
//    ]
//]
//
//payment.createCharge(data: data) { result in
//    switch result {
//    case .success(let json):
//        print("Charge created successfully:", json)
//    case .failure(let error):
//        print("Failed to create charge:", error)
//    }
//}
