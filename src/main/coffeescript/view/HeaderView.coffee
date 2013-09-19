class HeaderView extends Backbone.View
  events: {
    # MEDvision specific: use input list for selecting APIs
    'change #input_selectServer'    : 'showCustom'
    #'click #show-pet-store-icon'    : 'showPetStore'
    #'click #show-wordnik-dev-icon'  : 'showWordnikDev'
    #'click #explore'                : 'showCustom'
    #'keyup #input_baseUrl'          : 'showCustomOnKeyup'
    #'keyup #input_apiKey'           : 'showCustomOnKeyup'
  }

  initialize: ->

  showPetStore: (e) ->
    @trigger(
      'update-swagger-ui'
      {url:"http://petstore.swagger.wordnik.com/api/api-docs"}
    )

  showWordnikDev: (e) ->
    @trigger(
      'update-swagger-ui'
      {url:"http://api.wordnik.com/v4/resources.json"}
    )

  showCustomOnKeyup: (e) ->
    @showCustom() if e.keyCode is 13

  showCustom: (e) ->
    e?.preventDefault()
    url = $('#input_selectServer').val()
    @trigger(
      'update-swagger-ui'
      {url: url, apiKey: $('#input_apiKey').val()}
    )

  update: (url, apiKey, trigger = false) ->
    $('#input_baseUrl').val url
    #$('#input_apiKey').val apiKey
    @trigger 'update-swagger-ui', {url:url} if trigger
