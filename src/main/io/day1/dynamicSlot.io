dynamicSlot := Object clone do(
  foo := method("Foo" println)
  bar := method("Bar" println)
  baz := method("Baz" println)
)
 
dynamicSlot getSlot(System args at(1)) call