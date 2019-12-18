require 'rspec'
require 'stage'
require 'pry'


describe '#Stage' do
  before(:each) do
    Stage.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no stages") do
      expect(Stage.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a new stage") do
      stage = Stage.new("Red Stage", "North", nil)
      stage.save()
      stage2 = Stage.new("Blue Stage", "West", nil)
      stage2.save()
      expect(Stage.all).to(eq([stage2, stage]))
    end
  end
  describe('#==') do
    it("is the same stage if it has the same attributes as another stage") do
      stage = Stage.new("Red Stage", "North", nil)
      stage2 = Stage.new("Red Stage", "North", nil)
      expect(stage).to(eq(stage2))
    end
  end
  describe('.clear') do
    it("clears all stages") do
      stage = Stage.new("Red Stage", "North", nil)
      stage.save()
      stage2 = Stage.new("Blue Stage", "West", nil)
      stage2.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end
  end
  describe('.find') do
    it("finds an stage by id") do
      stage = Stage.new("Red Stage", "North", nil)
      stage.save()
      stage2 = Stage.new("Blue Stage", "West", nil)
      stage2.save()
      expect(Stage.find(stage.id)).to(eq(stage))
    end
  end
  describe('#update') do
  it("updates an stage by id") do
    stage = Stage.new("Red Stage", "North", nil)
    stage.save()
    stage.update("Yellow Stage", "South")
    expect(stage.name).to(eq("Yellow Stage"))
  end
end
describe('#delete') do
    it("deletes an stage by id") do
      stage = Stage.new("Red Stage", "North", nil)
      stage.save()
      stage2 = Stage.new("Blue Stage", "West", nil)
      stage2.save()
      stage.delete()
      expect(Stage.all).to(eq([stage2]))
    end
  end
end
