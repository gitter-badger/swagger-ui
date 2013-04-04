class HeaderView extends Backbone.View
  events: {
    'click #input_selectServer'      : 'showCustom'
    #'click #show-pet-store-icon'    : 'showPetStore'
    #'click #show-wordnik-dev-icon'  : 'showWordnikDev'
    #'click #explore'                : 'showCustom'
    #'keyup #input_baseUrl'          : 'showCustomOnKeyup'
    #'keyup #input_apiKey'           : 'showCustomOnKeyup'
  }

  initialize: ->


  #showPetStore: (e) ->
  #  @trigger(
  #    'update-swagger-ui'
  #    {discoveryUrl:"http://petstore.swagger.wordnik.com/api/api-docs.json", apiKey:"special-key"}
  #  )

  #showWordnikDev: (e) ->
  #  @trigger(
  #    'update-swagger-ui'
  #    {discoveryUrl:"http://api.wordnik.com/v4/resources.json", apiKey:""}
  #  )

  #showCustomOnKeyup: (e) ->
  #  @showCustom() if e.keyCode is 13

  #showCustom: (e) ->
  #  e?.preventDefault()
  #  @trigger(
  #    'update-swagger-ui'
  #    {discoveryUrl: $('#input_baseUrl').val(), apiKey: $('#input_apiKey').val()}
  #  )

  showCustom: (e) ->
    url = $('#input_selectServer').val()
    log 'switching to ' + url
    @trigger(
      'update-swagger-ui'
      {discoveryUrl: url, ""}
    )

  update: (url, apiKey, trigger = false) ->
    #$('#input_baseUrl').val url
    #$('#input_apiKey').val apiKey
    @trigger 'update-swagger-ui', {discoveryUrl:url, apiKey:apiKey} if trigger
