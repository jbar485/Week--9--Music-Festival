class Artist

  @@artists = {}
  @@total_rows = 0

  def initialize(name, stage_id, id)
    @name = name
    @stage_id = stage_id
    @id = id || @@total_rows += 1
  end
end
