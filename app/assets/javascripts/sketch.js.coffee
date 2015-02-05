# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->

  # generating the squares
  $(".wrap_left_menu").on "click", ".left_menu_grid button", ->
    $(".yield_content").empty()
    # getting data size from html (16, 32 64)
    squares_per_line = $(this).data('size')
    container_width = $(".yield_content").innerWidth()
    squares_width = ((container_width - (squares_per_line*2))/squares_per_line) | 0
    counter1 = 0
    while counter1 < squares_per_line
      $(".yield_content").append("<div class='generate_row'></div>")
      counter1++
      counter2 = 0
      while counter2 < squares_per_line
        $(".generate_row").last().append("<div class='generate_square'></div>")
        counter2++

    $(".generate_square").height(squares_width)
    $(".generate_square").width(squares_width)

  # render effects
  $(".wrap_left_menu").on "click", ".left_menu_effects button", ->
    $(".yield_content div div").css
      'opacity': '1',
      'background-color': 'black'
    # "off" removes the effects of on mouse enter and leave
    $(".yield_content div").off()

    # effect B&W
    if $(this).data('effect') == "bnw"
      $(".yield_content div").on "mouseenter", "div", ->
        $(this).css("opacity", "0")

    # effect Snail
    if $(this).data('effect') == "snail"
      $(".yield_content div").on "mouseenter", "div", ->
        $(this).css("opacity", "0")
      $(".yield_content div").on "mouseout", "div", ->
        # current needs to be defined in order to work with setInterval
        current_square = $(this)
        square_opacity = 0

        snail_effect = setInterval (->
          square_opacity += 0.05
          current_square.css 'opacity', square_opacity
          if square_opacity >= 1
            clearInterval(snail_effect)
          ), 50

    # effect Random
    if $(this).data('effect') == "random"
      $(".yield_content div").on "mouseenter", "div", ->
        console.log "test"
        $(this).css("background", "#" + Math.floor(Math.random()*16777215).toString(16))

    # effect Persistent
    if $(this).data('effect') == "persistent"
      $(".yield_content div").on "mouseenter", "div", ->
        current_opacity = $(this).css("opacity")
        if current_opacity > 0
          $(this).css("opacity", current_opacity - 0.2)
