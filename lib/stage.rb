class Stage
  attr_reader :name, :location, :id

  @@stages = {}
  @@total_rows = 0

  def initialize(name, location, id)
    @name = name
    @location = location
    @id = id || @@total_rows += 1
  end

  def self.all
    @@stages.values().sort { |a, b| a.name.downcase <=> b.name.downcase}
  end

  def self.search(x)
    @@stages.values().select {|e| /#{x}/i.match? e.name}
  end

  def save
    @@stages[self.id] = Stage.new(self.name, self.location, self.id)
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@stages[id]
  end

  def update(name, location)
    if name != ""
      @name = name
    end
    if location != ""
      @location = location
    end
  end

  def delete
    @@stages.delete(self.id)
  end

  def artists
    Artist.find_by_stage(self.id)
  end
end
