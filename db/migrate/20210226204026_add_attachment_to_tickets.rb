class AddAttachmentToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :attachment, :string
  end
end
