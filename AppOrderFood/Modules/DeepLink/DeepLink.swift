//
//  DeepLink.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 09/04/2024.
//
//
import Foundation
import SwiftUI


enum DeepLinkOption {
    case email(String), phone(String)
    
    var url: (app: URL?, site: URL?) {
        switch self {
        case .email(let address):
            return (app: URL(string: "mailto:\(address)"),
                    site: nil)
        case .phone(let number):
            return (app: URL(string: "tel://\(number)"),
                    site: nil)
        }
    }
}
final class DeepLinkService {
    func openURL(type: DeepLinkOption, openURLAction: OpenURLAction) {
        //1
        guard let appURL = type.url.app else { return }
        //2
        openURLAction.callAsFunction(appURL) { accepted in
            //3
            if !accepted {
                //4
                guard let siteURL = type.url.site else { return }
                openURLAction.callAsFunction(siteURL)
            }
        }
    }
}
