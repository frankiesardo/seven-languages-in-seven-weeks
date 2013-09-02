#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
vizzini := Object clone
vizzini talk := method(
            "Fezzik, are there rocks ahead?" println
            yield 
            "No more rhymes now, I mean it." println
             yield)

fezzik := Object clone

fezzik rhyme := method(
			yield
            "If there are, we'll all be dead." println
            yield 
            "Anybody want a peanut?" println)

vizzini @@talk; fezzik @@rhyme

Coroutine currentCoroutine pause