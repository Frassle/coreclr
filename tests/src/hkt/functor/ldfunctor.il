// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib
{
}

.assembly ldfunctor
{
}

.class interface abstract Functor`1<T<A>>
{
  .method public newslot abstract virtual instance 
    !T<!!B> fmap<A, B> (
      class [mscorlib]System.Func`2<!!A, !!B> mapper, 
      !T<!!A> v
    ) cil managed
  {
  }
}

.method private hidebysig static int32 Main() cil managed
{
  .entrypoint
  .maxstack  8
  .locals init (
    [0] class [mscorlib]System.Type typF,
    [1] class [mscorlib]System.Type typT,
    [2] class [mscorlib]System.Type typX,
    [3] class [mscorlib]System.Reflection.MethodInfo fmap,
    [4] class [mscorlib]System.Type typA,
    [5] class [mscorlib]System.Type typB
  )

  ldtoken Functor`1
  call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
  stloc typF

  ldloc typF
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldstr "IsGenericType = {0}"
  ldloc typF
  callvirt instance bool [mscorlib]System.Type::get_IsGenericType()
  box bool
  call void [mscorlib]System.Console::WriteLine(class System.String, class System.Object)

  ldloc typF
  callvirt instance class [mscorlib]System.Type[] [mscorlib]System.Type::GetGenericArguments()
  ldc.i4 0
  ldelem [mscorlib]System.Type 
  stloc typT

  ldloc typT
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldstr "IsGenericType = {0}"
  ldloc typT
  callvirt instance bool [mscorlib]System.Type::get_IsGenericType()
  box bool
  call void [mscorlib]System.Console::WriteLine(class System.String, class System.Object)

  ldloc typT
  callvirt instance class [mscorlib]System.Type[] [mscorlib]System.Type::GetGenericArguments()
  ldc.i4 0
  ldelem [mscorlib]System.Type
  stloc typX

  ldloc typX
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldstr "IsGenericType = {0}"
  ldloc typX
  callvirt instance bool [mscorlib]System.Type::get_IsGenericType()
  box bool
  call void [mscorlib]System.Console::WriteLine(class System.String, class System.Object)

  ldloc typF
  ldstr "fmap"
  callvirt instance class [mscorlib]System.Reflection.MethodInfo [mscorlib]System.Type::GetMethod(string)
  stloc fmap

  ldstr "Method.Name = {0}"
  ldloc fmap
  callvirt instance string [mscorlib]System.Reflection.MethodInfo::get_Name()
  call void [mscorlib]System.Console::WriteLine(class System.String, class System.Object)

  ldstr "IsGenericMethod = {0}"
  ldloc fmap
  callvirt instance bool [mscorlib]System.Reflection.MethodInfo::get_IsGenericMethod()
  box bool
  call void [mscorlib]System.Console::WriteLine(class System.String, class System.Object)

  ldloc fmap
  callvirt instance class [mscorlib]System.Type[] [mscorlib]System.Reflection.MethodInfo::GetGenericArguments()
  dup
  ldc.i4 0
  ldelem [mscorlib]System.Type
  stloc typA

  ldc.i4 1
  ldelem [mscorlib]System.Type
  stloc typB

  ldloc typA
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc typB
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc fmap
  callvirt instance class [mscorlib]System.Type [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldloc fmap
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldc.i4     100
  ret
}
