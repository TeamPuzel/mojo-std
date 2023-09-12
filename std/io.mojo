
from sys.intrinsics import external_call
from .c import CInt

fn print[T: AnyType](format: StringLiteral, value: T):
    _ = external_call["printf", CInt](format.data(), value, 1)