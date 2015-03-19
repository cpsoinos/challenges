class Recipe

  def initialize(id)
    @id = id
  end

  attr_accessor :id

  def self.db_connection
    begin
      connection = PG.connect(dbname: "recipes")
      yield(connection)
    ensure
      connection.close
    end
  end

  def self.all
    @recipes = []
    sql = "SELECT * FROM recipes ORDER BY name"
    @all_recipes = db_connection { |conn| conn.exec_params(sql) }.to_a
    @all_recipes.each do |recipe|
      @recipes << recipe
    end
  end


end
