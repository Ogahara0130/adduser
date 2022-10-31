class CreateUserinfos < ActiveRecord::Migration[7.0]
  def change
 
    create_table :userinfos do |t|
      t.string :name_first
      t.string :name_last
      t.string :name_first_read
      t.string :name_last_read
      t.string :sex
      t.date :birthday
      t.string :postnumber
      t.string :prefecture
      t.string :municipalities
      t.string :street
      t.string :tel_main
      t.string :tel_selpfhone
      t.string :mail_pc
      t.string :mail_pass
      t.string :survey_experience
      t.boolean :traffic_survey
      t.boolean :driving_survey
      t.boolean :bus_survey
      t.boolean :questionnaire_distribution
      t.boolean :interview_survey
      t.boolean :visit_survey
      t.boolean :undercover_investigation
      t.boolean :office_staff
      t.string :nearest_office
      t.string :possession_car
      t.string :nearest_station
      t.string :cognitive_pathway
      t.string :cognitive_pathway_other
      t.string :password

      t.timestamps
    end
  end
end
