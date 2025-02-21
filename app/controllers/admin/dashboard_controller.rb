module Admin
  class DashboardController < BaseController
    def index
      @total_users = User.count
      @total_lessons = Lesson.count
      @total_testimonials = Testimonial.count
    end
  end
end
