import UIKit

class ViewController: UIViewController {
    
    //MARK: - outlet
    @IBOutlet weak var textFieldData1: UITextField!
    @IBOutlet weak var textFieldData2: UITextField!
    @IBOutlet weak var upperLetterCount: UILabel!
    @IBOutlet weak var lowerLetterCount: UILabel!
    @IBOutlet weak var textShow: UILabel!
    
    var textCount = 0
    
    //MARK: - viewControllerDelegates
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldData1.delegate = self
        textFieldData2.delegate = self
        upperLetterCount.text = "Letter Count: \(textCount)"
        lowerLetterCount.text = "Letter Count: \(textCount)"
    }
}

//MARK: - textFieldDelegates
extension ViewController:UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldData1 {
            let newLength = textFieldData1.text!.utf16.count + string.utf16.count - range.length
            print("textField: \(textFieldData1.text!.utf16.count) and string: \(string.utf16.count) and range: \(range.length)")
            upperLetterCount.text = "Letter Count: \(String(newLength)) "
        }
        if textField == textFieldData2 {
            let newLength = textFieldData2.text!.utf16.count + string.utf16.count - range.length
            lowerLetterCount.text = "Letter Count: \(String(newLength)) "
            
           if let text = textFieldData2.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                textShow.text = updatedText
            }
        }
        return true
    }
}

