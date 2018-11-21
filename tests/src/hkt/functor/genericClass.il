// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib
{
}

.assembly genericClass
{
}

.class KindedClass`1<T<A>>
{
  .field public !T<int32> int_thing

  .field public !T<float32> float_thing
}

.method private hidebysig static int32 Main() cil managed
{
  .entrypoint
  .maxstack  8
  .locals init (
    [0] class [mscorlib]System.Type typClass,
    [1] class [mscorlib]System.Reflection.FieldInfo fInt,
    [2] class [mscorlib]System.Reflection.FieldInfo fFloat
  )

  ldtoken KindedClass`1
  call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
  stloc typClass

  ldloc typClass
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typClass
  ldstr "int_thing"
  callvirt instance class [mscorlib]System.Reflection.FieldInfo [mscorlib]System.Type::GetField(string)
  stloc fInt

  ldloc fInt
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typClass
  ldstr "float_thing"
  callvirt instance class [mscorlib]System.Reflection.FieldInfo [mscorlib]System.Type::GetField(string)
  stloc fFloat

  ldloc fFloat
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  // Now with an instantiation

  ldtoken class KindedClass`1<class [mscorlib]System.Collections.Generic.List`1>
  call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
  stloc typClass

  ldloc typClass
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typClass
  ldstr "int_thing"
  callvirt instance class [mscorlib]System.Reflection.FieldInfo [mscorlib]System.Type::GetField(string)
  stloc fInt

  ldloc fInt
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typClass
  ldstr "float_thing"
  callvirt instance class [mscorlib]System.Reflection.FieldInfo [mscorlib]System.Type::GetField(string)
  stloc fFloat

  ldloc fFloat
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldc.i4     100
  ret
}
