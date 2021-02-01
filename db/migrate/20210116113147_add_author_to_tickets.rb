# frozen_string_literal: true

class AddAuthorToTickets < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :author, null: false, index: true
    add_foreign_key :tickets, :users, column: :author_id
  end
end
