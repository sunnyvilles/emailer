class CreateMailsPatientsJoin < ActiveRecord::Migration
 def up
  	create_table :mails_patients, :id => false do |t|
  		
  		t.integer "patient_id"
  		t.integer "mail_id"

  	end
  	add_index :mails_patients , ["patient_id" , "mail_id"]

  end

  def down

  	drop_table :mails_patients 
  end
end
