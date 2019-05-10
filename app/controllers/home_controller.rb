class HomeController < ApplicationController
  def home
  	@questionnaires = Questionnaire.where(active: true)
  end

  def follow_questionnaire
  	@questionnaire = Questionnaire.where(id: params[:questionnaire_id]).last
  	if @questionnaire.present?
  	  @questionnaire.follow_questionnaires.create(user_id: params[:current_user_id])
  	  render json: {message: "You are now following #{@questionnaire.name}"}
  	else
  	  render json: {message: "Something went wroung"}
  	end
  end

  def get_follows
    @questionnaires = current_user.questionnaires
    render template: "home/home"
  end
end