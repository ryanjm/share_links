require 'spec_helper'

describe WebLink do
  VALID_URL = "http://google.com"
  before :each do
    @w = WebLink.create(url: VALID_URL)
    @r = User.create(name: "Ryan")
  end


  context ".archived" do
    it "should return empty if there are no archived links" do
      WebLink.archived.length.should eq(0)
    end
    it "should return the archived links" do
      @w.archive!
      WebLink.archived.length.should eq(1)
    end
  end

  context ".open_for" do
    it "should return empty if there are no open links" do
      @w.archive!
      WebLink.open_for(@r).length.should eq(0)
    end
    it "should return the open link" do
      WebLink.open_for(@r).length.should eq(1)
    end
    it "return empty if link archived for the user but open for others" do
      m = User.create(name: "Michelle")
      @w.archive(@r)
      WebLink.open_for(@r).length.should eq(0)
    end
  end

  context "#all_archived?" do
    it "should return false if no one has archived" do
      @w.all_archived?.should be_false
    end

    it "returns true if everyone has archived" do
      @w.archive(@r)
      @w.all_archived?.should be_true
    end
  end

  context "#archive!" do
    it "should mark archived" do
      @w.archived.should be_false
      @w.archive!
      @w.archived.should be_true
    end
  end
  
  context "#archive" do
    it "can add an archive object for a user" do
      @w.archive(@r)
      @w.archive_links.count.should eq(1)
    end

    it "@w.n't add two archives for the same person" do
      @w.archive(@r)
      @w.archive(@r)
      @w.archive_links.count.should eq(1)
    end 

    it "archive link if everyone has archived it" do
      m = User.create(name: "Michelle")
      @w.archive(@r)
      @w.archived.should be_false
      @w.archive(m)
      @w.archived.should be_true
    end
  end

end
