require("pg")
require_relative("../db/sql_runner")

class Store

  attr_accessor( :id, :name, :address, :stock_type )

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @address = options["address"]
    @stock_type = options["stock_type"]
  end

  def save()
    sql = "
    INSERT INTO stores (name, address, stock_type) 
    VALUES ('#{ @name }', '#{ @address }', '#{ @stock_type }') 
    RETURNING *;
    "
    store = SqlRunner.run( sql ).first
    @id = store["id"].to_i
  end

  def pets()
    sql = "SELECT * FROM pets WHERE store_id = #{ @id };"
    pets = SqlRunner.run( sql )
    pet_objects = pets.map{ |pet|  Pet.new( pet ) }
    return pet_objects
  end

  def self.find(id)
    sql = "SELECT * FROM stores WHERE id = #{id};"
    store = SqlRunner.run( sql ).first
    store_obj = Store.new(store)
    return store_obj
  end

  def update()
    sql = "UPDATE stores SET (name, address, stock_type) = ('#{@name}', '#{@address}', '#{@stock_type}') WHERE id = #{ @id };"
    updated_store = SqlRunner.run( sql ).first
  end

  def self.delete(id)
    sql = "DELETE FROM stores WHERE id = #{id}"
    store_delete = SqlRunner.run( sql )
  end

  def delete
    Store.delete(@id)
  end

  def self.all()
    sql = "SELECT * FROM stores"
    stores = SqlRunner.run( sql )
    stores_obj = stores.map { |store| Store.new(store) }
    return stores_obj
  end

end