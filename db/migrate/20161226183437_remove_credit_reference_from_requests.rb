class RemoveCreditReferenceFromRequests < ActiveRecord::Migration[5.0]
  def change
    remove_reference :requests, :credit
  end
end
