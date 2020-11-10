module EnumerableUtils

  # Performs a regular reduce operation passing 'prev_value' and batched sections
  # of 'list' to 'proc'.  The result of calling 'proc' will be passed as the
  # 'prev_value' to the next 'proc' call.  After all of 'list' has been processed
  # the final result of the 'proc' call is returned.  Note that 'list' may be
  # any class that implements Enumerable (eg: Array, File, ActiveRecord::Relation).
  # 'proc' may be either a Proc (lambda) or if left off a code block may be
  # provided.
  #
  # @param reduction [Object] initial value (eg: Set.new, [], {})
  # @param list [Enumerable] list to be sliced into batches of 'batch_size' and
  #             passed to 'proc' for processing
  # @param batch_size [int] size to slice 'list' into for processing
  # @param proc [Proc|nil] handler for processing 'list' in batches - if nil
  #             then will default to code block if block_given?
  # @yield [prev_value, list_batch] gives previous value returned and current
  #             batch of items from 'list' to 'proc' for processing
  # @return [Object] final value returned from proc
  def self.batch_reduce(reduction, list, batch_size = 10000, proc = nil)
    proc = Proc.new if block_given?
    raise "'list' must respond_to? :each_slice (include Enumerable)" unless list.respond_to?(:each_slice)
    raise "No 'proc' or block passed to batch_reduce!" unless proc
    list.each_slice(batch_size) do |list_batch|
      reduction = proc.call(reduction, list_batch)
    end
    reduction
  end

end