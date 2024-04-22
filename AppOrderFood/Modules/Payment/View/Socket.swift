//
//  Socket.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//
import SwiftUI

struct Socket: View {
    @State private var responseData: ResponseData?
    @State private var isCompleted = false
    @State private var timer: Timer?
    @State var chargeID: String

    var body: some View {
        VStack {
            if let responseData = responseData {
                Text("Status: \(responseData.data.timeline.last?.status ?? "Unknown")")
                    .bold()
                Text("Time: \(responseData.data.timeline.last?.time ?? "Unknown")")
                    .bold()
            } else {
                Text("No data")
            }
            Spacer()
            ProgressView()
            Spacer()
        }
        .onAppear {
            self.startPolling()
        }
        .onDisappear {
            self.stopPolling()
        }
    }

    func startPolling() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            fetchTimeline()
        }
    }

    func stopPolling() {
        timer?.invalidate()
        timer = nil
    }

    func fetchTimeline() {
        guard !isCompleted, let url = URL(string: "https://api.commerce.coinbase.com/charges/\(chargeID)") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching timeline: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                if let httpResponse = response as? HTTPURLResponse {
                    print("Error with the response, unexpected status code: \(httpResponse.statusCode)")
                } else {
                    print("Error: Không nhận được phản hồi hợp lệ từ server.")
                }

                return
            }

            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(ResponseData.self, from: data) {
                    DispatchQueue.main.async {
                        self.responseData = decodedResponse
                        if decodedResponse.data.timeline.last?.status == "Completed" {
                            self.isCompleted = true
                            self.stopPolling()
                        }
                    }
                } else {
                    print("Decoding response failed")
                }
            }
        }
        task.resume()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Socket(chargeID: "")
    }
}
