class FundRequest
  attr_reader :project_current_funding, :project_target_funding, :project_name, :project_start_date
  attr_writer :project_name

  def initialize(name, current_funding=0, target_funding, date_started)
    @project_name = name.upcase
    @project_current_funding = current_funding
    @project_target_funding = target_funding
    @project_start_date = date_started
  end

  def to_s
    "Project #{@project_name} was created on #{@project_start_date}. Currently they have raised $#{@project_current_funding}."
  end

  def remaining
    funds_to_go = @project_target_funding - @project_current_funding
    "\tThey need $#{funds_to_go} to hit their goal of $#{@project_target_funding}\n\n"
  end

  def add_funding(amount)
    @project_current_funding += amount
    if @project_current_funding >= @project_target_funding
      "The project has reached or exceeded their goal of $#{@project_target_funding}!!!"
    else
      "The project received $#{amount} in funding."
    end

  end

  def remove_funding(amount)
    if @project_current_funding != 0
      @project_current_funding -= amount
      "The project lost $#{amount} in funding."
    else
      "The project has no funding to lose"
    end
  end
end