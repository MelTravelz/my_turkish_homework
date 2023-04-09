class CreatePage < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :language
      t.string :theme_image
      t.string :word_prompt
      t.string :sent1
      t.string :sent2
      t.string :sent3
      t.string :sent4
      t.string :sent5
      t.string :sent6
      t.string :sent7
      t.string :sent8
      t.string :sent9
      t.string :sent10

      t.timestamps
    end
  end
end
