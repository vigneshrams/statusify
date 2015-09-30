class PagesController < ApplicationController
  def index
    @incidents ||= Incident.all
  end
  def history
    # The incident history. Shows all the ancient incidents since the index page shows only five of them.
    @dated_incidents |e|= dated_incidents
  end
end
