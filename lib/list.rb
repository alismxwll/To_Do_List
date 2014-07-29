class List
  def initialize(name)
    @name = name
    @tasks = []
  end

  def name
    @name
  end

  def tasks
    @tasks
  end

  def add_task(input)
    @tasks << input
  end

end
