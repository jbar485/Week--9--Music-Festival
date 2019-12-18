class Stage

  @@stages = {}
  @@total_rows = 0

  def initialize(id)
    @id = id || @@total_rows += 1
  end
end
