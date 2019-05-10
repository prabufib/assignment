class QuestionnairesController < InheritedResources::Base

  private

    def questionnaire_params
      params.require(:questionnaire).permit()
    end

end
