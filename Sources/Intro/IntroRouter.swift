//
//  IntroRouter.swift
//  Events
//
//  Created by m.malyshev on 28.01.2023.
//

public enum IntroRoutes {
    case auth
}

public protocol IntroRouterProtocol {
    func route(to route: IntroRoutes)
}
