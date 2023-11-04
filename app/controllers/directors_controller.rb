class DirectorsController < ApplicationController
  def index
    render ({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where({:id => the_id})
    @the_director = matching_records.at(0)

    render ({ :template => "director_templates/details"})
  end

  def young
    exclude_nil = Director.where.not({ :dob => nil })
    @youngest_dob = exclude_nil.maximum(:dob)
    matching_record = Director.where({ :dob => @youngest_dob})
    @youngest_dir = matching_record.at(0).name
    @youngest_id = matching_record.at(0).id
    render ({ :template => "director_templates/young"})
  end

  def old
    exclude_nil = Director.where.not({ :dob => nil })
    @eldest_dob = exclude_nil.minimum(:dob)
    matching_record = Director.where({ :dob => @eldest_dob})
    @eldest_dir = matching_record.at(0).name
    @eldest_id = matching_record.at(0).id
    render ({ :template => "director_templates/old"})
  end

  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where({:id => the_id})
    @the_director = matching_records.at(0)

    render ({ :template => "director_templates/details"})
  end

end
