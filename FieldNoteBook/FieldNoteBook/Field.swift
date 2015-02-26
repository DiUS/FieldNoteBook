import Foundation

class Field: Hashable {
  
  var label: String = ""
  var type: FieldType = FieldType.String
  
  var hashValue: Int {
    return self.label.hash
  }
}

func ==(lhs: Field, rhs: Field) -> Bool {
  return lhs.label == rhs.label
         && lhs.type == rhs.type
}

enum FieldType {
  case String
  case Integer
  case Decimal
}
