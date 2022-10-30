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
    validates :postnumber, format: { with: /\A\d{3}[-]?\d{4}\z/, message: 'は半角英数字で正しい桁数で入力してください。'} 
    #都道府県
    validates :prefecture, presence: { message: 'が選択されていません。' } 
    #市区町村名,番地名
    validates :municipalities,
              :street,
              presence: { message: 'が入力されていません。' }

    #PCメールアドレス,携帯メールアドレス          
    validates :mail_pc_or_pass, presence: { message: 'を入力してください。' }
    validates :mail_pc, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, if: :mail_pc_presence?
    validates :mail_pass, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, if: :mail_pass_presence?

    #調査経験回数
    validates :survey_experience, presence: { message: 'が選択されていません。' } 
    #希望する調査
    validates :desire_survey_check, presence: { message: 'が選択されていません。' }  
    #車の保有について,認知経路
    validates :possession_car,
              :cognitive_pathway,
              presence: { message: 'が選択されていません。' } 
    #認知経路
    validates :cognitive_pathway, presence: { message: 'が選択されていません。' } 
    #パスワード
    validates :password, presence: { message: 'が入力されていません。' } 
 
    #PCメールアドレスか携帯メールアドレスのどちらかが入力されているか
    private
    def mail_pc_or_pass
        mail_pc.presence or 
        mail_pass.presence
    end

    #PCメールアドレスが入力されているか
    private
    def mail_pc_presence?
        mail_pc.presence
    end    

    #携帯メールアドレスが入力されているか
    private
    def mail_pass_presence?
        mail_pass.presence
    end   

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
