class MemberResponse
  attr_accessor :id, :dob, :status, :ethnicity, :weight, :height, :vegan, :drinks, :image

  def initialize(member_json)
    @id = member_json["id"] 
    @dob = Date.parse(member_json["dob"]) rescue nil
    @status = member_json["status"]
    @ethnicity =  member_json["ethnicity"]
    @weight = (member_json["weight"].to_f/1000).round(2)
    @height = member_json["height"]
    @vegan = (member_json["is_veg"] == "1")
    @drinks = (member_json["drink"] == "1")
    @image = member_json["image"]
  end 
end