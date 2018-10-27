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

  ldtoken Functor`1
  call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)

  dup
  callvirt instance bool [mscorlib]System.Type::get_IsGenericType()
  call void [mscorlib]System.Console::WriteLine(bool)

  ldstr "fmap"
  callvirt instance class [mscorlib]System.Reflection.MethodInfo [mscorlib]System.Type::GetMethod(string)
  call void [mscorlib]System.Console::WriteLine(object)

  ldc.i4     100
  ret
}
