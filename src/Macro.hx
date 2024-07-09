#if macro
import haxe.macro.Context;
import haxe.macro.Type;
import haxe.macro.Expr;
import haxe.macro.TypeTools;
#end
// use this for macros or other classes
class Macro {

	#if macro
	public static function build() {
		var fields = Context.getBuildFields();
		var cl = Context.getLocalClass().get();
		var itemType = Context.getLocalType();
		var itemComplexType = TypeTools.toComplexType(itemType);

		var type:TypeDefinition = {
			pos: Context.currentPos(),
			name: cl.name + "Collection",
			pack: cl.pack,
			kind: TDClass({pack: ["col"],name: "Collection", params: [TPType(itemComplexType)]}),
			fields: [],
		}
		var module = Context.getLocalModule();
		Context.defineType(type, module);

		return fields;
	}
	#end
}
