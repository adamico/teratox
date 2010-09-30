module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def dossier_index
    "/dossiers"
  end
end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
