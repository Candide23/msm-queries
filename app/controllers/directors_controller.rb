class DirectorsController < ApplicationController
  def index
    render({  :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({:id => the_id})

    @the_director =  matching_records.at(0)
    render({  :template => "director_templates/details"})
  end

  def youngest

    the_youngest = Director.where.not({ :dob => nil}).order({ :dob => :desc})
    @youngest = the_youngest.at(0);
    dob =   @youngest.dob
    @date_formatted = dob.strftime("%B %d, %Y")
    render({  :template => "director_templates/youngest"})

  end

  def eldest

    the_eldest = Director.where.not({ :dob => nil}).order({ :dob => :asc})
    @eldest = the_eldest.at(0);
    dob =   @eldest.dob
    @date_formatted = dob.strftime("%B %d, %Y")
    render({  :template => "director_templates/eldest"})

  end
  
end
