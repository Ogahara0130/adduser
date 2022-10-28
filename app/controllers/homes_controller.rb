class HomesController < ApplicationController
  def top
    @userinfos = Userinfo.new
  end

  def confirm
    @userinfos = Userinfo.new(userinfos_params)
  end 

	def back
		@userinfos = Userinfo.new(userinfos_params)
		render :top
	end

  def userinfos_params
    params.require(:userinfo).permit(:name_first, :name_last, :name_first_read, :name_last_read, :sex, :birthday, :postnumber, :prefecture, :municipalities, :street, :tel_main, :tel_selpfhone, :mail_pc, :mail_pass, :survey_experience, :traffic_survey, :driving_survey, :bus_survey, :questionnaire_distribution, :interview_survey, :visit_survey, :undercover_investigation, :office_staff, :nearest_office, :possession_car, :nearest_station, :cognitive_pathway, :cognitive_pathway_other, :password)
  end
end
