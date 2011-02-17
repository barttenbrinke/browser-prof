require 'test_helper'

class SlowControllerTest <  ActionController::TestCase
	test "should profile" do
		get :profile_me, :params => {}
		assert_response :success
		assert_equal "slow action", @response.body
	end

	test "should have mixin" do
	  assert @controller.respond_to?(:process_with_browser_profiling)
	end

	test "should profile param adds profile" do
		get :profile_me, :params => {"browser_profile!" => ""}
		assert_response :success

		assert profiled?(@response.body)
	end

	test "should output to file" do
		clean_outfile

		get :profile_me, :params => {"file_profile!" => ""}
		assert_response :success

		assert ! profiled?(@response.body)
		assert File.exists?(profile_out_file)
		assert profiled?(File.read(profile_out_file))

		clean_outfile
	end

end
