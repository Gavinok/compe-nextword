;; TODO add Source.documentation(self, context)
;;   and use a dictionary to find the definition of context.completed.word
(local compe (require :compe))
(local Job (require :plenary.job))

(local Source [])

(fn Source.new []
  (let [self (setmetatable {} { :__index Source })]
    self))


(fn Source.get_metadata [ self ]
  {
   :priority  100
   :dup  0
   :menu  "[nextword]"
   })

(fn Source.determine [self context]
  (compe.helper.determine context))

(fn Source.complete [self context]
  (self:collect context.context.before_line context.callback))

(fn Source.collect [self input callback]
  (var results [])
  (let [ job (Job:new {:command  "nextword"
                       :cwd  (vim.fn.getcwd)
                       :on_stdout  (fn [_ data]
                                     (let [pieces (vim.split data  " "  true)]
                                       (each [ _ v (ipairs pieces) ]
                                         (table.insert results  { :word  v })))
                                     (callback {
                                                :items  results
                                                :incomplete  true
                                                }))})]
    (job:start)
    (job:send (.. input "\n")))
  results)

(compe.register_source :nextword Source)
