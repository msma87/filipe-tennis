class Testimonial < ApplicationRecord
  has_one_attached :photo

  validates :name, presence: true
  validates :content, presence: true

  # Método para validar formato e tamanho da imagem
  validate :validate_photo_format

  private

  def validate_photo_format
    return unless photo.attached?

    unless photo.content_type.in?(%w(image/jpeg image/png))
      errors.add(:photo, "deve ser um arquivo JPEG ou PNG.")
    end

    if photo.blob.byte_size > 5.megabytes
      errors.add(:photo, "não pode ser maior que 5MB.")
    end
  end
end
