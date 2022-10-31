class HomesController < ApplicationController
  def top
    @userinfos = Userinfo.new
  end

  def confirm
    # セッションに保存する
    session[:userinfos] = Userinfo.new(userinfos_params)

    @userinfos = Userinfo.new(userinfos_params)
    render :top if @userinfos.invalid?
  end 

	def back
    params[:userinfo] = session[:userinfos]
		@userinfos = Userinfo.new(userinfos_params)
		render :top
	end

  def create
    params[:userinfo] = session[:userinfos]
    @userinfos = Userinfo.new(userinfos_params)
    if @userinfos.save
      p "会員登録成功！"
    else
      p "会員登録失敗"
    end
    session[:userinfos].clear
  end 

  def userinfos_params
    params.require(:userinfo).permit(:name_first, :name_last, :name_first_read, :name_last_read, :sex, :birthday, :postnumber, :prefecture, :municipalities, :street, :tel_main, :tel_selpfhone, :mail_pc, :mail_pass, :survey_experience, :traffic_survey, :driving_survey, :bus_survey, :questionnaire_distribution, :interview_survey, :visit_survey, :undercover_investigation, :office_staff, :nearest_office, :possession_car, :nearest_station, :cognitive_pathway, :cognitive_pathway_other, :password)
  end
end
