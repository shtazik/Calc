
import UIKit

//@IBDesignable
class Digit: UIView {
    static let shared = Digit()
    var isSetuped = false
    
        private let a = UIView()
        private let b = UIView()
        private let c = UIView()
        private let d = UIView()
        private let e = UIView()
        private let f = UIView()
        private let g = UIView()
        private let h  = UIView()
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            backgroundColor = UIColor.white.withAlphaComponent(0)
            let width = frame.size.width
            let height = frame.size.height
            let segWidth = 2
            let segHeigh = Int((Int(height) / 2) - segWidth)
            let segmentColor = #colorLiteral(red: 0.4872068763, green: 0.8960664868, blue: 0.8779244423, alpha: 1)
            let angle = CGFloat.pi * 2 * (0.03)
            a.frame = CGRect(x: segWidth * 2 + 1, y: 0, width: segHeigh - segWidth, height: segWidth)
            b.frame = CGRect(x: Int(width) - segWidth * 2, y: segWidth / 2, width: segWidth, height: segHeigh)
            c.frame = CGRect(x: Int(width) - segWidth * 3, y: Int(height) / 2 + segWidth / 2, width: segWidth, height: segHeigh)
            d.frame = CGRect(x: segWidth - 1, y: Int(height) - segWidth, width: segHeigh - segWidth, height: segWidth)
            e.frame = CGRect(x: -1, y: Int(height) / 2 + segWidth / 2, width: segWidth, height: segHeigh)
            f.frame = CGRect(x: segWidth - 1, y: segWidth, width: segWidth, height: segHeigh)
            g.frame = CGRect(x: segWidth + segWidth / 2, y: Int(height) / 2 - segWidth / 2, width: segHeigh - segWidth, height: segWidth)
            h.frame = CGRect(x: Int(width) - 1, y: Int(height) - 1, width: segWidth, height: segWidth)
            
            for v in [b, c, e, f]{
                v.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
                v.transform = CGAffineTransform(rotationAngle: angle)
            }

            for v in [a,b, c, d, e, f, g, h]{
                v.backgroundColor = segmentColor
//                v.isHidden = true
                addSubview(v)
            }
        }
    func showDigit(model: ModelOfNumber) {
        switch model.digit {
        case 1:
            for v in [b, c]{
                v.isHidden = false
            }
            for v in [a, d, e, f, g]{
                v.isHidden = true
            }
            point(point: model.point)
        case 2:
            for v in [a, b, d, e, g]{
                v.isHidden = false
            }
            for v in [c, f]{
                v.isHidden = true
            }
            point(point: model.point)
        case 3:
            for v in [a, b, c, d, g]{
                v.isHidden = false
            }
            for v in [e, f]{
                v.isHidden = true
            }
            point(point: model.point)
        case 4:
            for v in [b, c, f, g]{
                v.isHidden = false
            }
            for v in [a, d, e]{
                v.isHidden = true
            }
            point(point: model.point)
        case 5:
            for v in [a, c, d, f, g]{
            v.isHidden = false
        }
            for v in [b, e]{
            v.isHidden = true
        }
            point(point: model.point)
        case 6:
            for v in [a, c, d, e, f, g]{
                v.isHidden = false
        }
            for v in [b]{
                v.isHidden = true
        }
            point(point: model.point)
        case 7:
            for v in [a, b, c]{
                v.isHidden = false
            }
            for v in [d, e, f, g]{
                v.isHidden = true
            }
            point(point: model.point)
        case 8:
            for v in [a, b, c, d, e, f, g]{
                v.isHidden = false
            }
            point(point: model.point)
        case 9:
            for v in [a, b, c, d, f, g]{
                v.isHidden = false
            }
            for v in [e, h]{
                v.isHidden = true
            }
            point(point: model.point)
        case 0:
            for v in [a, b, c, d, e, f]{
                v.isHidden = false
            }
            for v in [g]{
                v.isHidden = true
            }
            point(point: model.point)
                                                    // Minus
        case 10:
            for v in [g]{
                v.isHidden = false
            }
            for v in [a, b, c, d, e, f, h]{
                v.isHidden = true
            }
                                                    //Error
        case 11:
            for v in [a, d, e, f, g]{
                         v.isHidden = false
                     }
            for v in [b, c, h]{
                         v.isHidden = true
                     }
        default:
             for v in [a, b, c, d, e, f, g, h]{
                v.isHidden = true
            }
        }
        
    }
    func point(point: Bool){
        h.isHidden = !point
    }
}
