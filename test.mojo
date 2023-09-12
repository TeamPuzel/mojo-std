
from std.primitive import Maybe

fn main():
    let x = Maybe[Int]()
    print(x.is_none())