
# default jquery "$(document).ready ->" will not work becuse of Turbolinks

$(document).on 'page:change', ->
  # by default hide menus
  $(".left_menu_selector").children().hide()

  $(".wrap_bottom_menu").on "click", ".bottom_menu_icon", ->
    # bottom menu elements should change their color on click
    $(".bottom_menu_icon").removeClass("clicked_menu_icon")
    $(this).addClass("clicked_menu_icon")
    # click on button will enable specific left menu - automatic by finding the name of the icon
    # specific for this case
    $(".left_menu_selector").children().hide()
    button_value = $(this).next().text().toLowerCase().trim()
    # menu must be wrapped in a class with specific name like "left_menu_grid"
    $(".left_menu_#{button_value}").show()

  $(".wrap_left_menu").on "click", ".left_menu_content > button", ->
    $(".left_menu_content > button").removeClass("clicked_menu_button")
    $(this).addClass("clicked_menu_button")


  #hide navbar on scroll
  $("#show_menu_button").hide()
  showMainMenu = ->
    $("#main_navbar").removeClass("hide_nav").addClass("show_nav")
    $("#show_menu_button").hide()

  $(window).scroll (event) ->
    # if scroll to top or to bottom, show menu
    if ($(this).scrollTop() == 0) || ($(this).scrollTop() == $(document).height() - $(window).height() )
      showMainMenu()

    # else hide menu
    else if $("#main_navbar").hasClass "show_nav"
      $("#main_navbar").removeClass("show_nav").addClass("hide_nav")
      $("#show_menu_button").fadeIn(700)
  #show menu on bottom hover or button click(for mobile)
  $(document).on "mouseenter", "#show_menu_button", ->
    showMainMenu()
  $(document).on "click", ".button_show", ->
    showMainMenu()
