import UIKit


public protocol CustomDataBinding {
    associatedtype BindingType
    associatedtype DatasType = [BindingType]
    var datas:DatasType { get set }
    func binding(data:DatasType)
}

public protocol AutoTableViewCell {
    associatedtype Cell
    var cellIdentifier:String { get }
}

extension AutoTableViewCell {
    public var cellIdentifier:String {
        return String(self.dynamicType)
    }
}

public class CustomDataTableViewController<T,U:UITableViewCell>: UIViewController,CustomDataBinding,AutoTableViewCell {
    
    @IBOutlet weak var tableView:UITableView?
    
    public typealias BindingType = T
    public typealias DatasType = [T]
    public typealias Cell = U
    
    private var _datas:DatasType = []
    public var datas:DatasType {
        set {
            _datas = newValue
            self.binding(_datas)
        }
        
        get {
            return _datas
        }
    }
    
    public func binding(datas: DatasType) {
        
    }

}

//extension CustomDataTableViewController: UITableViewDataSource {
//    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return datas.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? Cell {
//            return cell
//        } else {
//            tableView.registerNib(UINib(nibName: cellIdentifier, bundle: NSBundle(forClass: Cell.classForCoder())), forCellReuseIdentifier: cellIdentifier)
//            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! Cell
//            return cell
//        }
//    }
//    
////    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
////        return 62
////    }
////    
////    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
////        if let _cell = cell as? Cell {
////            _cell.route = playRoutes()[indexPath.row]
////            _cell.routeLabel.text = _cell.route.gzNameZh
////            _cell.descriptionLabel.text = _cell.route.ddesc
////            _cell.star = _cell.route.star.boolValue
////            
////            let routeDescription = _cell.route.gzNameZh + "," + _cell.route.ddesc.stringByReplacingOccurrencesOfString("-", withString: "往")
////            _cell.accessibilityLabel = routeDescription
////        }
////    }
////    
////    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
////        return 0.01
////    }
//}
//
//extension CustomDataTableViewController: UITableViewDelegate {
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }
//}
struct AAAA {
    var a:String = "1"
    var b:String = "2"
}

class FirstCV :CustomDataView<AAAA> {
    
    override func binding(data: AAAA) {
//        l1.text = data.a
//        l2.text = data.b
    }
    
}

