
public enum IntroRoutes {
    case auth
}

public protocol IntroRouterProtocol {
    func route(to route: IntroRoutes)
}
