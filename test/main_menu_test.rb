require 'minitest/autorun'
require 'minitest/pride'
require './lib/main_menu'

class MainMenuTest < Minitest::Test

  def test_it_exists
    main_menu = MainMenu.new

    assert_instance_of MainMenu, main_menu
  end
end
