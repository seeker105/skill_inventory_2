require 'sequel'
require 'pry'
require_relative 'skill'

class SkillInventory
  attr_reader :database

  def initialize
    @database = Sequel.sqlite('db/skill_inventory.sqlite')
  end

  def create(skill)
    raw_skills.insert(skill)
  end

  def raw_skills
    database.from(:skills)
  end

  def all
    result = database.from(:skills).map do |skill|
      Skill.new(skill)
    end
    result ||= []
  end

  def raw_skill(id)
    raw_skills.where(:id => id).to_a.first
  end

  def find(id)
    Skill.new(raw_skill(id))
  end

  def update(id, skill)
    raw_skills.where(:id => id).update(skill)
  end

  def destroy(id)
    raw_skills.where(:id => id).delete
  end

end
