class CreateTurkishVerbs < ActiveRecord::Migration[7.0]
  def change
    create_table :turkish_verbs do |t|
      t.string :turkish
      t.string :english

      t.timestamps
    end
  end
end
