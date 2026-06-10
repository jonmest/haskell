---
title: Algebra is cool.
---

In an attempt to learn Haskell, I've started studying category theory. A major part of Haskell's appeal seems to lie beyond the mundane details of syntax, standard libraries and tooling. Therefore, to *profoundly* understand what it's all about, it seems necessary to learn the theoretical foundations Haskell's built on.

To my help, I have the books "Magical Haskell", "Category Theory for Programmers" and various blogs.

---

## Set
A *set* is a collection of *items*. There is no relationship between the items, they have no ordering, no structure. You can't combine them or really do anything particularly interesting with its items.

## Magma 
A *magma* is a set with one addition: There is a binary operation $\circ$ such that, given the items A and B, $A \circ B = C$ where C is another item in the set, that is, the set is *closed under the binary operation*. I'm putting it that way because that's the phrase I got aqcuainted with during my undergrad studies in Sweden - not entirely sure it's correct, especially in English. One example of a Magma is the natural numbers under subtraction.

## Semigroup
A *semigroup* is a magma with the additional property that the binary operation is associative. An example is the natural numbers under addition. The associative property is paramount; you can use divide-and-conquer and apply parallelism.

## Monoid
A *monoid* is a semigroup with the *identity element*. Any value A in the group, when combined with the identity element, yields A. For addition, the identity element is 0 since $A + 0 = A$. For multiplication, this is 1 since $A \cdot 1 = A$. For string concatenation, it's the empty string "" and for list concatenation the empty list [].

The identity element matters because that allows us to sensibly express the empty case, and as a consequence, accumulation of zero to many elements.

## Group
Consider a monoid and add one more property: Every element has an inverse. That is, every element $a$ has the inverse $a^{-1}$. This property gives us a *group*.

Whereas monoids are about accumulation, nonreversible and lossy, groups are about reversible transformations. The group does not care about *what* the elements are - it is all about how the relate to one another, about actions that compose and can be reversed.

## Morphisms (arrows)
A morphism (arrow) is anything that behaves compositionally. If there is an arrow from A to B, and another one from B to C, there is also an arrow from A to C.

A function can be an arrow, but an arrow does not have to be a function. It can also be a path between two cities, a logical proof or a database migration.

What's important about arrows is that the hold no regard for what the elements themselves actually are - only the relations between them. 
