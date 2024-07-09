
class Main extends hxd.App{

    override function init() {
        super.init();
        var collectionType = Type.resolveClass("data.WeaponCollection");
        trace(collectionType);
    }

    final override function update(pDt:Float) {
		
	}
    
    static function main() {
        new Main();
        
    }
}