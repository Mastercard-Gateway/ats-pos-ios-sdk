/*
 Copyright (c) 2019 Mastercard
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit
import QuartzCore

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .white {
        didSet{
            setupGradient()
        }
    }
    
    @IBInspectable var endColor: UIColor = .lightGray {
        didSet{
            setupGradient()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupGradient()
        }
    }
    
    override class var layerClass: Swift.AnyClass { return CAGradientLayer.self }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    private func setupGradient(){
        
        let colors:Array<AnyObject> = [startColor.cgColor, endColor.cgColor]
        gradientLayer.colors = colors
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
        
    }
    
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    override func prepareForInterfaceBuilder() {
        setupGradient()
    }
    
}
