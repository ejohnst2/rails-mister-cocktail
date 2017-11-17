class CreateCocktails < ActiveRecord::Migrations
  def change
    create_table :cocktails do |t|
      t.string :name

      t.timestamps
    end
  end
end
