import UIKit

struct AAAA {
    var a:String = "1"
    var b:String = "2"
}

class FirstCV :CustomDataView<AAAA> {
    var l1:UILabel!
    var l2:UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func setup() {
        super.setup()
        
        l1 = UILabel(frame: CGRectMake(0, 0, 100, 50))
        l1.backgroundColor = UIColor.purpleColor()
        l1.text = "xxx"
        self.view?.addSubview(l1)
        
        l2 = UILabel(frame: CGRectMake(0, 50, 100, 50))
        l2.backgroundColor = UIColor.yellowColor()
        l2.text = "yyy"
        self.view?.addSubview(l2)
    }
    
//    override func binding(data: AAAA) {
//        l1.text = data.a
//        l2.text = data.b
//    }
    
    override func binding(data: AAAA) {
        
    }
    
}

var fcv = FirstCV(frame: CGRectMake(0, 0, 100, 100))
String(fcv.dynamicType)

fcv.data// = AAAA()
fcv


@objc protocol AAProtocol {
    var a:String {get}
    var b:String {get}
}
class AAView<T:AAProtocol>:CustomDataView<T> {
    var l1:UILabel!
    var l2:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func setup() {
        super.setup()
        l1 = UILabel(frame: CGRectMake(0, 0, 100, 50))
        l1.backgroundColor = UIColor.purpleColor()
        self.view?.addSubview(l1)
        
        l2 = UILabel(frame: CGRectMake(0, 50, 100, 50))
        l2.backgroundColor = UIColor.yellowColor()
        self.view?.addSubview(l2)
    }
    override func binding(data: T) {
        l1.text = data.a
        l2.text = data.b
    }
}
class AA1:AAProtocol {
    @objc var a = "a"
    @objc var b = "b"
}
class AA2:AAProtocol {
    @objc var a = "1"
    @objc var b = "2"
}
var aa = AAView<AAProtocol>(frame: CGRectMake(0, 0, 100, 100))
String(aa.dynamicType)
aa.data = AA1()

aa.data = AA2()


let typePP1 = CustomDataView<AAProtocol>.self.init(frame: CGRectZero)
let typePP:CustomDataView<AAProtocol>.Type.Type = CustomDataView<AAProtocol>.Type.self

