productMap = {}

getExcludeNumbers = (element)->
  $('.items .order_items_number input').not(element).map ->
    if $(@).val().length
      $(@).val()
  .get()


addItemBlock = (element) ->
  number_input = $(element).find('.order_items_number input')
  name_input = $(element).find('.order_items_name input')
  $(name_input).typeahead
    source: (query, process)->
      productMap = {}
      productNames = []
      $.get '/products/typeahead', { query: query, exclude: getExcludeNumbers(name_input)  }, (data)->
        $.each data, (i, product)->
          productMap[product.title] = product.number
          productNames.push(product.title)
        process(productNames)
    updater: (item)->
      $(number_input).val(productMap[item])
      item

  removeLink = $(element).find('.remove-item-link')
  $(removeLink).on 'click', ->
    if $('.items .controls-row').length > 1
      $(element).remove()

$ ->
  $('.items .controls-row').each (endex, element)->
    addItemBlock(element)

  $('.add-item-link').on 'click', ->
    element = $('#item-template .controls-row:first').clone()
    element.appendTo('.items')
    addItemBlock(element)
