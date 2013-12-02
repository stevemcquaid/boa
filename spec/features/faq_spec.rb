require 'spec_helper'

describe "The Page: FAQs", :type => :feature do
  before :all do
    load "#{Rails.root}/db/seeds.rb" 
  end

  before :each do
    #Mocking
    @user = User.new
    @user.email = "organization@boa.com"
    @user.password = "testtest"
    @user.password_confirmation = "testtest"
    @user.name = "Test User"
    @user.add_role :admin
    @user.save  

    #Mock FAQs - handled by loading seeds
    
    
  end

  after :each do
    @user.destroy
    
    #@FAQ_arr.each { |item| item.destroy }
    
    Warden.test_reset! 
  end
  

  describe "GET /faqs" do
    it "shows basic FAQs" do
   	  login_as @user, scope: :user
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/faqs'
      
      save_and_open_page
      
      expect(page).to have_content 'FAQs'
      expect(page).to have_content 'What is Booth?'
      expect(page).to have_content 'UC Info Desk'
    end
  end

end

# def mock_FAQ()

#   faq1 = FAQ.new
#   faq1.question = "What is Booth?"
#   faq1.answer = "Booth is one of the biggest showpieces of Spring Carnival. Student organizations build multi-story structures around our annual theme (2014: Best of the Best), hosting interactive games and elaborate decorations. The booths will be placed on Midway, which is located in the Morewood Gardens Parking Lot."
#   faq1.save

#   faq2 = FAQ.new
#   faq2.question = "What do I do if something catches on fire?"
#   faq2.answer = "There are fire extinguishers located at every booth. Take one and follow the instructions listed on the can."
#   faq2.save

#   faq3 = FAQ.new
#   faq3.question = "Where does CMU get money for Carnival?"
#   faq3.answer = "Carnegie Mellon University's Spring Carnival is funded in part by your Student Activities Fee."
#   faq3.save

#   faq4 = FAQ.new
#   faq4.question = "Who won booth last year (2013)?"
#   faq4.answer = "Independent: ASA, Fraternity: Sigma Phi Epsilon, Sorority: Delta Gamma, Blitz: Mayur SASA, Environmental Award: Delta Gamma and Mudge, T-Shirt Award: TSA, Chairman's Choice: Alpha Phi"
#   faq4.save

#   faq5 = FAQ.new
#   faq5.question = "What are the hours of rides?"
#   faq5.answer = "TBD"
#   faq5.save

#   faq6 = FAQ.new
#   faq6.question = "How much are rides tickets?"
#   faq6.answer = "TBD"
#   faq6.save

#   faq7 = FAQ.new
#   faq7.question = "Are there group rates for rides tickets?"
#   faq7.answer = "No."
#   faq7.save

#   faq8 = FAQ.new
#   faq8.question = "Where do you pick up presale tickets?"
#   faq8.answer = "UC Info Desk"
#   faq8.save

#   faq9 = FAQ.new
#   faq9.question = "Can I get a wristband for the comedian?"
#   faq9.answer = "Spring Carnival does not deal with the comedian. Talk to AB."
#   faq9.save

#   faq10 = FAQ.new
#   faq10.question = "Where do I go for the green room security shift?"
#   faq10.answer = "Morewood multipurpose room. You need a radio and jackets. And no, you cannot eat the food."
#   faq10.save

#   faq11 = FAQ.new
#   faq11.question = "What do I do if the comedian shows up?"
#   faq11.answer = "Call student activities (Tim)."
#   faq11.save

#   faq12 = FAQ.new
#   faq12.question = "Alumni is complaining about their tent."
#   faq12.answer = "Call Nick."
#   faq12.save

#   faq13 = FAQ.new
#   faq13.question = "Alumni needs something special."
#   faq13.answer = "Call Jackson or Emily."
#   faq13.save

#   faq14 = FAQ.new
#   faq14.question = "When do dumpsters go out?"
#   faq14.answer = "They must be by the back of Morewood lot by 5am."
#   faq14.save

#   faq15 = FAQ.new
#   faq15.question = "What is downtime?"
#   faq15.answer = "When a booth takes time to close their booth and have it not manned during operations. They must register the start of their downtime (you should track this) and put caution tape up to close off the doorways. They should also tell you when they are ending their downtime."
#   faq15.save

#   faq16 = FAQ.new
#   faq16.question = "How much downtime does an org get?"
#   faq16.answer = "4 hours."
#   faq16.save

#   faq17 = FAQ.new
#   faq17.question = "How do I check how much downtime an org has left?", 
#   faq17.answer = "TBD"
#   faq17.save

#   faq18 = FAQ.new
#   faq18.question = "A booth tripped a breaker. What do I do?"
#   faq18.answer = "Add them to Dan's queue. Mark the fine in app if applicable."
#   faq18.save

#   faq19 = FAQ.new
#   faq19.question = "Someone has a minor injury (splinter, small cut, dust in eye, etc.)."
#   faq19.answer = "Give them equipment from the medical kit in the trailer. Tell them they can call EMS if they want. DO NOT ADMINISTER MEDICAL ASSISTANCE."
#   faq19.save

#   faq20 = FAQ.new
#   faq20.question = "EMS is closed. What do I do?"
#   faq20.answer = "Call them."
#   faq20.save

#   faq21 = FAQ.new
#   faq21.question = "I saw an ambulance take someone to the hospital. What do I do?", 
#   faq21.answer = "Call Jackson or Emily immediately."
#   faq21.save

#   faq22 = FAQ.new
#   faq22.question = "Someone wants to drop off in the firelane. Can they do that?"
#   faq22.answer = "No, unless they are Cyert, food delivery for Underground, fire, police, EMS, FMS, people with passes, or an approved delivery (Rachel, Emily, or Jackson says it's OK)."
#   faq22.save

#   faq23 = FAQ.new
#   faq23.question = "Golf cart problem?"
#   faq23.answer = "Call Meg."
#   faq23.save

#   faq24 = FAQ.new
#   faq24.question = "Missing golf cart."
#   faq24.answer = "Call Meg."
#   faq24.save

#   faq25 = FAQ.new
#   faq25.question = "If someone legitimately needs a golf cart..."
#   faq25.answer = "...radio for golfcart."
#   faq25.save

#   faq26 = FAQ.new
#   faq26.question = "A booth chair is freaking out, sad, angry, etc. What do I do?"
#   faq26.answer = "Call Rachel."
#   faq26.save

#   faq27 = FAQ.new
#   faq27.question = "University official wants to borrow something. What do I do?"
#   faq27.answer = "Let them. They do not need to sign a waiver. Ideally, check it out to Jackson, Emily, or Rachel to track it in the app."
#   faq27.save

#   faq28 = FAQ.new
#   faq28.question = "The next coordinator doesn't show up. What do I do?"
#   faq28.answer = "Call them repeatedly. If that fails, call the Nicks."
#   faq28.save

#   faq29 = FAQ.new
#   faq29.question = "Booth watch shift doesn't show up. What do I do?"
#   faq29.answer = "Do not let previous watch shift leave. Call booth chairs of that org in order until someone answers. Fine them accordingly in the app. If no one can show up and old watch shift has to leave, split the other watch shift."
#   faq29.save

#   faq30 = FAQ.new
#   faq30.question = "Drunk people won't listen. What do I do?"
#   faq30.answer = "Call the police."
#   faq30.save

#   faq31 = FAQ.new
#   faq31.question = "Booth chair is asking questions I don't understand. What do I do?"
#   faq31.answer = "Put them in Rachel's queue. Leave a note if necessary."
#   faq31.save

#   faq32 = FAQ.new
#   faq32.question = "Parking complains about Asian row. What do I do?", 
#   faq32.answer = "Tell Asian row to clear their stuff out. If they won't listen, call Rachel."
#   faq32.save

#   faq33 = FAQ.new
#   faq33.question = "What should the 12am-4am watch shifts do?"
#   faq33.answer = "MOVE THE DUMPSTERS TO THE FIRELANE BY THE TENT. Check the radio station. Make sure no one is doing anything stupid (climbing on roofs, having sex in booths, etc.)."
#   faq33.save

#   faq34 = FAQ.new
#   faq34.question = "What's the difference between a security and watch shift?"
#   faq34.answer = "Security is paid, watch is not. Watch shifts are booth orgs, while security are non-building orgs."
#   faq34.save

#   faq35 = FAQ.new
#   faq35.question = "What do I do with my drunk watch/security shift that just showed up?"
#   faq35.answer = "Send them home, call their booth chair, and inform them of what happened and that they are getting fined unless they supply new, sober people."
#   faq35.save

#   faq36 = FAQ.new
#   faq36.question = "AB tech asks for the keys to the scissor lift."
#   faq36.answer = "Call Nick."
#   faq36.save

#   faq37 = FAQ.new
#   faq37.question = "Taylor Rental needs something."
#   faq37.answer = "Call Nick."
#   faq37.save

#   faq38 = FAQ.new
#   faq38.question = "Where do I find the midway layout?"
#   faq38.answer = "In the app, under documents!"
#   faq38.save

#   faq39 = FAQ.new
#   faq39.question = "Madelyn Miller calls. What do I do?"
#   faq39.answer = "Listen to her. Then call Emily/Jackson/Rachel and relay the message."
#   faq39.save

#   faq40 = FAQ.new
#   faq40.question = "It's raining and people are losing electricity."
#   faq40.answer = "Wait until the rain stops, then tell them to suck it up and we'll deal with it."
#   faq40.save

#   faq41 = FAQ.new
#   faq41.question = "It's super windy. Things are flying off of booths."
#   faq41.answer = "Check weather on trailer computer. Call Emily/Jackson/Rachel with that information."
#   faq41.save

#   return [faq1, faq2, faq3, faq4, faq5, faq6, faq7, faq8, faq9, faq10,
#           faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20,
#           faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, faq29, faq30,
#           faq31, faq32, faq33, faq34, faq35, faq36, faq37, faq38, faq39, faq40,
#           faq41]
# end