import UIKit


public protocol CustomDataViewBinding {
    associatedtype BindingType
    var data:BindingType? { get set }
    func binding(data:BindingType)
}

public class CustomDataView<T>: CustomViewLight,CustomDataViewBinding {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private var _data:T?
    public var data:T? {
        set {
            guard let _newValue = newValue else {
                return
            }
            
            _data = _newValue
            self.binding(_newValue)
        }
        
        get {
            return _data
        }
    }
    
    
    public func binding(data: T) {
        
    }
    
}
