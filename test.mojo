
from std.primitive import UInt8

fn main():
    let x: UInt8 = 255
    let y: UInt8 = 2
    let z: UInt8 = x - y
    
    print(z.to_int())