import UIKit
import XCPlayground

/*:
# 圖層與視圖

Trees:
 - Layer : 主要處理畫面動畫等等
 - UIView
 - 呈现树
 - 渲染树
*/


/*:
# 圖層的能力
一些UIView没有暴露出来的CALayer的功能:
 * 阴影，圆角，带颜色的边框
 * 3D变换
 * 非矩形范围
 * 透明遮罩
 * 多级非线性动画

使用 CALayer 的時機

 * 使用多個 Layer時
 * 性能
*/

var view = UIView()

view.layer.contents = UIImage().CGImage

view.contentMode = .ScaleAspectFit
view.layer.contentsGravity = kCAGravityResizeAspectFill

view.layer.contentsScale = 2 // @2x...

view.clipsToBounds = true
view.layer.masksToBounds = true

view.layer.contentsRect = CGRectMake(0, 0, 1, 1) // 單位座標 0~1 預設 {0,0,1,1} 9-patch
//UIImage().resizableImageWithCapInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
// Interface builder: Stretching

/*:
# Custom Drawing
blueLayer.delegate = self;
//force layer to redraw
[blueLayer display];

(void)displayLayer:(CALayerCALayer *)layer;
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;
*/

/*:
UIView vs CALayer \
frame  vs frame \
bounds vs bounds \
center vs position

frame 根据bounds，position和transform计算而来

anchor point // 單位座標 預設在 view 的中心
*/


/*:
# 座標系

    convertPoint(p: CGPoint, fromLayer: CALayer?)
    convertPoint(p: CGPoint, toLayer: CALayer?)
    convertRect(r: CGRect, fromLayer: CALayer?)
    convertRect(r: CGRect, toLayer: CALayer?)

*/

/*:
# Hit Test P78
-containsPoint:和-hitTest:
*/

/*:
# Auto layout P85
view.setNeedsLayout 或 bound 發生變化則會掉用下面方法
- (void)layoutSublayersOfLayer:(CALayer *)layer;
*/

/*:
# shadow path

    //create a square shadow
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.layerView1.bounds);
    self.layerView1.layer.shadowPath = squarePath; CGPathRelease(squarePath);

    ￼//create a circular shadow
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
    self.layerView2.layer.shadowPath = circlePath; CGPathRelease(circlePath);

*/

/*:
# Mask

    //create mask layer
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.layerView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"Cone.png"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;

    //apply mask to image layer￼
    self.imageView.layer.mask = maskLayer;

*/


/*:
# 拉伸过滤
minificationFilter(縮小圖片) 和 magnificationFilter(放大圖片)

 * kCAFilterLinear (預設) 双线性滤波 使用時機 放大
 * kCAFilterNearest                       無斜線小圖
 * kCAFilterTrilinear 三线性滤波            縮小


*/

/*:
# 透明度
设置了一个图层的透明度，你希望它包含的整个图层树像一个整体一样的透明效果
Info.plist:UIViewGroupOpacity YES
*/
view.layer.shouldRasterize = true
view.layer.rasterizationScale = UIScreen.mainScreen().scale

// Mark: Chapter 5 Transformation

/*
# 2D Transformation
              ⎡a  b  0⎤
[x y 1]   x   ⎢c  d  0⎥ = [x' y' 1]
              ⎣tx ty 1⎦

CGPoint   x   CGAffineTransform = Transformed CGPoint

CGAffineTransformMakeRotation(CGFloat angle)
CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)

CGAffineTransformIdentity 單位矩陣

CGAffineTransformConcat(CGAffineTransform t1, CGAffineTransform t2) 合併 transform

CGAffineTransform transform = CGAffineTransformIdentity;
transform = CGAffineTransformScale(transform, 0.5, 0.5);
transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
transform = CGAffineTransformTranslate(transform, 200, 0);
//apply transform to layer
self.layerView.layer.affineTransform = transform;
實際：縮小0.5 -> 選轉30度 -> 平移200(*0.5)
*/


/*
# 3D Transformation

⎡m11 m21 m31 m41⎤
⎢m12 m22 m32 m42⎥
⎢m13 m23 m33 m43⎥
⎣m14 m24 m34 m44⎦

CATransform3DMakeRotation(CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
CATransform3DMakeScale(CGFloat sx, CGFloat sy, CGFloat sz)
CATransform3DMakeTranslation(Gloat tx, CGFloat ty, CGFloat tz)
*/

//透视投影
//我们可以通过设置m34为-1.0 / d来应用透视效果，d代表了想象中视角相机和屏幕之间的距离，以像素为单位
var transform3D = CATransform3DIdentity
transform3D.m34 = -1.0 / 500.0

// 滅點
// 当图层发生变换时，这个点永远位于图层变换之前anchorPoint的位置
// 注意：当改变一个图层的position，你也改变了它的灭点，做3D变换的时候要时刻记住这一点，当你视图通过调整m34来让它更加有3D效果，应该首先把它放置于屏幕中央，然后通过平移来把它移动到指定位置（而不是直接改变它的position），这样所有的3D图层都共享一个灭点。

// 背面
view.layer.doubleSided = false
// 那么当图层正面从相机视角消失的时候，它将不会被绘制。

// 專用 Layer

// CAShapeLayer
// 渲染快速:硬件加速
// 高效使用内存:不需寄宿图形
// 不会被图层边界剪裁掉
// 不会出现像素化

var shape = UIView(frame: CGRectMake(0, 0, 300, 300))
shape.backgroundColor = UIColor.whiteColor()
var littleManPath = UIBezierPath()
littleManPath.moveToPoint(CGPointMake(175, 100))
littleManPath.addArcWithCenter(CGPointMake(150, 100), radius: 25, startAngle: 0, endAngle: CGFloat(2.0 * M_PI), clockwise: true)
littleManPath.moveToPoint(CGPointMake(150, 125))
littleManPath.addLineToPoint(CGPointMake(150, 175))
littleManPath.addLineToPoint(CGPointMake(125, 225))
littleManPath.moveToPoint(CGPointMake(150, 175))
littleManPath.addLineToPoint(CGPointMake(175, 225))
littleManPath.moveToPoint(CGPointMake(100, 150))
littleManPath.addLineToPoint(CGPointMake(200, 150))
var shapeLayer = CAShapeLayer()
shapeLayer.strokeColor = UIColor.redColor().CGColor
shapeLayer.fillColor = UIColor.clearColor().CGColor
shapeLayer.lineWidth = 5
shapeLayer.lineJoin = kCALineJoinRound
shapeLayer.lineCap = kCALineCapRound
shapeLayer.path = littleManPath.CGPath;
shape.layer.addSublayer(shapeLayer)

shape

// CATextLayer

var textView = UIView(frame: CGRectMake(0, 0, 300, 300))
textView.backgroundColor = UIColor.whiteColor()
var textLayer = CATextLayer()
textLayer.frame = textView.bounds
textView.layer.addSublayer(textLayer)
textLayer.foregroundColor = UIColor.blackColor().CGColor
textLayer.alignmentMode = kCAAlignmentJustified
textLayer.wrapped = true
var font = UIFont.systemFontOfSize(15)
var fontName = font.fontName
var fontRef = CGFontCreateWithFontName(fontName)
textLayer.font = fontRef
textLayer.fontSize = font.pointSize;
textLayer.string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis"
textView
textLayer.contentsScale = UIScreen.mainScreen().scale
textView
// textLayer add attributeString  略

class LayerLabel:UILabel {
    
//    class func layerClass() -> Any {
//        return CATextLayer.self//dynamicType
//    }
    
    override class func layerClass() -> AnyClass {
        return CATextLayer.self
    }
    
    var textLayer:CATextLayer? {
        return self.layer as? CATextLayer
    }
    
    func setup() {
        self.text = self.text;
        self.textColor = self.textColor;
        self.font = self.font;
        self.textLayer?.alignmentMode = kCAAlignmentJustified
        
        self.textLayer?.wrapped = true
        self.layer.display()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        self.setup()
    }
    
    var mtext:String {
        set {
            self.text = newValue
            self.textLayer?.string = newValue
        }
        get {
            return ""
        }
    }
    
    var mtextColor:UIColor {
        set {
            self.textColor = newValue
            self.textLayer?.foregroundColor = newValue.CGColor
        }
        get {
            return UIColor()
        }
    }
    
    
    var mfont:UIFont {
        set {
            self.font = newValue
            self.textLayer?.font = CGFontCreateWithFontName(font.fontName)
            self.textLayer?.fontSize = font.pointSize
        }
        get {
            return UIFont()
        }
    }
}

var myLabel = LayerLabel(frame: CGRectMake(0, 0, 300, 300))
myLabel.numberOfLines = 0
myLabel.backgroundColor = UIColor.whiteColor()
myLabel.mfont = UIFont.systemFontOfSize(60)
myLabel.mtext = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis"
myLabel.mtextColor = UIColor.redColor()
myLabel

myLabel.textLayer


// CATransformLayer 略

// CAGradientLayer
var gradientView = UIView(frame: CGRectMake(0, 0, 300, 300))
var gradientLayer = CAGradientLayer()
gradientLayer.frame = gradientView.bounds
gradientView.layer.addSublayer(gradientLayer)
gradientLayer.colors = [UIColor.redColor().CGColor,UIColor.blueColor().CGColor]
gradientLayer.startPoint = CGPointMake(0, 0)
gradientLayer.endPoint = CGPointMake(1, 1)
gradientView

gradientLayer.colors = [UIColor.redColor().CGColor,UIColor.yellowColor().CGColor,UIColor.greenColor().CGColor]
gradientLayer.locations = [0,0.25,0.5]
gradientView

// CAReplicatorLayer
// CAScrollLayer
// CATiledLayer
// CAEmitterLayer
// CAEAGLLayer
// AVPlayerLayer

// 隱式動畫
// 隱式動畫的時間，作用於 CATransaction，預設為 0.25秒
CATransaction.animationDuration()

// 也可以透過 begin -> setAnimationDuration -> layer 更動 -> commit 進行一次隱式動畫
CATransaction.begin()
CATransaction.setAnimationDuration(1)
// do something
CATransaction.setCompletionBlock { () -> Void in
    // do something
}
CATransaction.commit()

// 預設 UIView.layer 是關閉 隱式動畫 

// 這時來詳細了解 隱式動畫 如何運作

// 當 layer 的屬性被改變時
// 1. 它會先從delegate 調用 actionForKey 方法
// 2. 接著找 actions
view.layer.actions
// 3. 然後找 style
view.layer.style
// 4. 最後執行預設
CALayer.defaultActionForKey("")

/* Returns the action object associated with the event named by the
* string 'event'. The default implementation searches for an action
* object in the following places:
*
* 1. if defined, call the delegate method -actionForLayer:forKey:
* 2. look in the layer's `actions' dictionary
* 3. look in any `actions' dictionaries in the `style' hierarchy
* 4. call +defaultActionForKey: on the layer's class
*
* If any of these steps results in a non-nil action object, the
* following steps are ignored. If the final result is an instance of
* NSNull, it is converted to `nil'. */

// 所以猜測 UIView 實現了 actionForKey 並 return nil
// 除此之外，還有其他關閉隱式動畫的方式
CATransaction.setDisableActions(true)

// 呈現 layer 代表螢幕上真正的 layer，(呈現到畫面上才會生成)
view.layer.presentationLayer()
// 動畫結束後的位置
view.layer.modelLayer()

// 操作 presentationLayer 的兩個理由
// 1.同步動畫
// 2.用戶交互

// 顯式動畫
var basicAnimation = CABasicAnimation()
basicAnimation.keyPath = "backgroundColor"
basicAnimation.toValue = UIColor.blueColor().CGColor
basicAnimation.delegate = view

view.layer.addAnimation(basicAnimation, forKey: nil)
CATransaction.begin()
// 這時會同時執行顯式動畫以及隱式動畫，所以先將隱式動畫關閉
CATransaction.setDisableActions(true)
//view.layer.backgroundColor = animation.toValue as! CGColor
CATransaction.commit()

// P301 提到 animation 用 delegate 方式實現時，會有許多不妥的地方(建議用block)
// 例如如果有很多動畫時，每個動畫都 delegate 回去，會需要加上許多判斷
// delegate 傳入的 animation，事實上是當時 animation 的 deep copy


// CAKeyframeAnimation 跟 CABasicAnimation 一樣都是針對一個 property 做動畫
// 但是可以設置一連串得值

var keyframeAnimation = CAKeyframeAnimation()
keyframeAnimation.keyPath = "backgroundColor"
keyframeAnimation.duration = 2.0
keyframeAnimation.values = [
    UIColor.blackColor().CGColor,
    UIColor.redColor().CGColor,
    UIColor.greenColor().CGColor,
    UIColor.blueColor().CGColor
]
// 除了用 value 也可用 path
keyframeAnimation.path
// 自動沿著切線移動
keyframeAnimation.rotationMode = kCAAnimationRotateAuto

// 虛擬屬性
// 根据通过CAValueFunction来计算的值来更新transform属性
keyframeAnimation.keyPath = "transform.rotation"

// Animation Group
var animationGroup = CAAnimationGroup()
animationGroup.animations = [basicAnimation,keyframeAnimation]

// CATransition
// Type:
//     kCATransitionFade
//     kCATransitionMoveIn
//     kCATransitionPush
//     kCATransitionReveal
// Subtype:
//     kCATransitionFromRight
//     kCATransitionFromLeft
//     kCATransitionFromTop
//     kCATransitionFromBottom

// 隱式 transition
// 同隱式動畫只能作用於自己生出來的 layer.content

// Animating Layer Tree Changes 略

// Custom Animation 略

// 取消進行中動畫
// 我們可以用 -addAnimation:forKey: 加入一筆動畫
// 並且用 - (CAAnimation *)animationForKey:(NSString *)key; 檢查是否加入成功
// 當一個動畫執行完畢之後，這個動畫將會被移除
// 我們可以用 removedOnCompletion = false，防止動畫被移除。
// 但是會被儲存在內存，直到layer被回收。

// Layer Time