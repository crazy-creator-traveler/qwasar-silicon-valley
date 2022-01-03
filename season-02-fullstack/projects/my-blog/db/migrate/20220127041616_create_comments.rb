class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true # creates an integer column called article_id,
                                                            # an index for it, and a foreign key constraint that points to the id column of the articles table.

      t.timestamps
    end
  end
end
