import Foundation


let fieldTypeString = "string"
let fieldTypeInteger = "integer"
let fieldTypeDecimal = "decimal"

class Field : NSObject, NSCoding, Hashable {
  
  var label: String
  var type: String // one of the above
  
  init(label: String, type: String) {
    self.label = label
    self.type = type
  }
  
  required init(coder decoder: NSCoder) {
    self.label  = decoder.decodeObjectForKey("label") as String
    self.type   = decoder.decodeObjectForKey("type") as String
  }
  
  override var hashValue: Int {
    return self.label.hash
  }
  
  func encodeWithCoder(coder: NSCoder) {
    coder.encodeObject(self.label,  forKey: "label")
    coder.encodeObject(self.type,   forKey: "type")
  }
}

func ==(lhs: Field, rhs: Field) -> Bool {
  return lhs.label == rhs.label
         && lhs.type == rhs.type
}
