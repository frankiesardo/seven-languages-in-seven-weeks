min([Head], Head).
min([Head|Tail], TailMin) :- min(Tail, TailMin), TailMin <= Head.
min([Head|Tail], Head) :- min(Tail, TailMin), TailMin > Head.