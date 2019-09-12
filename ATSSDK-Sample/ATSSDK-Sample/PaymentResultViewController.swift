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

class PaymentResultViewController: UIViewController {
    
    @IBOutlet weak var resultImageView: UIImageView?
    @IBOutlet weak var resultLabel: UILabel?
    @IBOutlet weak var resultCard: GradientView?
    @IBOutlet weak var doneButton: UIButton?
    
    var successful: Bool = true {
        didSet {
            syncView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func syncView() {
        let startColor = successful ? UIColor(named: "successGradientStart")! : UIColor(named: "failGradientStart")!
        let endColor = successful ? UIColor(named: "successGradientEnd")! : UIColor(named: "failGradientEnd")!
        
        resultImageView?.image = successful ? #imageLiteral(resourceName: "approved") : #imageLiteral(resourceName: "declined")
        resultLabel?.text = successful ? "Your payment\nwas successful" : "Your payment\nhas failed"
        resultCard?.startColor = startColor
        resultCard?.endColor = endColor
        doneButton?.setTitleColor(endColor, for: .normal)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
