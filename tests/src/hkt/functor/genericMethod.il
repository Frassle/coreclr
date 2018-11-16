// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib
{
}

.assembly genericMethod
{
}

.method private hidebysig static !!T GenericMethod<T>(!!T thing) cil managed
{
  .maxstack  8

  ldarg 0
  ret
}

.method private hidebysig static !!T<int32> KindedMethod<T<A>>(!!T<int32> thing) cil managed
{
  .maxstack  8

  ldarg 0
  ret
}

.method private hidebysig static int32 Main() cil managed
{
  .entrypoint
  .maxstack  8
  .locals init (
    [0] class [mscorlib]System.Reflection.MethodBase methodBase,
    [1] class [mscorlib]System.Type typT,
    [2] class [mscorlib]System.Type typA
  )

  ldtoken method !!0<int32> KindedMethod<[1]>(!!0<int32>)
  call class [mscorlib]System.Reflection.MethodBase [mscorlib]System.Reflection.MethodBase::GetMethodFromHandle(valuetype [mscorlib]System.RuntimeMethodHandle)
  stloc methodBase

  ldloc methodBase
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc methodBase
  callvirt instance class [mscorlib]System.Type[] [mscorlib]System.Reflection.MethodInfo::GetGenericArguments()
  ldc.i4 0
  ldelem [mscorlib]System.Type
  stloc typT

  ldloc typT
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typT
  callvirt instance class [mscorlib]System.Type[] [mscorlib]System.Type::GetGenericArguments()
  ldc.i4 0
  ldelem [mscorlib]System.Type 
  stloc typA

  ldloc typA
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  // Now with an instantiation

  ldtoken method !!0<int32> KindedMethod<class [mscorlib]System.Collections.Generic.List`1>(!!0<int32>)
  call class [mscorlib]System.Reflection.MethodBase [mscorlib]System.Reflection.MethodBase::GetMethodFromHandle(valuetype [mscorlib]System.RuntimeMethodHandle)
  stloc methodBase

  ldloc methodBase
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc methodBase
  callvirt instance class [mscorlib]System.Type[] [mscorlib]System.Reflection.MethodInfo::GetGenericArguments()
  ldc.i4 0
  ldelem [mscorlib]System.Type
  stloc typT

  ldloc typT
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typT
  callvirt instance class [mscorlib]System.Type[] [mscorlib]System.Type::GetGenericArguments()
  ldc.i4 0
  ldelem [mscorlib]System.Type 
  stloc typA

  ldloc typA
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  newobj instance void class [mscorlib]System.Collections.Generic.List`1<int32>::.ctor()
  //call !!0<int32> KindedMethod<class [mscorlib]System.Collections.Generic.List`1>(!!0<int32>)
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldc.i4     100
  ret
}
