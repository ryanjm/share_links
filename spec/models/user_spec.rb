require 'spec_helper'

describe User do
  VALID_URL = "http://google.com"
  before :each do
    @w = WebLink.create(url: VALID_URL)
    @r = User.create(name: "Ryan")
  end

  context "open_links" do
    it "should return empty if there are no open links" do
      @w.archive!
      @r.open_links.length.should eq(0)
    end
    it "should return the open link" do
      @r.open_links.length.should eq(1)
    end
    it "return empty if link archived for the user but open for others" do
      m = User.create(name: "Michelle")
      @w.archive(@r)
      @r.open_links.length.should eq(0)
      m.open_links.length.should eq(1)
    end
  end

  context "#archived_web_links" do
    it "should get a archived link if they archived one" do
      @w.archive(@r)
      @r.archived_web_links.should eq([@w])
    end

    it "should not get an archived link by a different user" do
      m = User.create(name: "Michelle")
      @w.archive(m)
      @r.archived_web_links.should eq([])
    end

    it "shouldn't get any archived links if there aren't any" do
      @r.archived_web_links.count.should eq(0)
    end
  end


end
