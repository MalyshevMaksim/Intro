//
//  IntroRouter.swift
//  Events
//
//  Created by m.malyshev on 28.01.2023.
//

enum IntroRoutes {
    case auth
}

protocol IntroRouterProtocol {
    func route(to route: RootRoute)
}
