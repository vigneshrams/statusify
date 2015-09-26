module ApplicationHelper
  def all_incidents
    Incident.all.order('updated_at DESC')
  end

  def visible_incidents
    @visible_incidents = []
    if signed_in?
      @visible_incidents = all_incidents.to_a
    else
      all_incidents.each do |i|
        @visible_incidents << i if i.public == true
      end
    end
    @visible_incidents
  end

  def active_incidents
    @active_incidents = []
    visible_incidents.each do |i|
      @active_incidents << i if i.active == true
    end
    @active_incidents
  end

  def inactive_incidents
    @inactive_incidents = []
    visible_incidents.each do |i|
      @inactive_incidents << i if i.active != true
    end
    @inactive_incidents
  end

  def all_events(incident)
    return unless incident.is_a? Incident
    all_events ||= incident.events.order('updated_at DESC')
    all_events
  end

  def last_event(incident)
    return unless incident.is_a? Incident
    last_event ||= all_events(incident).first
    last_event
  end

end
