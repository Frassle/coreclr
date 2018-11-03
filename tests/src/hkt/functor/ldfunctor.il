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
    [0] class [mscorlib]System.Type typ,
    [1] class [mscorlib]System.Type typA
  )

  ldtoken Functor`1
  call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
  stloc.0

  ldloc.0
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldstr "IsGenericType = {0}"
  ldloc.0
  callvirt instance bool [mscorlib]System.Type::get_IsGenericType()
  box bool
  call void [mscorlib]System.Console::WriteLine(class System.String, class System.Object)

  ldloc.0
  callvirt instance class [mscorlib]System.Type[] [mscorlib]System.Type::GetGenericArguments()
  ldc.i4 0
  ldelem [mscorlib]System.Type 
  stloc.1

  ldloc.1
  callvirt instance string [mscorlib]System.Object::ToString()
  call void [mscorlib]System.Console::WriteLine(string)

  ldstr "IsGenericType = {0}"
  ldloc.1
  callvirt instance bool [mscorlib]System.Type::get_IsGenericType()
  box bool
  call void [mscorlib]System.Console::WriteLine(class System.String, class System.Object)


  ldloc.0 
  ldstr "fmap"
  callvirt instance class [mscorlib]System.Reflection.MethodInfo [mscorlib]System.Type::GetMethod(string)
  call void [mscorlib]System.Console::WriteLine(object)

  ldc.i4     100
  ret
}
