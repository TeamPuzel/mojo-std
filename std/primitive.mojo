
@register_passable("trivial")
struct UInt8:
    var value: __mlir_type.ui8
    
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type : __mlir_type.ui8](value.__mlir_index__())
        }

@register_passable("trivial")
struct UInt16:
    var value: __mlir_type.ui16
    
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type : __mlir_type.ui16](value.__mlir_index__())
        }

@register_passable("trivial")
struct UInt32:
    var value: __mlir_type.ui32
    
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type : __mlir_type.ui32](value.__mlir_index__())
        }

@register_passable("trivial")
struct UInt64:
    var value: __mlir_type.ui64
    
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type : __mlir_type.ui64](value.__mlir_index__())
        }

@register_passable("trivial")
struct Int8:
    var value: __mlir_type.ui8
    
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type : __mlir_type.ui8](value.__mlir_index__())
        }

@register_passable("trivial")
struct Int16:
    var value: __mlir_type.ui16
    
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type : __mlir_type.ui16](value.__mlir_index__())
        }

@register_passable("trivial")
struct Int32:
    var value: __mlir_type.ui32
    
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type : __mlir_type.ui32](value.__mlir_index__())
        }

@register_passable("trivial")
struct Int64:
    var value: __mlir_type.ui64
    
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type : __mlir_type.ui64](value.__mlir_index__())
        }

struct Maybe[T: AnyType]:
    var raw_value: T
    var wrapping: Bool
    
    fn __init__(inout self):
        self.raw_value = rebind[T, Int](0)
        self.wrapping = False
    
    fn __init__(inout self, owned value: T):
        self.raw_value = value
        self.wrapping = True
    
    fn unwrap(self) -> T:
        debug_assert(self.is_some(), "Unwrapped a none value")
        return self.raw_value
    
    fn is_some(self) -> Bool: return self.wrapping
    fn is_none(self) -> Bool: return not self.wrapping
    
    fn if_some(self, then: fn(T) -> None):
        if self.is_some(): then(self.unwrap())
    
    fn if_some(self, then: fn(T) capturing -> None):
        if self.is_some(): then(self.unwrap())
    
    fn if_none(self, then: fn() -> None):
        if self.is_none(): then()
    
    fn if_none(self, then: fn() capturing -> None):
        if self.is_none(): then()