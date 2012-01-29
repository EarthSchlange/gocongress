class SlideSet
  attr_reader :slides
  
  def initialize(year)
    conf_file = File.join(slides_dir(year), "slideshow.yml")
    raise "File Not Found: #{conf_file}" unless File.exists?(conf_file)
    config = YAML.load_file(conf_file)
    @slides = config["slides"]
  end
  
  # `slides_as_arrays` provides the legacy format
  # that the view helper expects.
  def slides_as_arrays
    @slides.map{ |s| [ s["title"], s["subtitle"] ] }
  end

private

  def slides_dir(year)
    File.join(Rails.root, "app", "assets", "images", "slideshow", year.to_s)
  end

end