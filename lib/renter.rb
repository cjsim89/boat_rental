class Renter
  attr_reader :name,
              :cc_num

  def initialize(name, cc_num)
    @name = name
    @cc_num = cc_num
  end
end
