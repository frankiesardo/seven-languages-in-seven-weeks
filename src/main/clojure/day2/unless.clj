(defmacro unless [test body]
        (list 'if (list 'not test) body))

(defmacro unless [test unless-body else-body]
        (list 'if (list 'not test) unless-body else-body))