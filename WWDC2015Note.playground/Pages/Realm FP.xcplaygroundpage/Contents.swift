import Foundation

//class Monoid m where
//    mempty :: m
//    mappend :: m -> m -> m
//    mconcat :: [m] -> m
//    mconcat = foldr mappend mempty

protocol Monoid {
    static func empty() -> Self
    static func append(left: Self, right: Self) -> Self
    static func concat(list: [Self]) -> Self
}

protocol Concattable {
    init()
    func +(left: Self, right: Self) -> Self
    static func concat(list: [Self]) -> Self
}