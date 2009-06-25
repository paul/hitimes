require File.expand_path( File.join( File.dirname( __FILE__ ), "spec_helper.rb" ) )

require 'hitimes/group_metric'

describe Hitimes::GroupMetric do

  it "should measure something by name" do
    Hitimes::GroupMetric.measure("test") { sleep 0.01 }
    Hitimes::GroupMetric["test"].should be_kind_of(Hitimes::TimedMetric)
  end

  it "should provide a list of collected measurements" do
    Hitimes::GroupMetric.measure("test1") { sleep 0.01 }
    Hitimes::GroupMetric.measure("test2") { sleep 0.01 }

    Hitimes::GroupMetric.measurements.should have(2).elements
  end

  it "should be thread-safe"

  after do
    Hitimes::GroupMetric.reset!
  end

end

