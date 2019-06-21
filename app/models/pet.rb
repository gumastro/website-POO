class Pet < ApplicationRecord
  has_one_attached :image
  belongs_to :owner
  has_one :volunteer
  validate :correct_image_type

    def idade

        idade = (Date.today.year - self.birthdate.year)
        if (Date.today.month < self.birthdate.month) or (Date.today.month == self.birthdate.month and Date.today.day < self.birthdate.day)
            idade -= 1
        end

        return idade
    end

    def idade_mes

        return (Date.today.month - self.birthdate.month)%12
    end


    def correct_image_type
        if image.attached? && !image.content_type.in?(%w(image/jpeg image/png image/jpg))
            errors.add(:image, 'must be a JPEG or PNG or JPG!')
        elsif image.attached? == false
            errors.add(:image, 'required!')
        end
    end
end
