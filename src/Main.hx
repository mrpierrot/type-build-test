
//import data.Weapon;
class Main extends hxd.App{

    override function init() {
        super.init();
        var weapons: data.WeaponCollection = Type.createEmptyInstance(data.WeaponCollection);
        trace(weapons); 
    }

    final override function update(pDt:Float) {
		
	}
    
    static function main() {
        //var weapon:Weapon = null;
        new Main();
        
    }
}