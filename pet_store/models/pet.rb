require("pg")
require_relative("../db/sql_runner")

class Pet

  attr_accessor( :id, :name, :type, :store_id )

  def initialize( options )
    @id = options["id"].to_i
    @name = options["name"]
    @type = options["type"]
    @store_id = options["store_id"]
  end

  def save()
    sql = "INSERT INTO pets (name, type, store_id) VALUES ('#{@name}', '#{@type}', '#{@store_id}') RETURNING *;"
    pet = SqlRunner.run( sql ).first
    @id = pet["id"].to_i
  end

  def store()
    sql = "SELECT * FROM stores WHERE stores.id = #{@store_id};"
    store = SqlRunner.run( sql ).first
    store_obj = Store.new( store )
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = #{id};"
    pet = SqlRunner.run( sql ).first
    pet_obj = Store.new(pet)
    return pet_obj
  end

  def update()
    sql = "UPDATE pets SET (name, type) = ('#{@name}', '#{@type}') WHERE id = #{ @id };"
    updated_pet = SqlRunner.run( sql ).first
  end

  def self.delete(id)
    sql = "DELETE FROM pets WHERE id = #{id}"
    pet_delete = SqlRunner.run( sql )
  end

  def delete
    Pet.delete(@id)
  end

  def self.all()
    sql = "SELECT * FROM pets"
    pets = SqlRunner.run( sql )
    pets_obj = pets.map { |pet| Pet.new(pet) }
    return pets_obj
  end

end