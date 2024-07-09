# Type Build Test

This project is a demo to point a problem I have with macro and the compilation cache.

## Install

- Use Haxe 4.3.4
- Execute ```haxe setup.hxml```

## Run

- Open the project with VSCode and use ```build.hxml``` to build the project. The project is build with the compilation cache.
  You should see in the Debug Console ```src/Main.hx:7: null```

- Execute ```run.cmd``` this command line compile the project without the compilation cache and run the hl executable. 
  You should see in the terminal ```src/Main.hx:7: data.$WeaponCollection```

We can see, ```data.$WeaponCollection``` is available when compiled without the compilation cache but not with the compilation cache.

## What I do

```col.Item``` have a auto build macro (```Macro.build()```) that define a new type inherited from ```col.Collection```
```data.Weapon``` is a child of Item.hx and the macro build a new type ```data.WeaponCollection```

In Main.hx I tried to access to ```data.WeaponCollection``` with a string 
```
var collectionType = Type.resolveClass("data.WeaponCollection");
trace(collectionType);
```

build.hxml contains a line to include all type of ```data``` in the build ```--macro include("data",true)```
Without that line, ```data.WeaponCollection``` is not include in the build in both cases


## What I need

I need to generate a collection type base on the item. And I need to retrieve the collection type with a string (It's the important point because in my real project I read the type from a json file)
In fact I need to access to Weapon and WeaponCollection by a string without the types are imported in Main.hx

That works find without the compilation cache, but not with it.

I need help for this.

## What I suspect

First time the compilation is done with the compilation cache, the  ```data.WeaponCollection``` is correctly build because the ```Macro.build()``` is called. But after, the ```Macro.build()``` is not called anymore and the reference of ```data.WeaponCollection``` if not ``import`` is lost. 

I tried @:keep and @:keepSub that no nothing (It's not a probleme with DCE)

I don't know how to keep the reference of ```data.WeaponCollection``` in the compilation cache