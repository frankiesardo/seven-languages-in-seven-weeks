(def accounts (ref {}))

(defn create-account [account-name]
  (dosync (alter accounts assoc account-name 0)))


(defn deposit-account [account-name sum]
  (dosync (alter accounts assoc account-name (+ (accounts account-name) sum))))

(defn withdraw-account [account-name sum]
  (dosync (alter accounts assoc account-name (- (accounts account-name) sum))))

(defn close-account [account-name]
  (dosync (alter accounts dissoc account-name)))



(create-account :foo)

(deposit-account :foo 4)

(withdraw-account :foo 4)

(close-account :foo)