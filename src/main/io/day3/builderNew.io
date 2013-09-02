OperatorTable addAssignOperator(":", "atPutValue") 

curlyBrackets := method(
  map := Map clone
  call message arguments foreach(arg,
    map doMessage(arg)
  ) 
  map
)

Map atPutValue := method(
  self atPut(
  call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), call evalArgAt(1))
)
 
Builder := Object clone do (
  level := 0 	
  tab := "  "
  
  indent := method(
  	spacing := ""
  	level repeat(spacing = spacing .. tab)
  	spacing
  )
  
  forward := method(    
    arguments := call message arguments
    name := call message name
    
    attrs := ""    
    if(arguments size > 0 and arguments at(0) name == "curlyBrackets",
      attrsBuilder := arguments removeFirst
      attrsMap := doMessage(attrsBuilder)
      attrs = attrsMap map(key, value, " #{key}=\"#{value}\"" interpolate) join("")
    )
        
    writeln(indent, "<", name, attrs, ">")
    
    arguments foreach(arg,
      level = level + 1 
      content := self doMessage(arg)
      if (content type == "Sequence", writeln(indent, content))
      level = level - 1
    )
    
    writeln(indent, "</", name, ">")
  )
)

// Must use the test from another file
// Otherwise OperatorTable will not have ":" overridden
// See http://groups.yahoo.com/neo/groups/iolanguage/conversations/topics/12574

doFile("builderTest.io")

/*

<ul>
  <li author="Steve Dekorte">
    Io
  </li>
  <li author="Roberto Ierusalimschy">
    Lua
  </li>
  <li author="Brendan Eich">
    JavaScript
  </li>
</ul>

*/