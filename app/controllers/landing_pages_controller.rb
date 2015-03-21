class LandingPagesController < ApplicationController

  def landing
    @subject = Subject.last
    @understanding = Understanding.new
    render layout: "landing_page/landing_layout"
  end
end
