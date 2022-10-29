class Userinfo < ApplicationRecord
    #姓（漢字）,名（漢字）,せい（ふりがな）,めい（ふりがな）
    validates :name_first,
              :name_last,
              :name_first_read,
              :name_last_read,
              presence: { message: 'が入力されていません。' }
    #性別,生年月日
    validates :sex,
              :birthday,
              presence: { message: 'が選択されていません。' } 
    #郵便番号
    validates :postnumber, presence: { message: 'が入力されていません。' } 
    #都道府県
    validates :prefecture, presence: { message: 'が選択されていません。' } 
    #市区町村名,番地名,自宅電話番号,携帯電話番号
    validates :municipalities,
              :street,
              :mail_pc,
              :mail_pass,
              presence: { message: 'が入力されていません。' }
    #調査経験回数
    validates :survey_experience, presence: { message: 'が選択されていません。' } 
    #希望する調査
    validates :desire_survey_check, presence: { message: 'が選択されていません。' }  
    #最寄SRC事務所,車の保有について
    validates :nearest_office,
              :possession_car,
              :cognitive_pathway,
              presence: { message: 'が選択されていません。' } 
    #自宅最寄り駅
    validates :nearest_station, presence: { message: 'が入力されていません。' }
    #認知経路
    validates :cognitive_pathway, presence: { message: 'が選択されていません。' } 
    #認知経路 その他,パスワード
    validates :cognitive_pathway_other,
              :password,
              presence: { message: 'が入力されていません。' } 
    
    #希望する調査のチェックボックスのどれかにチェックされているか
    private
    def desire_survey_check
        traffic_survey.presence or 
        driving_survey.presence or
        bus_survey.presence or
        questionnaire_distribution.presence or
        interview_survey.presence or
        visit_survey.presence or
        undercover_investigation.presence or
        office_staff.presence  
    end
 end
