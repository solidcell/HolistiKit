import Foundation

public protocol UserDefaulting {
    
    func object(forKey defaultName: String) -> Any?
    func set(_ value: Any?, forKey defaultName: String)
}

extension UserDefaults: UserDefaulting { }
