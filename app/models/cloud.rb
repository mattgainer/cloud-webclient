class Cloud

  attr_accessor :name, :precipitation, :composition, :min_altitude, :max_altitude, :units, :id
  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @precipitation = hash["precipitation"]
    @composition = hash["composition"]
    @min_altitude = hash["min"]
    @max_altitude = hash["max"]
    @units = hash["units"]
  end


  def self.find(id)
    cloud_hash = Unirest.get("http://localhost:3000/api/v1/clouds/#{id}.json").body
    Cloud.new(cloud_hash)
  end

  def self.all
    final = []
    Unirest.get("http://localhost:3000/api/v1/clouds.json").body.each do |cloud_hash|
      final << Cloud.new(cloud_hash)
    end
    return final
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/clouds/#{id}.json", headers: {"Accept" => "application/json"})
  end

  def self.create(attributes)
    Employee.new(Unirest.post("http://localhost:3000/api/v1/clouds.json", headers: {"Accept" => "application/json"}, parameters: attributes).body)
  end

  def update(attributes)
    Unirest.patch("http://localhost:3000/api/v1/clouds/#{id}.json", headers: {"Accept" => "application/json"}, parameters: attributes)
  end

end