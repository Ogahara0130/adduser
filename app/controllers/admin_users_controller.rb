# coding: UTF-8
class AdminUsersController < ApplicationController
require 'csv'

  def new
   @user = AdminUser.new
   @userinfonew = Userinfo.all
  end

  def create
   user =AdminUser.new(admin_user_params)
   if user.save
     session[:user_id] = user.id
     redirect_to admin_user_path
   else
    render :new
   end
  end

  def show
   @userinfocsv = Userinfo.all
   @userinfo = Userinfo.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_users_csv(@userinfocsv)
      end
    end
  end

  #CSVファイルの書込み処理
  private
  def send_users_csv(userinfo)
   csv_data = CSV.generate(encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
      #encoding : utf-8
      header = %w(名前_姓 名前_名 ふりがな_姓_ ふりがな_名_ 性別 生年月日 郵便番号 県 市区町村 番地名 自宅電話 携帯電話 PCメールアドレス 携帯メールアドレス 調査経験回数 交通量調査 走行調査 バス調査 アンケート配布 聞き取り調査 訪問調査 覆面調査_店舗チェック 内勤スタッフ 最寄り事務所 車の所持 最寄り駅 認知経路 認知経路その他 パスワード 登録日時 更新日時)
      csv << header
      userinfo.each do |user|
        values = [
        user.name_first,
        user.name_last,
        user.name_first_read,
        user.name_last_read,
        user.sex,
        user.birthday,
        user.postnumber,
        user.prefecture,
        user.municipalities,
        user.street,
        user.tel_main,
        user.tel_selpfhone,
        user.mail_pc,
        user.mail_pass,
        user.survey_experience,
        user.traffic_survey,
        user.driving_survey,
        user.bus_survey,
        user.questionnaire_distribution,
        user.interview_survey,
        user.visit_survey,
        user.undercover_investigation,
        user.office_staff,
        user.nearest_office,
        user.possession_car,
        user.nearest_station,
        user.cognitive_pathway,
        user.cognitive_pathway_other,
        user.password,
        user.created_at,
        user.updated_at]
        csv << values
      end
    end
    send_data(csv_data, filename: "登録者一覧.csv")
  end

  private
  def admin_user_params
   params.require(:user).permit(:email, :password)
  end
end
