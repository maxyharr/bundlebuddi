# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.add-subscription').on "click", ->
    unbundled_cost = parseInt(parseFloat($('#unbundled-cost').text().substring(1)) * 100)
    subscription_cost = parseInt($(this).closest('.subscription-row').find('.cost-in-cents').first().val())
    new_cost = 0

    if ($(this).text() == 'Add')
      $(this).text('Added')
      $(this).removeClass('btn-secondary')
      $(this).addClass('btn-success')

      new_cost = unbundled_cost + subscription_cost
    else
      $(this).text('Add')
      $(this).removeClass('btn-success')
      $(this).addClass('btn-secondary')
      new_cost = unbundled_cost - subscription_cost

    $('#unbundled-cost').text('$' + new_cost/100.0)


