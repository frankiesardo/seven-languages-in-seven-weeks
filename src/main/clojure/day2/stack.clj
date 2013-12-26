 START:protocol
(defprotocol Stack
  (push-it [c value])
  (pop-it [c])
  (peek-it [c]))
; END:protocol

; START:defrecord
(defrecord SimpleStack [values]
  Stack
  (push-it [_ value] (cons value values))
  (pop-it [_] (SimpleStack. (rest values)))
  (peek-it [_] (first values))

  Object
  (toString [this] (str "[" (values this) "]")))
; END:object


(def c (SimpleStack. [:n :u :m]))

(peek-it c)

(pop-it c)

(push-it c :e)
