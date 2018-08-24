class Queue

   def initialize
     @qvar = []
   end

   def enqueue(el)
     @qvar.push(el)
   end

   def dequeue
     @qvar.shift
   end

   def peek
     @qvar.first
   end

end
