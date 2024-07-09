package col;

import col.Item;

@:keepSub
class Collection<T:Item> {
    
    public var items:Array<T>;
}