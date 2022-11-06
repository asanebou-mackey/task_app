class User < ApplicationRecord
    validates :title, presence: true   #タイトル入力欄が空ではないか
    validates :startday, presence: true   #開始日入力欄が空ではないか
    validates :endday, presence: true   #終了日入力欄が空ではないか
    validate :date_before_start
    validate :date_before_finish

    def date_before_start
        return if startday.blank?
        errors.add(:startday, "は今日以降のものを選択してください") if startday < Date.today
      end
    
      def date_before_finish
        return if endday.blank? || startday.blank?
        errors.add(:endday, "は開始日以降のものを選択してください") if endday < startday
      end
end
