require 'spec_helper'

RSpec.describe CreateUdlModule do
  let(:context) { 
    CreateUdlModule.call( user: user, udl_module_params: attributes_for(:udl_module), params: {} ) 
  }
  let(:context_with_faculty_param) { 
    CreateUdlModule.call( user: user, udl_module_params: attributes_for(:udl_module), params: { :author_is_contributing_faculty => true } ) 
  }
  let(:context_with_incorrect_mod_params) { 
    CreateUdlModule.call( user: user, udl_module_params: attributes_for(:udl_module, title: '', slug: ''), params: { :author_is_contributing_faculty => true } ) 
  }
  let(:user) { create(:user) }
  let(:udl_module) { class_double(UdlModule) }
  let(:udl_module_section) { class_double(UdlModuleSection) }
  let(:shared_introduction_section) { create(:shared_introduction_section) }
  
  describe "call" do
    context "with correct attributues" do
      it "succeeds" do
        expect(context).to be_a_success
      end

      it "sets the module slug equal to the title" do
        expect(context.udl_module.slug).to eq(context.udl_module.title.parameterize)
      end

      it "adds the user as an author" do
        expect(context.udl_module.authors).to match_array([user])
      end

      context "without author_is_contributing_faculty_param" do
        it "does not add the user to udl_module#faculty" do
          expect(context.udl_module.faculty).to_not include(user)
        end
      end

      context "with author_is_contributing_faculty_param" do
        it "adds the user to udl_module#faculty" do
          expect(context_with_faculty_param.udl_module.faculty).to include(user)
        end
      end
      
      context "when shared sections are available" do
        before do
          allow(udl_module_section).to receive(:shared_sections).and_return( [shared_introduction_section] )
        end

        it "should add shared sections" do
          expect(context.udl_module.sections).to include( shared_introduction_section )
        end
      end
    end

    context "with incorrect attributes" do
      
      it "should fail the context" do
        expect(context_with_incorrect_mod_params).to be_a_failure
      end
    end
  end
end
