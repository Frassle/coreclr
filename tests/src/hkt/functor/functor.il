// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern mscorlib
{
}

.assembly functor
{
}

.class interface abstract Functor`1<T>
{
  .method public newslot abstract virtual instance 
    !T<!!B> fmap<A, B> (
      class [mscorlib]System.Func`2<!!A, !!B> mapper, 
      !T<!!A> v
    ) cil managed
  {
  }
}

.class public ListFunctor implements class Functor`1<class [mscorlib]System.Collections.Generic.List`1>
{
  .method public specialname rtspecialname instance void .ctor () cil managed
  {
    .maxstack 8

    ldarg.0
    call instance void [mscorlib]System.Object::.ctor()
    ret
  }

  .method public virtual instance class [mscorlib]System.Collections.Generic.List`1<!!B> fmap<A, B> (
    class [mscorlib]System.Func`2<!!A, !!B> mapper,
    class [mscorlib]System.Collections.Generic.List`1<!!A> v
  ) cil managed {
    .maxstack 8
    .locals init (
      [0] class [mscorlib]System.Collections.Generic.List`1<!!B> result,
      [1] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!!A>,
      [2] !!A item
    )

    newobj instance void class [mscorlib]System.Collections.Generic.List`1<!!B>::.ctor()
    stloc.0

    ldarg.2
    callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<!!A>::GetEnumerator()
    stloc.1

    br.s head

    start: 
      ldloc.0
      ldarg.1
      ldloca.s 1
      call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!!A>::get_Current()
      callvirt instance !1 class [mscorlib]System.Func`2<!!A, !!B>::Invoke(!0)
      callvirt instance void class [mscorlib]System.Collections.Generic.List`1<!!B>::Add(!0)

    head:
      ldloca.s 1
      call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!!A>::MoveNext()
      brtrue.s start

    ldloc.0
    ret
  }
}

.method private static float64 ToDouble(int32 v) cil managed
{
  .maxstack 1
  
  ldarg.0
  conv.r8
  ret
}

.method private static !!T<float64> MapDouble<T, .ctor (class Functor`1<!!T>) F>(!!T<int32> v) cil managed 
{
  .maxstack 8
  .locals init (
    [0] !!F functor
  )

  call !!0 [mscorlib]System.Activator::CreateInstance<!!F>()
  stloc.0
  ldloca.s functor
  ldnull
  ldftn float64 ToDouble(int32)
  newobj instance void class [mscorlib]System.Func`2<int32, float64>::.ctor(object, native int)
  ldarg.0
  constrained. !!F
  callvirt instance !0<!!1> class Functor`1<!!T>::fmap<int32, float64>(
      class [mscorlib]System.Func`2<!!0, !!1>,
      !0<!!0>)
  ret
}

.method private hidebysig static int32 Main() cil managed
{
  .entrypoint
  .maxstack  8

  newobj instance void class [mscorlib]System.Collections.Generic.List`1<int32>::.ctor()
  
  dup
  ldc.i4.1
  callvirt instance void class [mscorlib]System.Collections.Generic.List`1<int32>::Add(!0)

  dup
  ldc.i4.2
  callvirt instance void class [mscorlib]System.Collections.Generic.List`1<int32>::Add(!0)

  dup
  ldc.i4.3
  callvirt instance void class [mscorlib]System.Collections.Generic.List`1<int32>::Add(!0)

  call !!0<float64> MapDouble<class [mscorlib]System.Collections.Generic.List`1, class ListFunctor>(!!0<int32>)

  pop
  ldc.i4     100
  ret

  dup 
  ldc.i4.0
  callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<float64>::get_Item(int32)
  ldc.r8 1
  bne.un.s fail

  dup 
  ldc.i4.1
  callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<float64>::get_Item(int32)
  ldc.r8 2
  bne.un.s fail

  dup 
  ldc.i4.2
  callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<float64>::get_Item(int32)
  ldc.r8 3
  bne.un.s fail

  ldc.i4     100
  ret

  fail:
  ldc.i4 0
  ret
}
