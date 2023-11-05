
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let filter = TestFilter()
        filter.inputImage = CIImage(color: CIColor.red)
        let outputImage = filter.outputImage!
        
        NSLog("Output \(outputImage)")
    }


}

