
import CoreImage

class TestFilter: CIFilter {
    var inputImage: CIImage?
    var inputParam: Float = 0.0
    
    static var kernel: CIKernel = { () -> CIKernel in
       let url = Bundle.main.url(forResource: "default",
                                withExtension: "metallib")!
       let data = try! Data(contentsOf: url)

        let kernelNames = CIKernel.kernelNames(fromMetalLibraryData: data)
        NSLog("Kernels \(kernelNames)")
       return try! CIKernel(functionName: "testFilter", fromMetalLibraryData: data)
    }()
    
    override var outputImage : CIImage? {
        guard let inputImage = inputImage else {
            return nil
        }
        
        return TestFilter.kernel.apply(extent: inputImage.extent, roiCallback: { (index, rect) in
            return rect }, arguments: [inputImage])
    }
}

class TestColorFilter: CIFilter {
    var inputImage: CIImage?
    var inputParam: Float = 0.0
    
    static var kernel: CIColorKernel = { () -> CIColorKernel in
        let url = Bundle.main.url(forResource: "default",
                                withExtension: "metallib")!
      let data = try! Data(contentsOf: url)
        let kernelNames = CIKernel.kernelNames(fromMetalLibraryData: data)
        NSLog("Kernels \(kernelNames)")
        
      return try! CIColorKernel(functionName: "testColorFilter",
                              fromMetalLibraryData: data)
    }()
    
    override var outputImage : CIImage? {
      get { guard let input = inputImage else { return nil }
         return TestColorFilter.kernel.apply(extent:input.extent,
                                 arguments:[input, inputParam])
      }
    }
}
