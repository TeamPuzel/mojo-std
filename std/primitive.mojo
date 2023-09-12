
@register_passable("trivial")
struct UInt8:
    alias Data = __mlir_type.ui8
    
    var value: Self.Data
    
    @always_inline
    fn __init__(value: Int) -> Self:
        return Self {
            value: __mlir_op.`index.castu`[_type: Self.Data](value.__mlir_index__())
        }
    
    @always_inline
    fn __add__(self, rhs: Self) -> Self:
        return Self(__mlir_op.`index.add`[_type: __mlir_type.index](
            __mlir_op.`index.castu`[_type: __mlir_type.index](self.value),
            __mlir_op.`index.castu`[_type: __mlir_type.index](rhs.value)
        ))
    
    @always_inline
    fn __sub__(self, rhs: Self) -> Self:
        return Self(__mlir_op.`index.sub`[_type: __mlir_type.index](
            __mlir_op.`index.castu`[_type: __mlir_type.index](self.value),
            __mlir_op.`index.castu`[_type: __mlir_type.index](rhs.value)
        ))
    
    @always_inline
    fn to_int(self) -> Int:
        return Int(__mlir_op.`index.castu`[_type: __mlir_type.index](self.value))

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