namespace :import do
  desc "Importa os depoimentos para o banco de dados"
  task testimonials: :environment do
    file_path = Rails.root.join('testimonials.json')

    if File.exist?(file_path)
      testimonials = JSON.parse(File.read(file_path))
      testimonials.each do |t|
        Testimonial.create!(name: t["name"], content: t["content"])
      end
      puts "Depoimentos importados com sucesso!"
    else
      puts "Arquivo testimonials.json não encontrado!"
    end
  end
end

