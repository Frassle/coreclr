// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib
{
}

.assembly pair
{
}

.class Single`1<A>
{
  .method public specialname rtspecialname instance void .ctor () cil managed
  {
    .maxstack 8

    ldarg.0
    call instance void [mscorlib]System.Object::.ctor()
    ret
  }

  .field public !A a_thing
}

.class Pair`2<A,B>
{
  .method public specialname rtspecialname instance void .ctor () cil managed
  {
    .maxstack 8

    ldarg.0
    call instance void [mscorlib]System.Object::.ctor()
    ret
  }

  .field public !A a_thing;
  .field public !B b_thing;
}


.method private static void PrintSingle<.ctor T<A>>() cil managed 
{
  .maxstack 8
  .locals init (
    [0] class [mscorlib]System.Type typT,
    [1] object thing
  )

  ldstr "PrintSingle"
  call void [mscorlib]System.Console::WriteLine(string)

  ldtoken !!T<int32>
  call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
  stloc typT

  ldloc typT
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typT
  call object [mscorlib]System.Activator::CreateInstance(class [mscorlib]System.Type)
  stloc thing
  ldloc thing
  callvirt instance class [mscorlib]System.Type [mscorlib]System.Object::GetType()
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)
  ret
}

.method private static void PrintPair<.ctor T<A, B>>() cil managed 
{
  .maxstack 8
  .locals init (
    [0] class [mscorlib]System.Type typT,
    [1] !!T thing
  )

  ldstr "PrintPair"
  call void [mscorlib]System.Console::WriteLine(string)


  ldtoken !!T<int32, float32>
  call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
  stloc typT

  ldloc typT
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typT
  call object [mscorlib]System.Activator::CreateInstance(class [mscorlib]System.Type)
  stloc thing
  ldloc thing
  callvirt instance class [mscorlib]System.Type [mscorlib]System.Object::GetType()
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)
  ret
}

.method private hidebysig static int32 Main() cil managed
{
  .entrypoint
  .maxstack  8
  .locals init (
    [0] class [mscorlib]System.Type typClass,
    [1] class [mscorlib]System.Reflection.FieldInfo fThing
  )

  call void PrintSingle<class Single`1>()

  // Load and print a two param type
  call void PrintPair<class Pair`2>()
  
  ldc.i4     100
  ret
}
