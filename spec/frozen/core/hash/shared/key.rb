describe :hash_key_p, :shared => true do
  it "returns true if argument is a key" do
    h = new_hash(:a => 1, :b => 2, :c => 3, 4 => 0)
    h.send(@method, :a).should == true
    h.send(@method, :b).should == true
    h.send(@method, 'b').should == false
    h.send(@method, 2).should == false
    h.send(@method, 4).should == true
    h.send(@method, 4.0).should == false
  end

  it "returns true if the key's matching value was nil" do
    new_hash(:xyz => nil).send(@method, :xyz).should == true
  end

  it "returns true if the key's matching value was false" do
    new_hash(:xyz => false).send(@method, :xyz).should == true
  end

  it "returns true if the key is nil" do
    new_hash(nil => 'b').send(@method, nil).should == true
    new_hash(nil => nil).send(@method, nil).should == true
  end

  it "returns false for objects with the same hash" do
    o1 = Object.new
    def o1.hash() 0 end

    o2 = Object.new
    def o2.hash() 0 end

    new_hash(o1 => nil).send(@method, o2).should == false
  end
end
