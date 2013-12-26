(def barber (agent 0))

(def available-seats (atom 0))

(defn do-haircut [served-customers]
  (swap! available-seats inc)
  (println "How do you want you hair cut?")
  (Thread/sleep 20)
  (inc served-customers))

(defn new-customer []
  (if (= @available-seats 0)
      (println "Sorry, pretty busy today.")
      (do
          (println "Welcome in!")
          (swap! available-seats dec)
          (send barber do-haircut))))

(defn let-customers-in [shift-time]
  (let [orig (System/currentTimeMillis)]
    (while (> shift-time (- (System/currentTimeMillis) orig))
      (Thread/sleep (+ 10 (rand 20)))
      (new-customer))))

(defn init [_ v] v)

(defn start-working [shift-time max-seats]
  (println "A good day to be a barber")
  (send barber init 0)
  (swap! available-seats init max-seats)
  (future (let-customers-in shift-time))
  (Thread/sleep shift-time)
  @barber)

 (start-working 10000 3)

