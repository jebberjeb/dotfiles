{:user {:plugins [[lein-immutant    "1.2.0"]
                  [lein-pprint      "1.1.1"]
                  [jonase/eastwood  "0.2.1"]
                  [cider/cider-nrepl "0.9.1"]]
        :dependencies [[org.clojure/tools.namespace "0.2.7"]
                       [ring-mock                   "0.1.5"]
                       [com.taoensso/timbre         "3.3.1"]
                       [grimvim                     "0.1.0"]]
        ;:ring {:nrepl {:start? true :port 50000}}
        }}
