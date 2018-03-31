require 'test_helper'

class FramingControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @framing = Framing.create(id: 1, 
                              desc: "single phase\nsingle primary support", 
                              coserv: "VA1", 
                              oncor: "108-205", 
                              tnmp: "OH-6-100", 
                              trinity_valley: "VA1", 
                              created_at: "2018-03-26 14:10:44", 
                              updated_at: "2018-03-26 14:10:44")
    @image   = Image.create(  id: 1, 
                              url: "coserv_va1.jpg", 
                              framing_id: 1, 
                              created_at: "2018-03-26 14:10:45", 
                              updated_at: "2018-03-26 14:10:48", 
                              page: "23")
    @image   = Image.create(  id: 2, 
                              url: "oncor_108-205.jpg", 
                              framing_id: 1, 
                              created_at: "2018-03-26 14:10:45", 
                              updated_at: "2018-03-26 14:10:48", 
                              page: "23")
    @image   = Image.create(  id: 3, 
                              url: "tnmp_OH-6-100.jpg", 
                              framing_id: 1, 
                              created_at: "2018-03-26 14:10:45", 
                              updated_at: "2018-03-26 14:10:48", 
                              page: "23")
    @image   = Image.create(  id: 4, 
                              url: "trinity_valley_va1.jpg", 
                              framing_id: 1, 
                              created_at: "2018-03-26 14:10:45", 
                              updated_at: "2018-03-26 14:10:48", 
                              page: "23")
    @company = Company.create(name: 'coserv',
                              visible: true)
    @company = Company.create(name: 'oncor',
                              visible: true)
    @company = Company.create(name: 'tnmp',
                              visible: true)
    @company = Company.create(name: 'trinity_valley',
                              visible: true)

  end
  
  test "should load root" do
    get root_path
    assert_response :success
    assert_select "title", "FramingHelper"
    assert_select "td", "single phase\nsingle primary support"
    assert_select "td", "VA1", count: 2
    assert_select "td", "108-205"
    assert_select "td", "OH-6-100"
  end

  test "pdf link should exist" do
    get root_path
    domain = 'https://framing-helper-bucket-20180320.s3.amazonaws.com'
    assert_select 'a[href=?]', "#{domain}/standards/coserv.pdf"
  end
 
  test "should only load visible companies" do
    company = Company.find_by(name: 'tnmp')  
    
  end 
  
end