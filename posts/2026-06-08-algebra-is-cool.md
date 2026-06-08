---
title: Algebra is cool.
---

We define the binary operation $\circ$ for our type A. It takes two values of type A and produces a third value of type A. 

```
A -> A -> A. 
```

A type with such a binary operation is a *Magma*.

Requiring $\circ$ to be associative turns the type from a *Magma* to a *Semigroup*.

Adding an *identity element* to the semigroup yields a Monoid. That is, a Monoid is a type with an associative binary operation and identity element.

E.g. for natural numbers and addition, the identity element is 0. For natural numbers and multiplication, the identity element is 1.

---

Notes based on chapter "Algebra is cool" from the book "Magical Haskell".
