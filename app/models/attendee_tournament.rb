class AttendeeTournament < ActiveRecord::Base
  include YearlyModel

  belongs_to :attendee
  belongs_to :tournament
  validates_presence_of :attendee, :tournament
  validates_length_of :notes, :maximum => 50

  before_validation do |at|
    if at.tournament.year != at.attendee.year
      raise "Attendee and Tournament have different years"
    end
    at.year ||= at.attendee.year
  end

  def self.tmt_names_by_attendee(year)
    attendee_tournaments = Hash.new
    AttendeeTournament.yr(year).includes(:tournament).order(:attendee_id).each do |at|
      if at.tournament.present? then
        if attendee_tournaments[at.attendee_id].nil?
          attendee_tournaments[at.attendee_id] = Array.new
        end
        attendee_tournaments[at.attendee_id].push(at.tournament.name)
      end
    end
    return attendee_tournaments
  end

end
