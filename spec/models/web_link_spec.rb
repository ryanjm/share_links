require 'spec_helper'

describe WebLink do
  VALID_URL = "http://google.com"
  
  context "#archive" do
    it "can add an archive object for a user" do
      w = WebLink.create(url: VALID_URL)
      u = User.create(name: "Ryan")
      w.archive(u)
      w.archives.count.should eq(1)
    end
  end

end
