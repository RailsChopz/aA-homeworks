class Stack
    def initialize
      # create ivar to store stack here!
      @underlying_arr = []
    end

    def push(el)
      # adds an element to the stack
      underlying_arr.push(el)
    end

    def pop
      # removes one element from the stack
      underlying_arr.pop(el)
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      underlying_arr.last
    end
  end
