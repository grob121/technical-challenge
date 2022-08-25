//
//  technical_challengeApp.swift
//  technical-challenge
//
//  Created by A.Pagdanganan on 8/25/22.
//

import SwiftUI

@main
struct technical_challengeApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = ListViewModel()
            ListView(viewModel: viewModel)
        }
    }
}
